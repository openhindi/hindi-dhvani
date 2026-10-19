/**
 * Hindi Master Book — Typst Browser WASM Application
 *
 * Features:
 *  - Native client-side Typst compilation via WebAssembly (@myriaddreamin/typst.ts from CDN)
 *  - Full Devanagari font support (Noto Sans / Noto Serif Devanagari)
 *  - On-screen vector SVG preview matching exact A4 page geometry
 *  - Direct native binary PDF download ($typst.pdf) without rasterization or canvas slicing
 *  - Interactive contents drawer with active section tracking
 *  - Light / dark reader theme
 */

import { $typst, loadFonts } from 'https://cdn.jsdelivr.net/npm/@myriaddreamin/typst.ts/+esm';

(function () {
  'use strict';

  /* ==========================================================================
   * 1. CONFIGURATION
   * ========================================================================== */

  const CONFIG = {
    typstUrl: 'hindi-pushtak.typ',
    themeKey: 'hindi-book-theme',
    pdfFileName: 'hindi-pushtak.pdf',
    defaultPartLabel: 'Hindi Pushtak',
    fonts: [
      'fonts/NotoSansDevanagari-Regular.ttf',
      'fonts/NotoSerifDevanagari-Regular.ttf',
      'fonts/NotoSerifDevanagari-Bold.ttf'
    ],
    toc: [
      { pageNum: 1, title: 'मुखपृष्ठ (Cover)' },
      { pageNum: 2, title: 'पुस्तक परिचय : दृष्टिकोण (About the Book)' },
      { pageNum: 3, title: 'विषय-सूची (Table of Contents)' },
      { pageNum: 4, title: 'खंड १ : अनुभाग १.१ (Devanagari Script)' },
      { pageNum: 5, title: 'खंड १ : अनुभाग १.२ (Calligraphy & Stroke Order)' }
    ],
    themeColors: { light: '#f2f2f2', dark: '#111111' }
  };

  const state = {
    typstSource: '',
    pages: [],
    activePage: 1,
    theme: 'light',
    busy: false,
    initialized: false
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
   * 2. TYPST INITIALIZATION & FONT REGISTRATION
   * ========================================================================== */

  async function initTypstEngine() {
    if (state.initialized) return;

    showToast('Typesetting ...', true);

    try {
      // 1. Configure Web Compiler and Renderer WASM URLs from jsDelivr
      $typst.setCompilerInitOptions({
        getModule: () => ({
          module_or_path: 'https://cdn.jsdelivr.net/npm/@myriaddreamin/typst-ts-web-compiler@0.7.0/pkg/typst_ts_web_compiler_bg.wasm'
        })
      });

      $typst.setRendererInitOptions({
        getModule: () => ({
          module_or_path: 'https://cdn.jsdelivr.net/npm/@myriaddreamin/typst-ts-renderer@0.7.0/pkg/typst_ts_renderer_bg.wasm'
        })
      });

      // 2. Preload fonts via typst.ts font loader
      $typst.use({
        key: 'access-model',
        forRoles: ['compiler'],
        provides: [loadFonts(CONFIG.fonts)]
      });

      state.initialized = true;
    } catch (err) {
      console.error('Typst engine initialization error:', err);
      throw err;
    } finally {
      hideToast();
    }
  }

  /* ==========================================================================
   * 3. COMPILATION & RENDERING
   * ========================================================================== */

  async function compileAndRender() {
    showToast('Typesetting ...', true);

    try {
      // Compile Typst source directly to SVG markup
      const svgOutput = await $typst.svg({
        mainContent: state.typstSource
      });
      console.log('Typst compiled SVG prefix:', svgOutput.slice(0, 300));

      DOM.viewport.innerHTML = '';

      // If svgOutput contains the complete document, render it in viewport
      // If svgOutput already has all 5 pages vertically stacked inside one SVG:
      // Let's create an article per page or let rootSvg render once!
      // Extract styles and defs from root SVG
      const parser = new DOMParser();
      const doc = parser.parseFromString(svgOutput, 'image/svg+xml');
      const rootSvg = doc.querySelector('svg');
      const styles = rootSvg ? Array.from(rootSvg.querySelectorAll('style')).map(s => s.outerHTML).join('\n') : '';
      const defs = rootSvg ? Array.from(rootSvg.querySelectorAll('defs')).map(d => d.outerHTML).join('\n') : '';
      const pageGroups = rootSvg ? Array.from(rootSvg.querySelectorAll('.typst-page')) : [];

      console.log('pageGroups count:', pageGroups.length);

      if (pageGroups.length > 1) {
        pageGroups.forEach((g, idx) => {
          const pageNum = idx + 1;
          const entry = CONFIG.toc[idx] || { pageNum, title: `Page ${pageNum}` };
          const pageEl = document.createElement('article');
          pageEl.className = 'book-page book-page-typst';
          pageEl.id = `page-${pageNum}`;
          pageEl.dataset.page = pageNum;
          pageEl.setAttribute('aria-label', entry.title);

          // In Typst SVG, each .typst-page is placed at translate(0, idx * 842).
          // We wrap it in a g with translate(0, -idx * 842) so it renders at y=0 inside this page's SVG.
          pageEl.innerHTML = `
            <svg viewBox="0 0 596 842" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:h5="http://www.w3.org/1999/xhtml">
              ${styles}
              ${defs}
              <g transform="translate(0, -${idx * 842})">
                ${g.outerHTML}
              </g>
            </svg>
          `;
          DOM.viewport.appendChild(pageEl);
        });
      } else {
        const pageEl = document.createElement('article');
        pageEl.className = 'book-page book-page-typst';
        pageEl.id = 'page-1';
        pageEl.dataset.page = 1;
        pageEl.innerHTML = svgOutput;
        DOM.viewport.appendChild(pageEl);
      }

      renderContents();
      observePages();
    } catch (err) {
      console.error('Typst compilation failed:', err);
      DOM.viewport.innerHTML = `<div class="book-error">Error compiling Typst document: ${escapeHtml(err.message)}</div>`;
    } finally {
      hideToast();
    }
  }

  /* ==========================================================================
   * 4. DIRECT NATIVE PDF EXPORT
   * ========================================================================== */

  async function downloadPdf() {
    if (state.busy) return;
    state.busy = true;
    DOM.btnPdf.disabled = true;
    showToast('Generating Native A4 PDF...', true);

    try {
      // Native WASM binary PDF generation
      const pdfBytes = await $typst.pdf({
        mainContent: state.typstSource
      });

      const blob = new Blob([pdfBytes], { type: 'application/pdf' });
      const url = URL.createObjectURL(blob);
      const link = document.createElement('a');
      link.href = url;
      link.download = CONFIG.pdfFileName;
      document.body.appendChild(link);
      link.click();
      link.remove();
      URL.revokeObjectURL(url);
    } catch (err) {
      console.error('PDF export failed:', err);
      showToast('PDF Export error, opening print dialog...', false);
      window.print();
    } finally {
      state.busy = false;
      DOM.btnPdf.disabled = false;
      hideToast();
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
      button.innerHTML = `
        <span class="toc-label">${escapeHtml(entry.title)}</span>
        <span class="toc-badge">${entry.pageNum}</span>
      `;
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
      const isCurrent = Number(item.dataset.page) === pageNum;
      if (isCurrent) {
        item.setAttribute('aria-current', 'page');
        item.scrollIntoView({ block: 'nearest' });
      } else {
        item.removeAttribute('aria-current');
      }
    });
  }

  function observePages() {
    if (!('IntersectionObserver' in window)) return;

    const observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          setActiveContents(Number(entry.target.dataset.page));
        }
      });
    }, { rootMargin: '-35% 0px -55% 0px' });

    DOM.viewport.querySelectorAll('.book-page').forEach((el) => observer.observe(el));
  }

  function openDrawer() {
    DOM.drawer.classList.add('is-open');
    DOM.backdrop.classList.add('is-open');
    DOM.btnMenu.setAttribute('aria-expanded', 'true');
    DOM.btnCloseDrawer.focus({ preventScroll: true });
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
    if (el) {
      el.scrollIntoView({ behavior: 'smooth', block: 'start' });
      setActiveContents(target);
    }
  }

  /* ==========================================================================
   * 6. THEME
   * ========================================================================== */

  function readStoredTheme() {
    try {
      return localStorage.getItem(CONFIG.themeKey) === 'dark' ? 'dark' : 'light';
    } catch (e) {
      return 'light';
    }
  }

  function storeTheme(theme) {
    try {
      localStorage.setItem(CONFIG.themeKey, theme);
    } catch (e) { /* storage unavailable */ }
  }

  function applyTheme(theme) {
    state.theme = theme;
    DOM.html.dataset.theme = theme;
    if (DOM.themeMeta) {
      DOM.themeMeta.content = CONFIG.themeColors[theme];
    }
    storeTheme(theme);
  }

  function toggleTheme() {
    applyTheme(state.theme === 'dark' ? 'light' : 'dark');
  }

  /* ==========================================================================
   * 7. UTILITIES & TOAST
   * ========================================================================== */

  function escapeHtml(value) {
    return String(value)
      .replace(/&/g, '&amp;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;')
      .replace(/"/g, '&quot;')
      .replace(/'/g, '&#39;');
  }

  let toastTimer = null;

  function showToast(message, withSpinner) {
    clearTimeout(toastTimer);
    DOM.toastText.textContent = message;
    DOM.toastSpinner.hidden = !withSpinner;
    DOM.toast.classList.add('is-visible');
    DOM.toast.setAttribute('role', 'status');
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
    return await response.text();
  }

  async function init() {
    applyTheme(readStoredTheme());
    bindEvents();

    try {
      state.typstSource = await loadTypstSource();
      await initTypstEngine();
      await compileAndRender();
      document.title = 'Hindi Pushtak';
    } catch (err) {
      console.error('Initialization error:', err);
      DOM.viewport.innerHTML = `<div class="book-error">Could not initialize Typst engine: ${escapeHtml(err.message)}</div>`;
    }
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
