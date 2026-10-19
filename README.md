# Hindi Pushtak

An elegant, page-aware, print-accurate digital Hindi reference book designed with authentic printed-book typography, clean high-contrast monochrome aesthetics (white background, pure black Hindi text, 90% black English text), mobile-first responsive reading, and direct A4 PDF export.

---

## 1. Project Overview & Philosophy

The objective of **Hindi Pushtak** is to provide learners, scholars, and language enthusiasts with an exhaustive, systematic, and authoritative reference work covering Hindi orthography, phonetics, grammar, spoken conversation, official administration, banking, and computing.

### Mandatory Language Policy for Project Documentation
- **Strict English-Only README Rule**: The project README and developer-facing documentation must be maintained exclusively in English (zero Hindi characters or devanagari script in markdown prose). All references to Hindi terms, sections, and titles within the documentation must use standardized English transliterations or translations alongside clear ASCII/English identifiers. This guarantees universal tooling support, unambiguous markdown diffing, and seamless context-switching across sessions.

### Core Guiding Principles & Design Decisions

1. **No English in Brackets — Always Interlinear Beneath Hindi**:
   - English translations, glosses, and transliterations are never placed in parentheses or brackets inline with Hindi text.
   - **Sentence Level**: The complete English translation appears directly underneath the Hindi sentence in a smaller, elegant font (`#en-line`, 90% black `#1a1a1a`) with `#v(2.5pt)` vertical jump.
   - **Paragraph Level**: The full English paragraph is placed directly beneath the Hindi paragraph with standard vertical spacing and indentation (`#en-para`, 90% black `#1a1a1a`).
   - **Table & Word Level**: Column headers, terms, and individual vocabulary items place English glosses directly beneath the Hindi text (`#en-sub`, 90% black `#1a1a1a`).

2. **Monochrome High-Contrast Palette (White Background, Pure Black Hindi, 90% Black English)**:
   - **Page Background**: Pure white (`#ffffff`) throughout the entire document (`#set page(fill: rgb("#ffffff"), ...)`).
   - **Primary Hindi Text**: Pure jet black (`#000000`) for all Devanagari text, headings, table headers, and primary content.
   - **English Annotations**: 90% black (`#1a1a1a`) for all English translations, roman transliterations, subtitles, and footnotes. This provides optical contrast without appearing washed-out like gray, establishing a distinct visual hierarchy.
   - **Borders & Dividers**: Solid black (`#000000`) rules and box outlines; container fills remain pure white (`#ffffff`).

3. **Authentic Book Geometry & Margins**:
   - The book is engineered as a true page-aware A4 printed volume rather than a scrolling web document.
   - **Page Margins**: Top and bottom margins are set to **`30mm`** (`margin: (top: 30mm, bottom: 30mm, left: 20mm, right: 20mm)`), providing generous breathing room for running headers, footers, and clean desktop/commercial printing.
   - **Bilingual Running Header**: Displays Devanagari on the left (pure black `#000000`) and English on the right (90% black `#1a1a1a`), anchored by a 0.5pt solid horizontal dividing rule.
   - **Running Footer**: Simple page number right-aligned (`1`, `2`, `3` ...) with a 0.5pt solid top divider rule.

4. **30 Parts & 600 Sections Architecture (Comprehensive Magnum Opus Model)**:
   - The entire curriculum is structured into **30 Parts**, each containing exactly **20 Sections** (600 Sections total).
   - **Page Budget per Section: 2 to 4 Pages**: Every section has a mandatory budget of **2 to 4 pages**. No section may be under 2 pages or exceed 4 pages.
   - **Master Extent**: Covering the complete authoritative corpus of the Government of India (~840,000 words across Prabodh, Praveen, Pragya, Parangat, and Banking Pragya), the projected finished masterwork spans **1,500 to 2,200+ pages** (within the 1,200 to 2,400 page architectural boundary) suited for multi-volume editions.
   - **Source-Driven Reorganization & Authoring**: All 30 Parts and 600 Sections are systematically synthesized, restructured, reorganized, and authored directly from the official corpus housed in [`source/`](file:///home/zenhome/Projects/hindi-pushtak/source/) (comprising over 50 foundational texts including *Prabodh*, *Praveen*, *Pragya*, *Parangat*, *Banking Pragya*, kit materials, exercise workbooks, and handwriting notes). Raw source lessons are not simply copied; they are reorganized into modern bilingual pedagogic modules, structured into standard 2-page spreads, and formatted according to strict Typst template specifications.
    - **Online Authoritative Verification & Enhancement Protocol**: Where source materials provide foundational phonetic and orthographic coverage, section contents are cross-referenced and enriched using authoritative external standards from the Central Hindi Directorate (Ministry of Education, Govt of India) (*Devanagari Script and Hindi Orthography Standardization* / 'Devanagari Lipi tatha Hindi Vartani ka Manakikaran') and official administrative bodies. This ensures cutting-edge accuracy regarding letter loops, shirorekha rules, conjuncts, and administrative conventions.
   - **Spread Format**: Standard baseline sections use a **2-page facing spread** (Page 1: Theory and Core Rules; Page 2: Tables, Comparative Analysis, and Review Worksheet).
   - **Master TOC (Pages 3 & 4)**: Lists the 30 Parts across 2 pages (15 parts per page) with comfortable vertical padding (`y: 5.2pt`).
   - **Part Opener Pages**: Each part begins with a dedicated 1-page opener featuring a part overview and a **2-column layout (10 rows × 2 columns)** section directory table with normal font size (9.8pt bold / 8.2pt English) and `y: 5.5pt` padding.

5. **Strict Standardized Typst Template Architecture (Zero Surprises Rule)**:
   - To prevent page overflow, accidental heading separation, or visual inconsistencies across hundreds of sections, all pages must strictly use predefined Typst templates and standardized components:
     - **`#section-opener(sec-num-hi, title-hi, sec-num-en, title-en)`**: Opening banner on Page 1 of each section spread with title, subtitle, divider, and spacing.
     - **`#intro-para(hi-text, en-text)`**: Introductory bilingual paragraph with calibrated `#v(2.5pt)` jump and 8.5pt 90% black English.
     - **`#section-subheading(num-hi, title-hi, num-en, title-en)`**: Primary conceptual section headings (12.5pt bold Devanagari, 8.8pt English interlinear beneath).
     - **`#spread-header(num-hi, title-hi, num-en, title-en)`**: Top banner on Page 2 of each section spread with 0.5pt divider rule and forced line-break (`\`) for interlinear English beneath Devanagari.
     - **`#topic-heading(num-hi, title-hi, num-en, title-en)`**: Topic / table headings on Page 2 (13pt bold Devanagari, forced line-break (`\`) for interlinear 8.5pt English beneath).
     - **`#rule-box(title-hi, title-en, body)`**: Left-accented 3pt solid black border callout box for core rules and principles.
     - **`#exercise-box(title-hi, title-en, body)`**: Standardized 0.6pt enclosed Comprehension & Review Worksheet at the base of Page 2.
     - **`#kbd(key)`**: Keycap box for computer, InScript typing, and keyboard shortcuts.
     - **Standard Table Configuration**: Explicit column widths (e.g. `(70pt, 120pt, 1fr)` or `(110pt, 1fr, 1fr)`), `3.6pt` to `3.8pt` vertical cell padding, and `stroke: (bottom: 0.3pt)`.
     - **Strict Page-Break Discipline (`#pagebreak()`)**: Every section begins on an even page (left/verso) and concludes on an odd page (right/recto) with a mandatory `#pagebreak()`. Content must not bleed across section boundaries.

---

## 2. Current Document Structure

The document currently compiles to **exactly 11 A4 pages** with mathematical precision and zero overflow:

```
[ Page 1 ] : Title Page (Cover)
  └── Minimalist right-aligned layout:
      - Emblem: ❖ (#000000)
      - Main Title: Hindi Pushtak (34pt, bold, #000000)
      - English Subtitle: Hindi Pushtak (13pt, 90% black #1a1a1a)

[ Page 2 ] : About the Book
  ├── Running Header: [Left: Pustak Parichay] | [Right: About the Book]
  └── Three bilingual paragraphs detailing the Comprehensive Magnum Opus Model, philosophy, standard computer typography, and institutional communication (Zero numerical counts, advanced vocabulary, 10.8pt Devanagari / 9.0pt English #1a1a1a)

[ Page 3 ] : Table of Contents : Part 1 (Parts 1 to 15)
  ├── Running Header: [Left: Vishay-Suchi] | [Right: Table of Contents]
  └── Master Table of Parts 1 to 15 (54pt part number column, bilingual titles, y: 5.2pt cell inset)

[ Page 4 ] : Table of Contents : Part 2 (Parts 16 to 30)
  ├── Running Header: [Left: Vishay-Suchi] | [Right: Table of Contents]
  └── Master Table of Parts 16 to 30 (54pt part number column, bilingual titles, y: 5.2pt cell inset)

[ Page 5 ] : Part 1 Opener : Section Directory (20 Sections)
  ├── Running Header: [Left: Khand 1 : Anubhag Suchi] | [Right: Part 1 : Section Directory]
  ├── Part 1 title banner, bilingual scope summary, and Section Directory header
  └── 2-Column Section Directory Table (10 rows × 2 columns, normal 9.8pt/8.2pt font, y: 5.5pt padding, strictly 1 page)

[ Page 6 ] : Section 1.1 : Historical Origin & Structural Evolution of Devanagari Script (Page 1)
  ├── Running Header: [Left: Anubhag 1.1 : Lipi ka Udbhav] | [Right: Section 1.1 : Origin & Evolution]
  ├── Standard section opener, introductory bilingual paragraph (#v(2.5pt) jump)
  └── 3 Core Architectural Rule Boxes (Abugida Nature, Shirorekha Importance, Geometric Equilibrium)

[ Page 7 ] : Section 1.1 : Evolution Lineage, Technical Terms & Review Drills (Page 2)
  ├── Running Header: [Left: Anubhag 1.1 : Lipi-Vikas Parampara evam Abhyas] | [Right: Section 1.1 : Evolution & Review Drills]
  ├── Script Evolution Lineage Table (Ashokan Brahmi -> Gupta -> Kutila -> Early Devanagari)
  ├── Core Technical Terms Table (Shirorekha, Khadi Pai, Halant)
  └── Self-Evaluation Worksheet Box (Multiple choice and fill-in-the-blank questions)

[ Page 8 ] : Section 1.2 : Syllabic Architecture & Abugida Structural System (Page 1)
  ├── Running Header: [Left: Anubhag 1.2 : Aksharatmak Prakriti] | [Right: Section 1.2 : Abugida Architecture]
  ├── Theoretical abugida introduction and inherent schwa principle
  ├── 3 Rule Boxes (Inherent Schwa, Diacritic Matra Modification, Halant Function)
  └── Master 12-Column Barakhadi Diacritic Table for Consonant 'Ka'

[ Page 9 ] : Section 1.2 : Orthographic Analysis, Varna-Vichhed & Drills (Page 2)
  ├── Running Header: [Left: Anubhag 1.2 : Varna-Vichhed evam Abhyas] | [Right: Section 1.2 : Orthographic Analysis & Drills]
  ├── Orthographic analysis introduction (Varna-Vichhed)
  ├── Standard Varna-Vichhed Table (kamal, bhaarat, pustak, devanaagarii)
  ├── Comparative Table: Abugida vs Alphabet System
  └── Self-Evaluation Worksheet Box (Abugida comprehension and varna-vichhed exercise)

[ Page 10 ] : Section 1.3 : Shirorekha Rules, Importance & Alignment (Page 1)
  ├── Running Header: [Left: Anubhag 1.3 : Shirorekha ke Niyam evam Mahatva] | [Right: Section 1.3 : Shirorekha Rules & Importance]
  ├── Standard section opener, introductory bilingual paragraph (#v(2.5pt) jump)
  └── 3 Core Architectural Rule Boxes (Word Binding & Top Alignment, Terminal Stroke Execution Order, Inter-Word Spacing Discontinuity)

[ Page 11 ] : Section 1.3 : Broken-Loop Characters, Comparative Analysis & Drills (Page 2)
  ├── Running Header: [Left: Anubhag 1.3 : Shirorekha Vichhed evam Abhyas] | [Right: Section 1.3 : Broken Letters & Exercises]
  ├── Broken-Loop Characters Table (dha, bha, tha, jha, shra — structural rules, rationale against confusions)
  ├── Comparative Table: Headlined (Devanagari) vs Non-Headlined (Gujarati / Latin) Scripts
  └── Self-Evaluation Worksheet Box (Comprehension multiple-choice and fill-in-the-blank review questions)
```

---

## 3. Key Design Insights & Technical Decisions


1. **Exact 90% Black Contrast Ratio (`#1a1a1a`)**:
   - Setting English text to 90% black (`#1a1a1a`) achieves the optimal optical hierarchy: it is dark enough to remain crisp and print-ready while clearly subordinating secondary English translations beneath primary Devanagari headings and text.
2. **2-Column Section Directory on Part Openers**:
   - Organizing the 20 sections into a 2-column format (10 rows × 2 parallel sections) on Page 5 allows normal, highly readable font sizes (9.8pt bold Devanagari, 8.2pt English) with generous `y: 5.5pt` cell padding, completely eliminating awkward miniaturized text while staying strictly on 1 page.
3. **Parts Master Table Padding (`y: 5.2pt`)**:
   - The master TOC tables across Pages 3 and 4 maintain 15 parts per page with `y: 5.2pt` vertical cell padding for comfortable reading.
4. **Standardized Typst Component Architecture**:
   - Callout rule boxes are standardized with pure white fill, left-accented 3pt solid black borders, and uniform vertical padding.
   - Headers and subheaders utilize dedicated template macros to prevent drift.
5. **30mm Top & Bottom Margins**:
   - Top and bottom margins are established at `30mm`, creating balanced page geometry for formal publishing. All inner page tables are calibrated so that content fits neatly without overflow.

---

## 4. Technical Architecture

- **In-Browser Typst WebAssembly Compilation**:
  - Powered by `@myriaddreamin/typst.ts`, the local WASM compiler and renderer executes directly inside browser memory. No backend server is required; pure vector A4 pages render immediately.
- **Devanagari Font Injection**:
  - Embedded TrueType font buffers (*Noto Serif Devanagari* and *Noto Sans Devanagari*) are loaded from the `assets/fonts/` directory, ensuring 100% accurate conjunct rendering, shirorekha alignment, and matra positioning.
- **Native Binary A4 PDF Export**:
  - Generates high-fidelity, searchable, selectable vector A4 binary PDFs matching print specifications directly from the Typst engine.

---

## 5. Repository File Structure

| File / Directory | Description |
| :--- | :--- |
| [`index.html`](file:///home/zenhome/Projects/hindi-pushtak/index.html) | Main web reader application with embedded SVG favicon, modules, and viewer controls |
| [`hindi-pushtak.typ`](file:///home/zenhome/Projects/hindi-pushtak/hindi-pushtak.typ) | Master Typst document (A4 geometry, templates, 30mm margins, bilingual content) |
| [`scripts/generate_master_toc.py`](file:///home/zenhome/Projects/hindi-pushtak/scripts/generate_master_toc.py) | Generator script for 30 parts, master TOC, and part opener layouts |
| [`scripts/curriculum_tier*.py`](file:///home/zenhome/Projects/hindi-pushtak/scripts/) | Database modules defining all 30 Parts and 600 Sections across Tiers 1 through 6 |
| [`assets/`](file:///home/zenhome/Projects/hindi-pushtak/assets/) | Web assets, CSS styles, JavaScript runtime, Noto fonts, and Typst WASM binaries |
| [`source/`](file:///home/zenhome/Projects/hindi-pushtak/source/) | Master source corpus: official Government of India curriculum materials (~840k words across Prabodh, Praveen, Pragya, Parangat, Banking Pragya, etc.) and reference syllabus documents from which all 30 Parts and 600 Sections are systematically reorganized, restructured, authored, and generated |

---

## 6. Local Testing & Execution

This repository is 100% self-contained and operates completely offline.

To run the local web reader:
```bash
python3 -m http.server 8080
```
Open in browser:
```
http://localhost:8080/
```

To compile the native PDF from command line:
```bash
typst compile --font-path assets/fonts/ hindi-pushtak.typ hindi-pushtak.pdf
```

---

## 7. Current Progress & Resumption Guide

This section serves as the definitive reference for resuming work in a clean, fresh session without needing past conversation history:

### 1. Current State & Geometry
- **Total Compiled Pages**: Exactly **11 A4 pages** (`Pages: 11` verified via `typst compile` and `pdfinfo`).
- **Page Configuration**:
  - Paper: `"a4"`
  - Margins: `(top: 30mm, bottom: 30mm, left: 20mm, right: 20mm)`
  - Background fill: `#ffffff` (pure white)
  - Text: `12pt`, Devanagari pure black `#000000`, English 90% black `#1a1a1a`, interlinear beneath Hindi
- **Implemented Pages**:
  - `Page 1`: Title Cover
  - `Page 2`: About the Book (Pustak Parichay, 3 bilingual paragraphs, 0 numbers, "all-encompassing, definitive")
  - `Page 3`: Table of Contents : Part 1 (Parts 1 to 15, `y: 5.2pt`)
  - `Page 4`: Table of Contents : Part 2 (Parts 16 to 30, `y: 5.2pt`)
  - `Page 5`: Part 1 Opener (2-column section directory table, `y: 5.5pt`)
  - `Pages 6–7`: **Section 1.1** (*Historical Origin & Structural Evolution of Devanagari Script*) — 2-page spread
  - `Pages 8–9`: **Section 1.2** (*Syllabic Architecture & Abugida Structural System*) — 2-page spread
  - `Pages 10–11`: **Section 1.3** (*Shirorekha Rules, Importance & Alignment*) — 2-page spread

### 2. Web Reader & Section Download Architecture
- **Standardized Navigation Drawer Title**:
  - The drawer header and toggle button use the single standard Hindi word **'Pustakchihna'** (*Bookmarks* in English subtitle with smaller font), completely removing mixed slash labels.
- **Section-Oriented Manifest (`manifest.json`)**:
  - The drawer items are driven dynamically from `manifest.json`, mapping each curriculum section to its exact starting and ending physical page numbers (`startPage`, `endPage`), part affiliation (`part_label`), section title, and standardized download filename.
  - **About the book**: Downloads pages 1 and 2 as `hindi-pushtak-about.pdf`.
  - **Table of Contents**: Downloads pages 3 and 4 as `hindi-pushtak-toc.pdf`.
  - **Curriculum Sections**: Named and downloaded with standardized zero-padded part and section numbers (e.g. `hindi-pushtak-01-01.pdf`, `hindi-pushtak-01-02.pdf`, `hindi-pushtak-01-03.pdf`).
- **Three-Tier Typography in Drawer Items**:
  - **Tier 1 (Hindi Title)**: Displayed prominently at 0.82rem bold in Devanagari script.
  - **Tier 2 (English Title)**: Positioned directly beneath Hindi in 0.70rem regular font.
  - **Tier 3 (Part & Section Metadata)**: Positioned underneath English in 0.62rem font with a subtle badge showing the Part and Section numbers along with page ranges.
- **Section-Specific PDF Download**:
  - Each item in the drawer features a right-aligned download icon button vertically aligned with the 3-tier text.
  - Clicking this button extracts and downloads only the pages pertaining to that specific section into an individual PDF file using client-side `pdf-lib` slicing without re-downloading the entire book.

### 3. Standard Section Authoring Protocol
Every new section must be authored as a strict **2-page spread (Pages N & N+1)**:
- **Page 1 (Verso / Even Page)**:
  1. `#section-opener(sec-num-hi, title-hi, sec-num-en, title-en)`
  2. `#intro-para(hi-text, en-text)`
  3. `#section-subheading(num-hi, title-hi, num-en, title-en)`
  4. 3 standard `#rule-box(title-hi, title-en, body)` blocks
  5. `#pagebreak()`
- **Page 2 (Recto / Odd Page)**:
  1. `#spread-header(num-hi, title-hi, num-en, title-en)`
  2. Table 1 (`inset: (x: 5pt, y: 3.8pt)`, `stroke: (bottom: 0.3pt)`)
  3. `#topic-heading(num-hi, title-hi, num-en, title-en)`
  4. Table 2 (Comparative or technical terminology table, `inset: (x: 5pt, y: 3.6pt)`)
  5. Anchored `#exercise-box(title-hi, title-en, body)` at page bottom
  6. `#pagebreak()`
- **Header Update**: Add the page number range to `#set page(header: ...)` in `hindi-pushtak.typ` for `left-title` (Hindi) and `right-title` (English).

### 3. Immediate Next Task
- Author **Section 1.4**:
  - **Title**: *Characters with Vertical Stem (Khadi Pai)* (Khadi Pai Vale Varnon ki Manak Sanrachna)
  - **Allocated Pages**: **Pages 12 & 13**
  - **Content Scope**:
    - *Page 12*: Classification of Khadi Pai consonants (middle-stem 'ka', 'pha'; end-stem 'kha', 'ga', 'gha', etc.), 3 rule boxes (90° perpendicularity, stem position, conjunct formation via stem dropping).
    - *Page 13*: Master inventory table of Khadi Pai characters, half-form derivation rules, and self-evaluation review worksheet box.
  - **Running Header Configuration**:
    - Page 12: `left-title` (Devanagari: Section 1.4 : Khadi Pai Vale Varna), `right-title: [Section 1.4 : Vertical Stem Characters]`
    - Page 13: `left-title` (Devanagari: Section 1.4 : Ardh-roop Sanrachna evam Abhyas), `right-title: [Section 1.4 : Half-Forms & Exercises]`
