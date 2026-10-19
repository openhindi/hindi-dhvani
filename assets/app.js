/**
 * Hindi Pushtak — Typst Browser WASM Application
 *
 *  - Client-side Typst compilation via WebAssembly (@myriaddreamin/typst.ts)
 *  - Devanagari font loading (Noto Sans / Noto Serif Devanagari)
 *  - Vector SVG preview of each A4 page
 *  - Native binary PDF download ($typst.pdf)
 *  - Contents drawer with active-page tracking
 *  - Light / dark theme (stored choice, else system preference)
 */

import { $typst, loadFonts } from './typst.bundle.js';

(function () {
  'use strict';

  /* ==========================================================================
   * 1. CONFIGURATION & STATE
   * ========================================================================== */

  const CONFIG = Object.freeze({
    typstUrl: 'hindi-pushtak.typ',
    themeKey: 'hindi-book-theme',
    pdfFileName: 'hindi-pushtak.pdf',
    compilerWasm: 'assets/typst_ts_web_compiler_bg.wasm',
    rendererWasm: 'assets/typst_ts_renderer_bg.wasm',
    page: { width: 596, height: 842 },
    fonts: [
      'assets/NotoSansDevanagari-Regular.ttf',
      'assets/NotoSerifDevanagari-Regular.ttf',
      'assets/NotoSerifDevanagari-Bold.ttf'
    ],
    toc: [
      { pageNum: 1, title: 'मुखपृष्ठ • Cover' },
      { pageNum: 2, title: 'पुस्तक परिचय • About the Book' },
      { pageNum: 3, title: 'विषय-सूची भाग १ • Table of Contents (1-5)' },
      { pageNum: 4, title: 'विषय-सूची भाग २ • Table of Contents (6-10)' },
      { pageNum: 5, title: 'विषय-सूची भाग ३ • Table of Contents (11-15)' },
      { pageNum: 6, title: 'विषय-सूची भाग ४ • Table of Contents (16-20)' },
      { pageNum: 7, title: 'खंड १ : अनुभाग १.१ • Devanagari Script' },
      { pageNum: 8, title: 'अनुभाग १.१ : स्वर तालिका • Vowels Table' },
      { pageNum: 9, title: 'अनुभाग १.२ : सुलेख व स्ट्रोक • Calligraphy' }
    ],
    themeColors: { light: '#e9ebf1', dark: '#0d1018' }
  });

  const state = {
    typstSource: '',
    activePage: 1,
    theme: 'light',
    busy: false,
    initialized: false,
    observer: null
  };

  const $ = (id) => document.getElementById(id);

  const DOM = {
    html: document.documentElement,
    viewport: $('book-viewport'),
 drawer: $('toc-drawer'),
 backdrop: $('drawer-backdrop'),
 drawerList: $('drawer-list'),
 btnMenu: $('btn-bookmarks'),
 btnCloseDrawer: $('btn-close-drawer'),
 btnPdf: $('btn-download-pdf'),
 toast: $('status-toast'),
 toastText: $('status-text'),
 toastSpinner: $('status-spinner'),
 themeMeta: document.querySelector('meta[name="theme-color"]')
  };

  /* ==========================================================================
   * 2. TYPST ENGINE
   * ========================================================================== */

  async function initTypstEngine() {
    if (state.initialized) return;

    $typst.setCompilerInitOptions({
      getModule: () => ({ module_or_path: CONFIG.compilerWasm })
    });

    $typst.setRendererInitOptions({
      getModule: () => ({ module_or_path: CONFIG.rendererWasm })
    });

    $typst.use({
      key: 'access-model',
      forRoles: ['compiler'],
        provides: [loadFonts(CONFIG.fonts)]
    });

    state.initialized = true;
  }

  /* ==========================================================================
   * 3. COMPILATION & RENDERING
   * ========================================================================== */

  function createPageElement(pageNum, title) {
    const el = document.createElement('article');
    el.className = 'book-page book-page-typst';
    el.id = `page-${pageNum}`;
    el.dataset.page = pageNum;
    el.setAttribute('aria-label', title);
    return el;
  }

  function renderPages(svgOutput) {
    const { width, height } = CONFIG.page;
    const doc = new DOMParser().parseFromString(svgOutput, 'image/svg+xml');
    const rootSvg = doc.querySelector('svg');
    const groups = rootSvg ? Array.from(rootSvg.querySelectorAll('.typst-page')) : [];
    const fragment = document.createDocumentFragment();

    if (groups.length > 1) {
      // Typst stacks pages vertically in one SVG. Give each page its own
      // viewBox by shifting its group back to y = 0.
      const shared = ['style', 'defs']
      .flatMap((tag) => Array.from(rootSvg.querySelectorAll(tag)))
      .map((node) => node.outerHTML)
      .join('\n');

      groups.forEach((group, idx) => {
        const pageNum = idx + 1;
        const entry = CONFIG.toc[idx] || { title: `Page ${pageNum}` };
        const el = createPageElement(pageNum, entry.title);
        el.innerHTML = `
        <svg viewBox="0 0 ${width} ${height}" width="100%" height="100%"
        xmlns="http://www.w3.org/2000/svg"
        xmlns:xlink="http://www.w3.org/1999/xlink"
        xmlns:h5="http://www.w3.org/1999/xhtml">
        ${shared}
        <g transform="translate(0, -${idx * height})">${group.outerHTML}</g>
        </svg>`;
        fragment.appendChild(el);
      });
    } else {
      const el = createPageElement(1, CONFIG.toc[0].title);
      el.innerHTML = svgOutput;
      fragment.appendChild(el);
    }

    DOM.viewport.replaceChildren(fragment);
  }

  async function compileAndRender() {
    showToast('Typesetting …', true);

    try {
      const svgOutput = await $typst.svg({ mainContent: state.typstSource });
      renderPages(svgOutput);
      renderContents();
      observePages();
    } catch (err) {
      console.error('Typst compilation failed:', err);
      showError(`Error compiling Typst document: ${err.message}`);
    } finally {
      hideToast();
    }
  }

  function showError(message) {
    const box = document.createElement('div');
    box.className = 'book-error';
    box.setAttribute('role', 'alert');
    box.textContent = message;
    DOM.viewport.replaceChildren(box);
  }

  /* ==========================================================================
   * 4. PDF EXPORT
   * ========================================================================== */

  async function downloadPdf() {
    if (state.busy) return;
    state.busy = true;
    DOM.btnPdf.disabled = true;
    showToast('Generating A4 PDF …', true);

    try {
      const pdfBytes = await $typst.pdf({ mainContent: state.typstSource });
      const url = URL.createObjectURL(new Blob([pdfBytes], { type: 'application/pdf' }));
      const link = document.createElement('a');
      link.href = url;
      link.download = CONFIG.pdfFileName;
      document.body.appendChild(link);
      link.click();
      link.remove();
      setTimeout(() => URL.revokeObjectURL(url), 1000);
      hideToast();
    } catch (err) {
      console.error('PDF export failed:', err);
      showToast('PDF export failed — opening print dialog', false, 3000);
      window.print();
    } finally {
      state.busy = false;
      DOM.btnPdf.disabled = false;
    }
  }

  /* ==========================================================================
   * 5. CONTENTS DRAWER & NAVIGATION
   * ========================================================================== */

  function renderContents() {
    const fragment = document.createDocumentFragment();

    CONFIG.toc.forEach((entry) => {
      const button = document.createElement('button');
      button.type = 'button';
      button.className = 'toc-item';
      button.dataset.page = entry.pageNum;

      const label = document.createElement('span');
      label.className = 'toc-label';
      label.textContent = entry.title;

      const badge = document.createElement('span');
      badge.className = 'toc-badge';
      badge.textContent = entry.pageNum;

      button.append(label, badge);
      button.addEventListener('click', () => {
        closeDrawer();
        goToPage(entry.pageNum);
      });
      fragment.appendChild(button);
    });

    DOM.drawerList.replaceChildren(fragment);
    setActiveContents(state.activePage);
  }

  function setActiveContents(pageNum) {
    state.activePage = pageNum;
    DOM.drawerList.querySelectorAll('.toc-item').forEach((item) => {
      if (Number(item.dataset.page) === pageNum) {
        item.setAttribute('aria-current', 'page');
      } else {
        item.removeAttribute('aria-current');
      }
    });
  }

  function observePages() {
    if (!('IntersectionObserver' in window)) return;
    if (state.observer) state.observer.disconnect();

    state.observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) setActiveContents(Number(entry.target.dataset.page));
      });
    }, { rootMargin: '-35% 0px -55% 0px' });

    DOM.viewport.querySelectorAll('.book-page').forEach((el) => state.observer.observe(el));
  }

  function openDrawer() {
    DOM.drawer.classList.add('is-open');
    DOM.backdrop.classList.add('is-open');
    DOM.btnMenu.setAttribute('aria-expanded', 'true');
    DOM.btnCloseDrawer.focus({ preventScroll: true });
    const current = DOM.drawerList.querySelector('[aria-current="page"]');
    if (current) current.scrollIntoView({ block: 'nearest' });
  }

  function closeDrawer() {
    if (!DOM.drawer.classList.contains('is-open')) return;
    DOM.drawer.classList.remove('is-open');
    DOM.backdrop.classList.remove('is-open');
    DOM.btnMenu.setAttribute('aria-expanded', 'false');
    DOM.btnMenu.focus({ preventScroll: true });
  }

  function goToPage(pageNum) {
    const target = Math.min(Math.max(pageNum, 1), CONFIG.toc.length);
    const el = $(`page-${target}`);
    if (!el) return;
    el.scrollIntoView({ behavior: 'smooth', block: 'start' });
    setActiveContents(target);
  }

  /* ==========================================================================
   * 6. THEME
   * ========================================================================== */

  const systemQuery = window.matchMedia('(prefers-color-scheme: dark)');

  function readStoredTheme() {
    try {
      const stored = localStorage.getItem(CONFIG.themeKey);
      return stored === 'dark' || stored === 'light' ? stored : null;
    } catch (e) {
      return null;
    }
  }

  function applyTheme(theme) {
    state.theme = theme;
    DOM.html.dataset.theme = theme;
    if (DOM.themeMeta) DOM.themeMeta.content = CONFIG.themeColors[theme];
  }

  function initTheme() {
    applyTheme(readStoredTheme() || (systemQuery.matches ? 'dark' : 'light'));
    systemQuery.addEventListener('change', (event) => {
      if (!readStoredTheme()) applyTheme(event.matches ? 'dark' : 'light');
    });
  }

  /* ==========================================================================
   * 7. TOAST
   * ========================================================================== */

  let toastTimer = null;

  function showToast(message, withSpinner, autoHideMs) {
    clearTimeout(toastTimer);
    DOM.toastText.textContent = message;
    DOM.toastSpinner.hidden = !withSpinner;
    DOM.toast.classList.add('is-visible');
    if (autoHideMs) toastTimer = setTimeout(hideToast, autoHideMs);
  }

  function hideToast() {
    clearTimeout(toastTimer);
    DOM.toast.classList.remove('is-visible');
  }

  /* ==========================================================================
   * 8. BOOTSTRAP
   * ========================================================================== */

  function bindEvents() {
    DOM.btnMenu.addEventListener('click', openDrawer);
    DOM.btnCloseDrawer.addEventListener('click', closeDrawer);
    DOM.backdrop.addEventListener('click', closeDrawer);
    DOM.btnPdf.addEventListener('click', downloadPdf);

    document.addEventListener('keydown', (event) => {
      if (event.key === 'Escape') closeDrawer();
    });
  }

  async function loadTypstSource() {
    const response = await fetch(CONFIG.typstUrl, { cache: 'no-cache' });
    if (!response.ok) throw new Error(`HTTP ${response.status} loading ${CONFIG.typstUrl}`);
    return response.text();
  }

  async function init() {
    initTheme();
    bindEvents();
    renderContents();

    try {
      showToast('Typesetting …', true);
      state.typstSource = await loadTypstSource();
      await initTypstEngine();
      await compileAndRender();
    } catch (err) {
      console.error('Initialization error:', err);
      hideToast();
      showError(`Could not initialize Typst engine: ${err.message}`);
    }
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
