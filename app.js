/**
 * Hindi Master Book — Application
 *
 * Features
 *  - Renders hindi-book.md as distinct A4-proportioned pages
 *  - Contents drawer with live active-page tracking
 *  - Light / dark theme (remembered per browser)
 *  - One-click A4 PDF export (WYSIWYG, light theme, off-screen render tree)
 *  - Offline fallback: embedded copy of the markdown inside index.html
 *
 * Structure
 *  1. Configuration
 *  2. Utilities
 *  3. Markdown parser
 *  4. Page model
 *  5. Rendering
 *  6. Contents drawer
 *  7. Theme
 *  8. PDF export
 *  9. Feedback (toast)
 * 10. Bootstrap
 */

(function () {
  'use strict';

  /* ==========================================================================
   * 1. CONFIGURATION
   * ========================================================================== */

  const CONFIG = {
    markdownUrl: 'hindi-book.md',
    themeKey: 'hindi-book-theme',
    pdfFileName: 'hindi-master-book.pdf',
    defaultPartLabel: 'Hindi Master Book',
      pageBreakPattern: /<!--\s*PAGE-BREAK\s*-->/i,
      metaPattern: /<!--\s*PAGE:\s*(\d+)\s*\|\s*TYPE:\s*([A-Za-z0-9_-]+)\s*\|\s*TITLE:\s*([^>]+?)\s*-->/i,
 themeColors: { light: '#eef1f6', dark: '#151a23' }
  };

  const LIST_ITEM = /^(\s*)([-*]|\d+[.)])\s+(.*)$/;
  const HEADING = /^(#{1,4})\s+(.+)$/;
  const HR = /^(-{3,}|\*{3,}|_{3,})$/;

  const state = {
    pages: [],
    activePage: 1,
    theme: 'light',
    busy: false
  };

  const $ = (id) => document.getElementById(id);

  const DOM = {
    html: document.documentElement,
    topbarTitle: $('topbar-title'),
    viewport: $('book-viewport'),
    drawer: $('toc-drawer'),
    backdrop: $('drawer-backdrop'),
    drawerList: $('drawer-list'),
    btnMenu: $('btn-menu'),
    btnCloseDrawer: $('btn-close-drawer'),
    btnTheme: $('btn-theme-toggle'),
    btnPdf: $('btn-download-pdf'),
    toast: $('status-toast'),
    toastText: $('status-text'),
    toastSpinner: $('status-spinner'),
    themeMeta: document.querySelector('meta[name="theme-color"]')
  };

  /* ==========================================================================
   * 2. UTILITIES
   * ========================================================================== */

  function escapeHtml(value) {
    return String(value)
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#39;');
  }

  /** Inline Markdown: ***bold italic***, **bold**, *italic*, `code`. */
  function renderInline(text) {
    if (!text) return '';
    return text
    .replace(/`([^`]+)`/g, (_, code) => `<code>${escapeHtml(code)}</code>`)
    .replace(/\*\*\*(.+?)\*\*\*/g, '<strong><em>$1</em></strong>')
    .replace(/\*\*(.+?)\*\*/g, '<strong>$1</strong>')
    .replace(/\*(.+?)\*/g, '<em>$1</em>');
  }

  /* ==========================================================================
   * 3. MARKDOWN PARSER
   * Supports: headings, paragraphs, nested ul/ol, blockquotes, tables,
   * fenced code, horizontal rules, and raw HTML lines (for the cover).
   * ========================================================================== */

  function renderTable(rows) {
    const parsed = rows.map((row) =>
    row.trim().replace(/^\||\|$/g, '').split('|').map((cell) => cell.trim())
    );
    const isSeparator = (cells) => cells.every((c) => /^:?-+:?$/.test(c));

    let headerDone = false;
    let head = '';
    let body = '';

    parsed.forEach((cells, idx) => {
      if (isSeparator(cells)) {
        headerDone = true;
        return;
      }
      if (!headerDone && idx === 0) {
        head += '<tr>' + cells.map((c) => `<th>${renderInline(c)}</th>`).join('') + '</tr>';
      } else {
        body += '<tr>' + cells.map((c) => `<td>${renderInline(c)}</td>`).join('') + '</tr>';
      }
    });

    return `<div class="table-wrap"><table>` +
    (head ? `<thead>${head}</thead>` : '') +
    `<tbody>${body}</tbody></table></div>`;
  }

  /** Collects a run of list lines into a flat array of {indent, ordered, text}. */
  function collectList(lines, start) {
    const items = [];
    let i = start;

    while (i < lines.length) {
      const line = lines[i];
      const match = line.match(LIST_ITEM);

      if (match) {
        items.push({
          indent: match[1].replace(/\t/g, '  ').length,
                   ordered: /\d/.test(match[2]),
                   text: match[3]
        });
        i++;
        continue;
      }

      if (!line.trim()) {
        let j = i;
        while (j < lines.length && !lines[j].trim()) j++;
        if (j < lines.length && LIST_ITEM.test(lines[j])) {
          i = j;
          continue;
        }
        break;
      }

      if (items.length && /^\s+/.test(line)) {
        items[items.length - 1].text += ' ' + line.trim();
        i++;
        continue;
      }

      break;
    }

    return { items, next: i };
  }

  /** Renders a list level recursively, nesting deeper-indented items. */
  function renderListLevel(items, pos, indent) {
    const tag = items[pos].ordered ? 'ol' : 'ul';
    let html = `<${tag}>`;

    while (pos < items.length) {
      const item = items[pos];
      if (item.indent < indent) break;

      if (item.indent > indent) {
        const [sub, next] = renderListLevel(items, pos, item.indent);
        html += sub;
        pos = next;
        continue;
      }

      html += `<li>${renderInline(item.text)}`;
      pos++;

      if (pos < items.length && items[pos].indent > indent) {
        const [sub, next] = renderListLevel(items, pos, items[pos].indent);
        html += sub;
        pos = next;
      }

      html += '</li>';
    }

    return [html + `</${tag}>`, pos];
  }

  function renderList(items) {
    let html = '';
    let pos = 0;
    while (pos < items.length) {
      const [chunk, next] = renderListLevel(items, pos, items[pos].indent);
      html += chunk;
      pos = next;
    }
    return html;
  }

  function parseMarkdown(markdown) {
    if (!markdown) return '';

    const lines = markdown.split(/\r?\n/);
    const out = [];
    let i = 0;

    while (i < lines.length) {
      const trimmed = lines[i].trim();

      // Blank line
      if (!trimmed) { i++; continue; }

      // Fenced code block
      if (trimmed.startsWith('```')) {
        const buffer = [];
        i++;
        while (i < lines.length && !lines[i].trim().startsWith('```')) {
          buffer.push(lines[i]);
          i++;
        }
        i++; // closing fence
        out.push(`<pre><code>${escapeHtml(buffer.join('\n'))}</code></pre>`);
        continue;
      }

      // Raw HTML block lines (used by the cover)
      if (/^<\/?(div|p)\b/.test(trimmed)) {
        out.push(trimmed);
        i++;
        continue;
      }

      // Table
      if (trimmed.startsWith('|') && trimmed.endsWith('|')) {
        const rows = [];
        while (i < lines.length && lines[i].trim().startsWith('|')) {
          rows.push(lines[i].trim());
          i++;
        }
        out.push(renderTable(rows));
        continue;
      }

      // Horizontal rule
      if (HR.test(trimmed)) {
        out.push('<hr />');
        i++;
        continue;
      }

      // Heading
      const heading = trimmed.match(HEADING);
      if (heading) {
        const level = heading[1].length;
        out.push(`<h${level}>${renderInline(heading[2])}</h${level}>`);
        i++;
        continue;
      }

      // Blockquote (consecutive > lines become one block)
      if (trimmed.startsWith('>')) {
        const buffer = [];
        while (i < lines.length && lines[i].trim().startsWith('>')) {
          buffer.push(lines[i].trim().replace(/^>\s?/, ''));
          i++;
        }
        out.push(`<blockquote>${buffer.filter(Boolean).map(renderInline).join('<br />')}</blockquote>`);
        continue;
      }

      // Lists
      if (LIST_ITEM.test(lines[i])) {
        const { items, next } = collectList(lines, i);
        out.push(renderList(items));
        i = next;
        continue;
      }

      // Paragraph
      out.push(`<p>${renderInline(trimmed)}</p>`);
      i++;
    }

    return out.join('\n');
  }

  /* ==========================================================================
   * 4. PAGE MODEL
   * ========================================================================== */

  function splitIntoPages(markdown) {
    const chunks = markdown.split(CONFIG.pageBreakPattern);
    const pages = [];

    chunks.forEach((chunk, index) => {
      let content = chunk.trim();
      if (!content) return;

      let pageNum = pages.length + 1;
      let type = 'PAGE';
      let title = `Page ${pageNum}`;

      const meta = content.match(CONFIG.metaPattern);
      if (meta) {
        pageNum = parseInt(meta[1], 10) || pageNum;
        type = meta[2].toUpperCase();
        title = meta[3].trim();
        content = content.replace(meta[0], '').trim();
      }

      // "Part : Section" split on the first colon
      let partLabel = CONFIG.defaultPartLabel;
      let sectionLabel = title;
      const colon = title.indexOf(':');
      if (colon !== -1) {
        partLabel = title.slice(0, colon).trim();
        sectionLabel = title.slice(colon + 1).trim();
      }

      pages.push({
        pageNum,
        type,
        title,
        partLabel,
        sectionLabel,
        html: parseMarkdown(content)
      });
    });

    return pages;
  }

  /* ==========================================================================
   * 5. RENDERING
   * ========================================================================== */

  function createPageElement(page) {
    const article = document.createElement('article');
    article.className = `book-page book-page--${page.type.toLowerCase()}`;
    article.id = `page-${page.pageNum}`;
    article.dataset.page = page.pageNum;
    article.setAttribute('aria-label', page.title);

    article.innerHTML = `
    <header class="page-header">
    <span class="page-header-title">${escapeHtml(page.sectionLabel)}</span>
    <span class="page-header-part">${escapeHtml(page.partLabel)}</span>
    </header>
    <div class="book-page-body">${page.html}</div>
    <footer class="page-footer">
    <span class="page-num">${page.pageNum}</span>
    </footer>
    `;

    return article;
  }

  function renderBook() {
    const fragment = document.createDocumentFragment();
    state.pages.forEach((page) => fragment.appendChild(createPageElement(page)));
    DOM.viewport.replaceChildren(fragment);
    renderContents();
    observePages();
  }

  function renderError(message) {
    DOM.viewport.innerHTML = `<div class="book-error" role="alert">${escapeHtml(message)}</div>`;
  }

  /* ==========================================================================
   * 6. CONTENTS DRAWER
   * ========================================================================== */

  function renderContents() {
    const fragment = document.createDocumentFragment();

    state.pages.forEach((page) => {
      const button = document.createElement('button');
      button.type = 'button';
      button.className = 'toc-item';
      button.dataset.page = page.pageNum;
      button.innerHTML = `
      <span class="toc-label">${escapeHtml(page.title)}</span>
      <span class="toc-badge">${page.pageNum}</span>
      `;
      button.addEventListener('click', () => {
        closeDrawer();
        goToPage(page.pageNum);
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
    const target = Math.min(Math.max(pageNum, 1), state.pages.length);
    const el = $(`page-${target}`);
    if (el) {
      el.scrollIntoView({ behavior: 'smooth', block: 'start' });
      setActiveContents(target);
    }
  }

  /* ==========================================================================
   * 7. THEME
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
    } catch (e) { /* storage unavailable: theme still applies for this session */ }
  }

  function applyTheme(theme) {
    state.theme = theme;
    DOM.html.dataset.theme = theme;
    DOM.btnTheme.textContent = theme === 'dark' ? '☀️' : '🌙';
    DOM.btnTheme.setAttribute('aria-label', theme === 'dark' ? 'Light theme' : 'Dark theme');
    DOM.btnTheme.title = theme === 'dark' ? 'Light theme' : 'Dark theme';
    if (DOM.themeMeta) {
      DOM.themeMeta.content = CONFIG.themeColors[theme];
    }
    storeTheme(theme);
  }

  function toggleTheme() {
    applyTheme(state.theme === 'dark' ? 'light' : 'dark');
  }

  /* ==========================================================================
   * 8. PDF EXPORT
   * Builds the same page elements off-screen, forces the light token set via
   * the .pdf-export class, and hands them to html2pdf for A4 output.
   * ========================================================================== */

  function buildExportTree() {
    const host = document.createElement('div');
    host.className = 'pdf-export';
    host.setAttribute('aria-hidden', 'true');
    state.pages.forEach((page) => {
      const el = createPageElement(page);
      el.removeAttribute('id'); // avoid duplicate IDs with the on-screen book
      host.appendChild(el);
    });
    document.body.appendChild(host);
    return host;
  }

  async function downloadPdf() {
    if (state.busy) return;

    if (typeof window.html2pdf === 'undefined') {
      window.print();
      return;
    }

    state.busy = true;
    DOM.btnPdf.disabled = true;
    showToast('Preparing PDF…', true);

    let host = null;
    try {
      host = buildExportTree();
      await window.html2pdf()
      .set({
        margin: 0,
        filename: CONFIG.pdfFileName,
        image: { type: 'jpeg', quality: 0.97 },
        html2canvas: { scale: 2, useCORS: true, logging: false, backgroundColor: '#ffffff' },
        jsPDF: { unit: 'mm', format: 'a4', orientation: 'portrait' },
        pagebreak: { mode: ['css', 'legacy'], after: '.book-page' }
      })
      .from(host)
      .save();
      showToast('PDF downloaded', false);
    } catch (err) {
      console.error('PDF export failed, falling back to print:', err);
      hideToast();
      window.print();
    } finally {
      if (host) host.remove();
      state.busy = false;
      DOM.btnPdf.disabled = false;
      setTimeout(hideToast, 1600);
    }
  }

  /* ==========================================================================
   * 9. FEEDBACK (TOAST)
   * ========================================================================== */

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
   * 10. BOOTSTRAP
   * ========================================================================== */

  function bindEvents() {
    DOM.btnMenu.addEventListener('click', openDrawer);
    DOM.btnCloseDrawer.addEventListener('click', closeDrawer);
    DOM.backdrop.addEventListener('click', closeDrawer);
    DOM.btnTheme.addEventListener('click', toggleTheme);
    DOM.btnPdf.addEventListener('click', downloadPdf);

    document.addEventListener('keydown', (event) => {
      if (event.key === 'Escape') closeDrawer();
    });
  }

  async function loadMarkdown() {
    try {
      const response = await fetch(CONFIG.markdownUrl, { cache: 'no-cache' });
      if (!response.ok) throw new Error(`HTTP ${response.status}`);
      return await response.text();
    } catch (error) {
      throw new Error(`Could not load ${CONFIG.markdownUrl}: ${error.message}`);
    }
  }

  async function init() {
    applyTheme(readStoredTheme());
    bindEvents();

    try {
      const markdown = await loadMarkdown();
      state.pages = splitIntoPages(markdown);
      if (!state.pages.length) throw new Error('No pages found');
      DOM.topbarTitle.textContent = state.pages[0].partLabel;
      document.title = state.pages[0].partLabel;
      renderBook();
    } catch (err) {
      console.error('Initialisation error:', err);
      renderError('The book could not be loaded. Please reload the page.');
    }
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
