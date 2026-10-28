# Hindi Dhvani

An exhaustive, multimodal, and authoritative Hindi knowledge base and curriculum designed as the foundational engine for **dual high-value outputs**:
1. **Studio-Grade Hindi Audio Podcasts**: Conversational, spoken, acoustic-rich audio lessons in pure, natural Hindi (*Dhvani & Vaani*).
2. **Comprehensive Hindi Pustak**: An all-encompassing, definitive master book and reference manual taking learners from absolute beginner to scholar/expert ("wildcard" mastery level).

---

## 1. Project Mission & Architecture

The objective of **Hindi Dhvani** (हिन्दी ध्वनि) is to synthesize, enrich, and systematize the entirety of the Hindi language into **30 Parts and 600 Sections**. 

This repository is **completely platform-independent and format-agnostic**. It is designed with an open, modular Markdown architecture suitable for multi-channel publishing (audio production, interactive web learning, computational NLP, and publication). Every curriculum section is authored and maintained as an extensive, self-contained Markdown (`.md`) file inside the [`md/`](md/) directory (`md/sec-01-01.md` through `md/sec-30-20.md`).

### Dual-Output Generation Strategy
Each section Markdown file is crafted with deep structural intelligence so that it simultaneously powers:
* **Audio Podcast Generation Engine**:
  - Scripted natural Hindi dialogues and narrations.
  - Pronunciation keys, acoustic phonetic breakdowns, and oral repetition drills.
  - Articulation points (*Uchcharan Sthan*), minimal pair contrasts, and vocal resonance exercises.
* **Master Reference Manual (Hindi Pustak)**:
  - Theoretical linguistics, historical paleography, and etymology.
  - Central Hindi Directorate (CHD) orthographic rules and standardized spellings.
  - Exhaustive data tables, morphology charts, declensions, and conjugations.
  - Administrative terminology, commercial banking rules, and legal drafting templates.
  - Graded exercises, worksheets, and mastery evaluations.

---

## 2. Source Coverage & Research Protocol

### Complete Source Ingestion Protocol
The repository contains 70 master source documents (~8.4 MB) derived from the Government of India's Department of Official Language (*Rajbhasha*), Central Hindi Training Institute, and academic textbooks:
- **Kits & Practice Materials**: *Prabodh*, *Praveen*, *Pragya*, and *Parangat* kits (1 through 8 each).
- **Core Readers**: *Prabodh Paathmaala*, *Praveen Paathmaala*, *Pragya Paathmaala*.
- **Workbook Drills**: *Abhyas Pustika* and *Rs* modules (1 through 8 each).
- **Specialized Corpora**: *Banking Pragya* (financial and commercial Hindi), *Parangat* (advanced administrative drafting), and foundational handwriting notes.

Every single grammatical rule, dialogue, official note, letter format, and lexical item from these sources is explicitly mapped and incorporated into the 600 section files—not merely as vocabulary lists, but as fully developed pedagogical prose, contextual analysis, and drills.

### Authoritative Web & Research Enhancement
To ensure wildcard-level scholarship, each section is cross-referenced and enriched via external research:
- **Central Hindi Directorate (CHD)** (*केंद्रीय हिंदी निदेशालय*): Standardized Devanagari script rules, letter loop modifications, shirorekha conventions, and punctuation.
- **International Phonetic Association (IPA)**: Exact phonetic acoustic representations (/ə/, /aː/, retroflex /ʈ, ɖ, ɽ/, breathy voiced stops).
- **Commission for Scientific and Technical Terminology (CSTT)**: Official technical and administrative glossaries.
- **Modern Computational Linguistics**: InScript layout mechanics, Unicode Devanagari character encoding points, and NLP tokenization.

---

## 3. Curriculum Structure: 30 Parts Overview

The master curriculum spans 30 Parts (20 Sections per Part = 600 Total Sections):

| Part | Hindi Title | English Description | Pedagogic Tier | Status |
| :---: | :--- | :--- | :---: | :---: |
| **Part 1** | Devanagari Lipi-Sanrachna evam Sulekh | Devanagari Script Architecture & Calligraphy | Tier 1: Alphabets & Phonetics | **Complete (20/20)** |
| **Part 2** | Svar, Anusvaar evam Nasikya Dhvaniyaan | Vowels, Diacritics & Nasalization | Tier 1: Alphabets & Phonetics | **Complete (20/20)** |
| **Part 3** | Vyanjan-Vyavastha evam Uchharan-Vigyan | Consonant Classification & Phonetics | Tier 1: Alphabets & Phonetics | Queued (Batch 3) |
| **Part 4** | Sanyuktakshar, Sandhi evam Varna-Vichhed | Conjuncts, Sandhi & Orthographic Analysis | Tier 1: Alphabets & Phonetics | Queued (Batch 4) |
| **Part 5** | Sangya, Ling-Vyavastha evam Prakriti | Noun Classes & Grammatical Gender | Tier 2: Core Morphology | Queued |
| **Part 6** | Vachan-Vidhan evam Rupantaran | Number System & Pluralization Rules | Tier 2: Core Morphology | Queued |
| **Part 7** | Karak-Pranali, Parsarg evam Tiryak Roop | Case System, Postpositions & Oblique Forms | Tier 2: Core Morphology | Queued |
| **Part 8** | Sarvanam-Vyavastha evam Rupaavali | Pronouns, Declensions & Demonstratives | Tier 2: Core Morphology | Queued |
| **Part 9** | Visheshan, Pravisheshan evam Tulanatmak Roop | Adjectives, Intensifiers & Comparisons | Tier 2: Core Morphology | Queued |
| **Part 10** | Sankhya-Paddhati, Ganana evam Maapan | Numerals, Counting & Measurement Systems | Tier 2: Core Morphology | Queued |
| **Part 11** | Kriya-Mool, Dhatu evam Hona Sahayak Kriya | Verb Roots, Infinitives & Copula Hona | Tier 3: Verbal Architecture | Queued |
| **Part 12** | Vartaman Kaal (Samanya, Apoorna, Sandigdha) | Present Tenses: Simple, Continuous, Presumptive | Tier 3: Verbal Architecture | Queued |
| **Part 13** | Bhootkaal (Samanya, Aasanna, Poorna, Sandigdha) | Past Tenses: Simple, Immediate, Perfect, Habitual | Tier 3: Verbal Architecture | Queued |
| **Part 14** | Ne Parsarg Niyam evam Sakarmak Bhootkaal | Ergative Ne Rule & Transitive Past Syntax | Tier 3: Verbal Architecture | Queued |
| **Part 15** | Bhavishyat Kaal, Agyarth evam Vidhyarth | Future Tenses, Imperatives & Optatives | Tier 3: Verbal Architecture | Queued |
| **Part 16** | Sanyukt Kriyayein evam Ranjak Dhatu | Compound Verbs & Explicators | Tier 3: Advanced Verbs | Queued |
| **Part 17** | Preranarthak Kriyayein evam Rachna | Causative Verbs & Morphological Derivations | Tier 3: Advanced Verbs | Queued |
| **Part 18** | Paksha, Vritti evam Vivashatparak Roop | Verbal Aspects, Modality & Obligation | Tier 3: Advanced Verbs | Queued |
| **Part 19** | Kridant, Poorvakalik Kriya va Visheshan | Participles, Absolutives & Adverbs | Tier 3: Advanced Verbs | Queued |
| **Part 20** | Vachya-Vidhan: Kartri, Karma va Bhavavachya | Voice: Active, Passive & Impersonal | Tier 3: Advanced Verbs | Queued |
| **Part 21** | Vakya-Rachna, Bhed evam Avyaya Sanyojan | Sentence Syntax, Conjunctions & Modifiers | Tier 4: Syntax & Discourse | Queued |
| **Part 22** | Upvakya, Sambandhparak Rachna va Nitya-Sambandhi | Relative Clauses & Correlative Syntax | Tier 4: Syntax & Discourse | Queued |
| **Part 23** | Dainik Jeevan, Shishtachar evam Samvaad | Daily Life, Social Etiquette & Greetings | Tier 4: Spoken Hindi | Queued |
| **Part 24** | Upayogita, Sevayein, Yatra va Jan-Samvaad | Public Utilities, Travel & Essential Services | Tier 4: Spoken Hindi | Queued |
| **Part 25** | Prayojanmoolak va Prashasnik Karyalayeen Hindi | Official Language Policy & Administrative Idiom | Tier 5: Professional Hindi | Queued |
| **Part 26** | Tippan, Aalekhan evam Praroopan Paddhati | Noting, Drafting & Official Formats | Tier 5: Professional Hindi | Queued |
| **Part 27** | Banking, Vanijyik va Vittiya Karya-Pranali | Commercial Banking, Operations & Finance | Tier 5: Professional Hindi | Queued |
| **Part 28** | Computer, Unicode evam InScript Tankan | Computing, Unicode & InScript Touch Typing | Tier 6: Modern & Applied | Queued |
| **Part 29** | Anuvaad-Siddhant, Muhavare va Manak Vartani | Translation Theory, Idioms & Orthography | Tier 6: Modern & Applied | Queued |
| **Part 30** | Gadya-Paathmala, Sanskriti va Vrihad Shabdkosh | Literary Readings, Heritage & Master Lexicon | Tier 6: Master Synthesis | Queued |

---

## 4. Current Execution Progress

The project advances through **30 smaller, highly detailed batches** (one complete Part of 20 sections per batch). 

### Overall Completion Status: **40 of 600 Sections (6.7%)**

```
[████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░] 40 / 600 Sections
```

#### Batch 1: Part 1 — Devanagari Script Architecture & Calligraphy (Sections 1.1 to 1.20) : **COMPLETE**
- **1.1 – 1.5**: Historical evolution (Brahmi $\rightarrow$ Nagari), Abugida mechanics, Shirorekha rules, Khadi Pai vertical stems, Non-stemmed characters.
- **1.6 – 1.10**: Calligraphic stroke order, geometric balance, broken-loop letters (ध, भ, थ, झ, श्र), Ra allographs (रेफ़ व पदेन), Matra geometry.
- **1.11 – 1.15**: Top diacritics, bottom diacritics, handwriting drills, Devanagari numerals (०–९), punctuation marks.
- **1.16 – 1.20**: Central Hindi Directorate standardized variants, confusing minimal glyph pairs (ख/रव, घ/ध, म/भ), calligraphy nibs, speed writing, review worksheets.

#### Batch 2: Part 2 — Vowels, Diacritics & Nasalization (Sections 2.1 to 2.20) : **COMPLETE**
- **2.1 – 2.5**: Short vowels (अ, इ, उ, ऋ), Long vowels (आ, ई, ऊ), Diphthongs (ए, ऐ, ओ, औ), Independent vs Matra duality, Anusvara (ं) phonetics.
- **2.6 – 2.10**: Panchamakshar substitution, True nasalization (ँ Chandrabindu), Anusvara vs Anunasika minimal pairs (*həŋs* vs *hə̃s*), Top diacritic space-constraint dot rule, Visarga (ः).
- **2.11 – 2.15**: Borrowed vowel *Chandra-A* (ऑ / ɔː), Sanskrit *Ri* vs modern Hindi /rɪ/, Pluta trimoraic prolongation (Om), Vowel junctions (Svara Sandhi), Regional dialect shifts.
- **2.16 – 2.20**: Quantity-driven semantic minimal pairs (*din/dīn, kul/kūl*), Barakhadi 13-fold matrix, Inherent Schwa Deletion rules (/rām/ not /rāma/), Studio vocal calibration, Comprehensive diagnostic review.

#### Upcoming Batches
- **Batch 3**: Part 3 (Sections 3.1 to 3.20) — Consonant Classification & Phonetics (*Vyanjan-Vyavastha evam Uchharan-Vigyan*).
- **Batch 4**: Part 4 (Sections 4.1 to 4.20) — Conjuncts, Sandhi & Orthographic Analysis (*Sanyuktakshar, Sandhi evam Varna-Vichhed*).

---

## 5. Standard Modular Section Architecture

Every file in `md/` follows a standardized 8-part content blueprint:
1. **Metadata & Header**: Bilingual section title, part code, learning level (Beginner $\rightarrow$ Expert).
2. **Pedagogical Overview & Concepts**: Conceptual exposition in accessible prose.
3. **Core Linguistic Rules & Definitions**: Systematic grammatical/phonetic mechanics.
4. **Source Corpus Integration**: Authentic examples, dialogues, and exercises extracted directly from *Prabodh/Praveen/Pragya/Parangat*.
5. **Acoustic & Phonetic Blueprint (Audio Podcast Ready)**: IPA notations, IAST transliterations, pitch/stress hints, and a spoken script for audio production.
6. **Exhaustive Reference Data Tables**: Morphological declensions, minimal pairs, and domain glossaries.
7. **Contrastive & Comparative Analysis**: Contrast with English, Urdu/Perso-Arabic, or regional variations.
8. **Worksheet & Mastery Drills**: Objective questions, practical usage, and vocal practice drills.

---

## 6. Repository File Structure

| File / Directory | Description |
| :--- | :--- |
| [`README.md`](README.md) | Master architectural blueprint, progress tracker, and curriculum overview |
| [`md/`](md/) | The 600 section-wise markdown modules (`sec-01-01.md` through `sec-30-20.md`) |
| [`scripts/`](scripts/) | Essential curriculum validation and batch-generation utilities |
| [`source/`](source/) | 70 foundational Government of India curriculum files (~8.4 MB) |

---

## 7. Execution & Automation

### Validate Curriculum Data
```bash
python3 scripts/generate_master_toc.py
```
This validates all 30 parts, ensures every part has exactly 20 sections, and updates master reference indexes in `source/`.
