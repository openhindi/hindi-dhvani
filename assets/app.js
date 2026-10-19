/**
 * Hindi Pushtak — Typst Browser WASM Application
 *
 *  - Client-side Typst compilation via WebAssembly (@myriaddreamin/typst.ts)
 *  - Devanagari font loading (Noto Sans / Noto Serif Devanagari)
 *  - Vector SVG preview of each A4 page
 *  - Native binary PDF download ($typst.pdf)
 *  - Two-level hierarchical navigation drawer (Parts & indented Sections)
 *  - Part-level & section-level PDF slice extraction via pdf-lib
 *  - Standard 'पुस्तकचिह्न' bookmarks drawer with custom styling
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
    manifestUrl: 'manifest.json',
    themeKey: 'hindi-book-theme',
    pdfFileName: 'hindi-pushtak.pdf',
    compilerWasm: 'assets/wasm/typst_ts_web_compiler_bg.wasm',
    rendererWasm: 'assets/wasm/typst_ts_renderer_bg.wasm',
    page: { width: 596, height: 842 },
    fonts: [
      'assets/fonts/NotoSansDevanagari-Regular.ttf',
      'assets/fonts/NotoSerifDevanagari-Regular.ttf',
      'assets/fonts/NotoSerifDevanagari-Bold.ttf'
    ],
    fallbackManifest: {
      preliminary: [
        {
          id: 'book-about',
          title_hi: 'पुस्तक परिचय',
          title_en: 'About the Book',
          part_label: 'प्रारंभिक',
          section_label: 'पृष्ठ १–२',
          filename: 'hindi-pushtak-about.pdf',
          startPage: 1,
          endPage: 2
        },
        {
          id: 'book-toc',
          title_hi: 'विषय-सूची',
          title_en: 'Table of Contents',
          part_label: 'प्रारंभिक',
          section_label: 'पृष्ठ ३–४',
          filename: 'hindi-pushtak-toc.pdf',
          startPage: 3,
          endPage: 4
        }
      ],
      parts: [
        {
          id: 'part-01',
          part_num: '01',
          title_hi: 'भाग १ : देवनागरी लिपि-संरचना एवं सुलेख कला',
          title_en: 'Part 1 : Devanagari Script Architecture & Calligraphy',
          part_label: 'भाग १',
          section_label: 'पृष्ठ ५–११',
          filename: 'hindi-pushtak-part-01.pdf',
          startPage: 5,
          endPage: 11,
          sections: [
            {
              id: 'sec-01-01',
              part_num: '01',
              section_num: '01',
              title_hi: 'लिपि का उद्भव एवं विकास',
              title_en: 'Origin & Evolution Lineage',
              part_label: 'भाग १',
              section_label: 'अनुभाग १.१ (पृष्ठ ६–७)',
              filename: 'hindi-pushtak-01-01.pdf',
              startPage: 6,
              endPage: 7
            },
            {
              id: 'sec-01-02',
              part_num: '01',
              section_num: '02',
              title_hi: 'अक्षरात्मक प्रकृति व आबुगिदा',
              title_en: 'Abugida Architecture & System',
              part_label: 'भाग १',
              section_label: 'अनुभाग १.२ (पृष्ठ ८–९)',
              filename: 'hindi-pushtak-01-02.pdf',
              startPage: 8,
              endPage: 9
            },
            {
              id: 'sec-01-03',
              part_num: '01',
              section_num: '03',
              title_hi: 'शिरोरेखा के नियम एवं महत्व',
              title_en: 'Shirorekha Rules & Alignment',
              part_label: 'भाग १',
              section_label: 'अनुभाग १.३ (पृष्ठ १०–११)',
              filename: 'hindi-pushtak-01-03.pdf',
              startPage: 10,
              endPage: 11
            }
          ]
        }
      ]
    },
    themeColors: { light: '#e9ebf1', dark: '#0d1018' }
  });

  const state = {
    typstSource: '',
    manifestData: null,
    activePage: 1,
    fullPdfBlob: null,
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
      const shared = ['style', 'defs']
        .flatMap((tag) => Array.from(rootSvg.querySelectorAll(tag)))
        .map((node) => node.outerHTML)
        .join('\n');

      groups.forEach((group, idx) => {
        const pageNum = idx + 1;
        const el = createPageElement(pageNum, `Page ${pageNum}`);
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
      const el = createPageElement(1, 'Page 1');
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
      renderTwoLevelDrawer();
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
   * 4. PDF EXPORT & SECTION / PART EXTRACTION
   * ========================================================================== */

  async function getFullPdfBytes() {
    if (state.fullPdfBlob) {
      return new Uint8Array(await state.fullPdfBlob.arrayBuffer());
    }
    const pdfBytes = await $typst.pdf({ mainContent: state.typstSource });
    state.fullPdfBlob = new Blob([pdfBytes], { type: 'application/pdf' });
    return pdfBytes;
  }

  function triggerDownload(blob, filename) {
    const url = URL.createObjectURL(blob);
    const link = document.createElement('a');
    link.href = url;
    link.download = filename;
    document.body.appendChild(link);
    link.click();
    link.remove();
    setTimeout(() => URL.revokeObjectURL(url), 1000);
  }

  async function downloadPdf() {
    if (state.busy) return;
    state.busy = true;
    DOM.btnPdf.disabled = true;
    showToast('Generating full A4 PDF …', true);

    try {
      const bytes = await getFullPdfBytes();
      triggerDownload(new Blob([bytes], { type: 'application/pdf' }), CONFIG.pdfFileName);
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

  async function downloadSlicePdf(item, triggerBtn) {
    if (state.busy) return;
    state.busy = true;
    if (triggerBtn) triggerBtn.disabled = true;
    showToast(`Preparing ${item.title_hi} PDF …`, true);

    try {
      const fullPdfBytes = await getFullPdfBytes();

      if (window.PDFLib && window.PDFLib.PDFDocument) {
        // Precise extraction using pdf-lib
        const srcDoc = await window.PDFLib.PDFDocument.load(fullPdfBytes);
        const subDoc = await window.PDFLib.PDFDocument.create();

        const totalPages = srcDoc.getPageCount();
        const start = Math.max(1, item.startPage);
        const end = Math.min(totalPages, item.endPage);

        const pageIndices = [];
        for (let p = start; p <= end; p++) {
          pageIndices.push(p - 1);
        }

        const copiedPages = await subDoc.copyPages(srcDoc, pageIndices);
        copiedPages.forEach((p) => subDoc.addPage(p));

        const subPdfBytes = await subDoc.save();
        triggerDownload(
          new Blob([subPdfBytes], { type: 'application/pdf' }),
          item.filename || `hindi-pushtak-${item.id}.pdf`
        );
        showToast(`Downloaded ${item.title_hi}`, false, 2500);
      } else {
        // Fallback: download full PDF if pdf-lib is unavailable
        triggerDownload(
          new Blob([fullPdfBytes], { type: 'application/pdf' }),
          item.filename || `hindi-pushtak-${item.id}.pdf`
        );
        showToast(`Downloaded ${item.title_hi}`, false, 2500);
      }
    } catch (err) {
      console.error('Slice PDF extraction failed:', err);
      showToast(`Download failed: ${err.message}`, false, 3000);
    } finally {
      state.busy = false;
      if (triggerBtn) triggerBtn.disabled = false;
    }
  }

  /* ==========================================================================
   * 5. TWO-LEVEL DRAWER & NAVIGATION
   * ========================================================================== */

  function createDrawerRow(item, levelClass) {
    const row = document.createElement('div');
    row.className = `toc-item-row ${levelClass}`;
    row.dataset.startPage = item.startPage;
    row.dataset.endPage = item.endPage;

    // Navigation button
    const navBtn = document.createElement('button');
    navBtn.type = 'button';
    navBtn.className = 'toc-item';
    navBtn.setAttribute(
      'aria-label',
      `${item.title_hi} — ${item.title_en} (${item.part_label || ''}, ${item.section_label || ''})`
    );

    const hiSpan = document.createElement('span');
    hiSpan.className = 'toc-label-hi';
    hiSpan.textContent = item.title_hi;

    const enSpan = document.createElement('span');
    enSpan.className = 'toc-label-en';
    enSpan.textContent = item.title_en;

    const metaSpan = document.createElement('span');
    metaSpan.className = 'toc-label-meta';

    if (item.part_label) {
      const partBadge = document.createElement('span');
      partBadge.className = 'toc-label-part';
      partBadge.textContent = item.part_label;
      metaSpan.appendChild(partBadge);
    }

    if (item.section_label) {
      const secBadge = document.createElement('span');
      secBadge.className = 'toc-label-sec';
      secBadge.textContent = item.section_label;
      metaSpan.appendChild(secBadge);
    }

    navBtn.append(hiSpan, enSpan, metaSpan);
    navBtn.addEventListener('click', () => {
      closeDrawer();
      goToPage(item.startPage);
    });

    // Right-aligned download button
    const dlBtn = document.createElement('button');
    dlBtn.type = 'button';
    dlBtn.className = 'toc-dl-btn';
    dlBtn.setAttribute('aria-label', `डाउनलोड ${item.title_hi} (Download PDF)`);
    dlBtn.setAttribute('title', `डाउनलोड करें: ${item.title_hi} (${item.section_label || ''})`);
    dlBtn.innerHTML = `
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
        <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/>
        <polyline points="7 10 12 15 17 10"/>
        <line x1="12" y1="15" x2="12" y2="3"/>
      </svg>
    `;
    dlBtn.addEventListener('click', (e) => {
      e.stopPropagation();
      downloadSlicePdf(item, dlBtn);
    });

    row.append(navBtn, dlBtn);
    return row;
  }

  function renderTwoLevelDrawer() {
    const data = state.manifestData || CONFIG.fallbackManifest;
    const fragment = document.createDocumentFragment();

    // 1. Preliminary entries (Book About, Book ToC)
    if (data.preliminary && data.preliminary.length > 0) {
      data.preliminary.forEach((pre) => {
        fragment.appendChild(createDrawerRow(pre, 'toc-item-row--part'));
      });
    }

    // 2. Hierarchical Parts and Sections
    if (data.parts && data.parts.length > 0) {
      data.parts.forEach((part) => {
        // Level 1: Part Row (with full part download option)
        fragment.appendChild(createDrawerRow(part, 'toc-item-row--part'));

        // Level 2: Child Sections (indented & smaller font)
        if (part.sections && part.sections.length > 0) {
          part.sections.forEach((sec) => {
            fragment.appendChild(createDrawerRow(sec, 'toc-item-row--section'));
          });
        }
      });
    }

    DOM.drawerList.replaceChildren(fragment);
    setActiveItemByPage(state.activePage);
  }

  function setActiveItemByPage(pageNum) {
    state.activePage = pageNum;

    // We prioritize marking active child sections, falling back to parent part
    let marked = false;
    const sectionRows = DOM.drawerList.querySelectorAll('.toc-item-row--section');
    sectionRows.forEach((row) => {
      const start = Number(row.dataset.startPage);
      const end = Number(row.dataset.endPage);
      if (pageNum >= start && pageNum <= end) {
        row.setAttribute('aria-current', 'section');
        marked = true;
      } else {
        row.removeAttribute('aria-current');
      }
    });

    const partRows = DOM.drawerList.querySelectorAll('.toc-item-row--part');
    partRows.forEach((row) => {
      const start = Number(row.dataset.startPage);
      const end = Number(row.dataset.endPage);
      if (!marked && pageNum >= start && pageNum <= end) {
        row.setAttribute('aria-current', 'section');
      } else {
        row.removeAttribute('aria-current');
      }
    });
  }

  function observePages() {
    if (!('IntersectionObserver' in window)) return;
    if (state.observer) state.observer.disconnect();

    state.observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            setActiveItemByPage(Number(entry.target.dataset.page));
          }
        });
      },
      { rootMargin: '-35% 0px -55% 0px' }
    );

    DOM.viewport.querySelectorAll('.book-page').forEach((el) => state.observer.observe(el));
  }

  function openDrawer() {
    DOM.drawer.classList.add('is-open');
    DOM.backdrop.classList.add('is-open');
    DOM.btnMenu.setAttribute('aria-expanded', 'true');
    DOM.btnCloseDrawer.focus({ preventScroll: true });
    const current = DOM.drawerList.querySelector('[aria-current="section"]');
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
    const el = $(`page-${pageNum}`);
    if (!el) return;
    el.scrollIntoView({ behavior: 'smooth', block: 'start' });
    setActiveItemByPage(pageNum);
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

  async function loadManifest() {
    try {
      const response = await fetch(CONFIG.manifestUrl, { cache: 'no-cache' });
      if (!response.ok) throw new Error(`HTTP ${response.status}`);
      state.manifestData = await response.json();
    } catch (e) {
      console.warn('Could not load manifest.json, using fallback configuration:', e);
      state.manifestData = CONFIG.fallbackManifest;
    }
  }

  async function loadTypstSource() {
    const response = await fetch(CONFIG.typstUrl, { cache: 'no-cache' });
    if (!response.ok) throw new Error(`HTTP ${response.status} loading ${CONFIG.typstUrl}`);
    return response.text();
  }

  async function init() {
    initTheme();
    bindEvents();
    await loadManifest();
    renderTwoLevelDrawer();

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
