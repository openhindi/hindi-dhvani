// Hindi Pushtak (हिन्दी पुस्तक) — Master Typst Document
// Configured for authentic A4 book geometry, bilingual Devanagari typography, and strict monochrome palette.

#set page(
  paper: "a4",
  fill: rgb("#ffffff"),
  margin: (top: 30mm, bottom: 30mm, left: 20mm, right: 20mm),
  header: context {
    let page-num = counter(page).get().first()
    if page-num == 1 { return none }
    let left-title = if page-num == 2 {
      [पुस्तक परिचय]
    } else if page-num >= 3 and page-num <= 4 {
      [विषय-सूची]
    } else if page-num == 5 {
      [खंड १ : अनुभाग सूची]
    } else if page-num == 6 {
      [अनुभाग १.१ : लिपि का ऐतिहासिक उद्भव]
    } else if page-num == 7 {
      [अनुभाग १.१ : लिपि-विकास परंपरा एवं अभ्यास]
    } else if page-num == 8 {
      [अनुभाग १.२ : अक्षरात्मक प्रकृति एवं आबुगिदा व्यवस्था]
    } else if page-num == 9 {
      [अनुभाग १.२ : वर्ण-विच्छेद एवं आबुगिदा अभ्यास]
    } else if page-num == 10 {
      [अनुभाग १.३ : शिरोरेखा के प्रामाणिक नियम एवं महत्व]
    } else if page-num == 11 {
      [अनुभाग १.३ : शिरोरेखा विच्छेद एवं अभ्यास]
    } else {
      [हिन्दी पुस्तक]
    }
    let right-title = if page-num == 2 {
      [About the Book]
    } else if page-num >= 3 and page-num <= 4 {
      [Table of Contents]
    } else if page-num == 5 {
      [Part 1 : Section Directory]
    } else if page-num == 6 {
      [Section 1.1 : Origin & Evolution]
    } else if page-num == 7 {
      [Section 1.1 : Evolution & Review Drills]
    } else if page-num == 8 {
      [Section 1.2 : Abugida Architecture]
    } else if page-num == 9 {
      [Section 1.2 : Orthographic Analysis & Drills]
    } else if page-num == 10 {
      [Section 1.3 : Shirorekha Rules & Importance]
    } else if page-num == 11 {
      [Section 1.3 : Broken Letters & Exercises]
    } else {
      [Hindi Pushtak]
    }
    grid(
      columns: (1fr, 1fr),
      align: (left, right),
      text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 9.5pt, fill: rgb("#000000"))[#left-title],
      text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 9.5pt, fill: rgb("#1a1a1a"))[#right-title]
    )
    line(length: 100%, stroke: 0.5pt + rgb("#000000"))
  },
  footer: context {
    let page-num = counter(page).get().first()
    if page-num == 1 { return none }
    line(length: 100%, stroke: 0.5pt + rgb("#000000"))
    v(3pt)
    align(right, text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 11pt, fill: rgb("#000000"))[#page-num])
  }
)

#set text(
  font: ("Noto Serif Devanagari", "Noto Sans Devanagari", "DejaVu Serif"),
  size: 12pt,
  lang: "hi"
)

#set par(justify: true, leading: 0.75em, first-line-indent: 0pt)

// Utility styles for interlinear English annotations
#let en-sub(it) = text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 10pt, fill: rgb("#1a1a1a"))[#it]
#let en-line(it) = block(spacing: 5pt, text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 10pt, fill: rgb("#1a1a1a"))[#it])
#let en-para(it) = block(above: 12pt, below: 12pt, text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 10.2pt, fill: rgb("#1a1a1a"))[#h(16pt)#it])

// Standardized Core Typst Templates
#let section-opener(sec-num-hi, title-hi, sec-num-en, title-en) = [
  #v(2pt)
  #text(size: 15pt, weight: "bold")[अनुभाग #sec-num-hi : #title-hi] \
  #text(size: 9.5pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Section #sec-num-en : #title-en]
  #v(4pt)
  #line(length: 100%, stroke: 0.5pt + rgb("#000000"))
  #v(6pt)
]

#let section-subheading(num-hi, title-hi, num-en, title-en) = [
  #v(6pt)
  #text(size: 12.5pt, weight: "bold")[#num-hi. #title-hi] \
  #text(size: 8.8pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[#num-en. #title-en]
  #v(5pt)
]

#let intro-para(hi-text, en-text) = [
  #par(leading: 0.65em)[#hi-text]
  #v(2.5pt)
  #par(leading: 0.60em)[#text(size: 8.5pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[#en-text]]
]

#let spread-header(num-hi, title-hi, num-en, title-en) = [
  #v(2pt)
  #text(size: 14pt, weight: "bold")[#num-hi. #title-hi] \
  #text(size: 8.8pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[#num-en. #title-en]
  #v(4pt)
  #line(length: 100%, stroke: 0.5pt + rgb("#000000"))
  #v(5pt)
]

#let topic-heading(num-hi, title-hi, num-en, title-en) = [
  #v(5pt)
  #text(size: 13pt, weight: "bold")[#num-hi. #title-hi] \
  #text(size: 8.5pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[#num-en. #title-en]
  #v(3pt)
]

#let rule-box(title-hi, title-en, body) = rect(
  width: 100%,
  stroke: (left: 3pt + rgb("#000000")),
  inset: (left: 8pt, y: 5pt),
  fill: rgb("#ffffff")
)[
  #strong[#title-hi] #h(6pt) #en-sub[#title-en] #v(1pt)
  #body
]

#let exercise-box(title-hi, title-en, body) = block(
  width: 100%,
  stroke: 0.6pt + rgb("#000000"),
  inset: (x: 10pt, top: 8pt, bottom: 8pt),
  fill: rgb("#ffffff"),
  spacing: 8pt
)[
  #strong[#title-hi] #h(6pt) #text(size: 8.5pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[#title-en]
  #v(4pt)
  #line(length: 100%, stroke: 0.4pt + rgb("#000000"))
  #v(4pt)
  #body
]

#let kbd(key) = box(stroke: 0.6pt + rgb("#000000"), radius: 2.5pt, inset: (x: 4pt, y: 1.5pt), fill: rgb("#ffffff"))[
  #text(size: 7.5pt, font: "DejaVu Sans Mono", weight: "bold")[#key]
]

// --- PAGE 1: COVER ---
#align(right + top)[
  #v(80pt)
  #text(size: 30pt, fill: rgb("#000000"))[❖]
  #v(14pt)
  #text(size: 34pt, weight: "bold", fill: rgb("#000000"))[हिन्दी पुस्तक]
  #v(18pt)
  #text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 13pt, fill: rgb("#1a1a1a"))[Hindi Pushtak]
]

#pagebreak()

// --- PAGE 2: पुस्तक परिचय ---
#v(2pt)
#text(size: 16pt, weight: "bold")[पुस्तक परिचय] \
#text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 10pt, fill: rgb("#1a1a1a"))[About the Book]
#v(6pt)

#par(leading: 0.65em)[
  #text(size: 10.8pt)[
    #h(14pt)हिन्दी पुस्तक भाषा के सर्वांगीण, वैज्ञानिक एवं सोपानवत अध्ययन हेतु प्रस्तुत एक समग्र एवं प्रामाणिक संदर्भ ग्रंथ है। इस ग्रंथ की मूल संकल्पना देवनागरी लिपि के आंतरिक सौंदर्य, सुदृढ़ ध्वनिविज्ञान, समृद्ध शब्द-भंडार तथा व्यावहारिक व्याकरणिक संरचना को स्वाभाविक और तर्कसंगत रूप से सुगम बनाने पर आधारित है। आधुनिक युग में भाषा-अधिगम केवल नियमों को कंठस्थ करने तक सीमित नहीं रह सकता; अतः यह पुस्तक शिक्षार्थी को लिपि-विज्ञान के मूलाधारों से जोड़ते हुए अक्षरों के सटीक आलेखन, शिरोरेखा के संतुलन, उच्चारण-स्थानों की सूक्ष्म भिन्नताओं तथा मानक वर्तनी के अनिवार्य नियमों से परिचित कराती है। शिक्षार्थियों के भीतर भाषा के प्रति स्वाभाविक रुचि और विश्लेषणात्मक समझ विकसित करना ही इस ग्रंथ का मुख्य प्रयोजन है।
  ]
]

#v(3pt)

#par(leading: 0.60em)[
  #text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 9.0pt, fill: rgb("#1a1a1a"))[
    #h(14pt)Hindi Pushtak is an all-encompassing, definitive reference work designed for the comprehensive, scientific, and graded study of the Hindi language. The foundational concept makes the intrinsic aesthetic beauty, rigorous phonetics, rich vocabulary, and practical grammatical architecture of the Devanagari script accessible in a natural and rational manner. Moving beyond mechanical rote memorization, it connects learners directly with the core foundations of script science, acquainting them with the precise stroke formation of characters, horizontal balance of the headline, subtle distinctions of articulation points, and essential conventions of standard orthography. Cultivating a genuine affinity and analytical understanding of the language remains the principal objective of this endeavour.
  ]
]

#v(6pt)

#par(leading: 0.65em)[
  #text(size: 10.8pt)[
    #h(14pt)एक सर्वसमावेशी वृहद् संदर्भ ग्रंथ (मैग्नम ओपस मॉडल) के रूप में संरचित यह कृति प्राथमिक वर्ण-ज्ञान से लेकर उच्चस्तरीय प्रशासनिक एवं साहित्यिक अभिव्यक्तियों तक की समस्त विधाओं को अपनी विस्तृत परिधि में समेटती है। अध्ययन पद्धति पूर्णतः क्रमिक, द्विभाषिक एवं व्यावहारिक अनुप्रयोगात्मक उपागम पर अवलंबित है, जिसमें सुलेख-अभ्यास, दैनंदिन जीवन के जीवंत संवाद, साहित्यिक गद्य-पाठ, इनस्क्रिप्ट टंकण तथा आधिकारिक पत्राचार का सोपानवत अनुशीलन होता है। प्रत्येक संकल्पना के साथ सुस्पष्ट द्विभाषिक विवेचन, प्रामाणिक उदाहरण और व्यावहारिक संदर्भ समाहित हैं, ताकि स्वतंत्र अध्येता एवं कक्षा-कक्ष के विद्यार्थी दोनों ही समान सहजता से भाषा के मर्म को आत्मसात कर सकें।
  ]
]

#v(3pt)

#par(leading: 0.60em)[
  #text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 9.0pt, fill: rgb("#1a1a1a"))[
    #h(14pt)Conceived as an exhaustive, multi-layered master reference (Comprehensive Magnum Opus Model), this volume encompasses the full spectrum of linguistic expression, from foundational orthography to advanced administrative documentation and literary appreciation. Rooted in a systematic, bilingual communicative approach, it charts a seamless progression through calligraphy drills, living dialogues, graded prose narratives, standardized computer typography, and official institutional drafting. Every concept features explicit bilingual commentary, authentic illustrative paradigms, and contextual application, empowering both independent scholars and classroom learners to assimilate the living essence of the language with poise.
  ]
]

#v(6pt)

#par(leading: 0.65em)[
  #text(size: 10.8pt)[
    #h(14pt)भाषा केवल संप्रेषण का माध्यम नहीं, अपितु संस्कृति, चिंतन और मानवीय संवेदना की संवाहिका भी है। अतः यह ग्रंथ शिक्षार्थियों को व्यावहारिक संवाद-कौशल के साथ-साथ मानक पारिभाषिक शब्दावली, अनुवाद-सिद्धांत तथा समृद्ध सांस्कृतिक धरोहर से जोड़ता है। चाहे कार्यालयीन कार्य-व्यवहार हो, बैंकिंग एवं वाणिज्यिक गतिविधियाँ हों, अथवा सूचना प्रौद्योगिकी के अंतर्गत भारतीय भाषाओं का डिजिटल अनुप्रयोग, यह ग्रंथ प्रत्येक क्षेत्र में भाषा की व्यावहारिक सक्षमता एवं प्रामाणिक प्रवीणता प्रदान करने हेतु एक सुदृढ़ सेतु की भूमिका निभाता है।
  ]
]

#v(3pt)

#par(leading: 0.60em)[
  #text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 9.0pt, fill: rgb("#1a1a1a"))[
    #h(14pt)Language is not merely a vehicle for communication, but a living conduit of culture, intellect, and human sensibility. Consequently, this work connects learners not only with functional conversational fluency, but equally with standardized technical terminology, translation principles, and rich cultural heritage. Whether navigating institutional workflows, financial and commercial transactions, or modern digital communication in Indian languages, this text serves as a dependable bridge empowering learners with genuine communicative competence and enduring mastery across all spheres.
  ]
]

#pagebreak()
// --- PAGES 3 to 4: विषय-सूची (३० खंड) ---
#set table(
  stroke: (x, y) => if y == 0 { (bottom: 1pt + rgb("#000000"), top: 1pt + rgb("#000000")) } else { (bottom: 0.3pt + rgb("#000000")) },
  fill: (x, y) => if y == 0 { rgb("#ffffff") } else { none },
  inset: (x: 5pt, y: 5.2pt)
)

// --- PAGE 3: विषय-सूची (खंड १ से १५) ---
#v(2pt)
#text(size: 16pt, weight: "bold")[विषय-सूची : भाग १] \
#en-sub[Table of Contents : Parts 1 to 15]
#v(4pt)

#table(
  columns: (54pt, 1fr),
  align: (center + horizon, left + horizon),
  [*खंड* \ #en-sub[Part]], [*शीर्षक एवं विषय-वस्तु* \ #en-sub[Title & Scope of Part]],
  [#strong[खंड १] \
  #en-sub[Part 1]],
  [#strong[देवनागरी लिपि-संरचना एवं सुलेख कला] \
  #en-sub[Devanagari Script Architecture & Calligraphy]],
  [#strong[खंड २] \
  #en-sub[Part 2]],
  [#strong[स्वर, अनुस्वार एवं नासिक्य ध्वनियाँ] \
  #en-sub[Vowels, Diacritics & Nasalization]],
  [#strong[खंड ३] \
  #en-sub[Part 3]],
  [#strong[व्यंजन-व्यवस्था एवं उच्चारण-विज्ञान] \
  #en-sub[Consonant Classification & Phonetics]],
  [#strong[खंड ४] \
  #en-sub[Part 4]],
  [#strong[संयुक्ताक्षर, संधि एवं वर्ण-विच्छेद] \
  #en-sub[Conjuncts, Sandhi & Orthographic Analysis]],
  [#strong[खंड ५] \
  #en-sub[Part 5]],
  [#strong[संज्ञा, लिंग-व्यवस्था एवं प्रकृति] \
  #en-sub[Noun Classes & Grammatical Gender]],
  [#strong[खंड ६] \
  #en-sub[Part 6]],
  [#strong[वचन-विधान एवं रूपांतरण व्यवस्था] \
  #en-sub[Number System & Pluralization]],
  [#strong[खंड ७] \
  #en-sub[Part 7]],
  [#strong[कारक-प्रणाली, परसर्ग एवं तिर्यक रूप] \
  #en-sub[Case System, Postpositions & Oblique Forms]],
  [#strong[खंड ८] \
  #en-sub[Part 8]],
  [#strong[सर्वनाम-व्यवस्था एवं रूपावली] \
  #en-sub[Pronouns, Declensions & Demonstratives]],
  [#strong[खंड ९] \
  #en-sub[Part 9]],
  [#strong[विशेषण, प्रविशेषण एवं तुलनात्मक अवस्थाएँ] \
  #en-sub[Adjectives, Intensifiers & Comparisons]],
  [#strong[खंड १०] \
  #en-sub[Part 10]],
  [#strong[संख्या-पद्धति, गणना एवं मापन प्रणाली] \
  #en-sub[Numerals, Counting & Measurement Systems]],
  [#strong[खंड ११] \
  #en-sub[Part 11]],
  [#strong[क्रिया-मूल, धातु एवं होना सहायक क्रिया] \
  #en-sub[Verb Roots, Infinitives & Copula Hona]],
  [#strong[खंड १२] \
  #en-sub[Part 12]],
  [#strong[वर्तमान काल : सामान्य, अपूर्ण एवं संदिग्ध] \
  #en-sub[Present Tenses: Simple, Continuous & Presumptive]],
  [#strong[खंड १३] \
  #en-sub[Part 13]],
  [#strong[भूतकाल : सामान्य, आसन्न, पूर्ण एवं संदिग्ध] \
  #en-sub[Past Tenses: Simple, Immediate, Perfect & Habitual]],
  [#strong[खंड १४] \
  #en-sub[Part 14]],
  [#strong[ने परसर्ग नियम एवं सकर्मक भूतकाल] \
  #en-sub[Ergative Ne Rule & Transitive Past Syntax]],
  [#strong[खंड १५] \
  #en-sub[Part 15]],
  [#strong[भविष्यत् काल, आज्ञार्थ एवं विध्यर्थ] \
  #en-sub[Future Tenses, Imperatives & Optatives]],
)

#pagebreak()

// --- PAGE 4: विषय-सूची (खंड १६ से ३०) ---
#v(2pt)
#text(size: 16pt, weight: "bold")[विषय-सूची : भाग २] \
#en-sub[Table of Contents : Parts 16 to 30]
#v(4pt)

#table(
  columns: (54pt, 1fr),
  align: (center + horizon, left + horizon),
  [*खंड* \ #en-sub[Part]], [*शीर्षक एवं विषय-वस्तु* \ #en-sub[Title & Scope of Part]],
  [#strong[खंड १६] \
  #en-sub[Part 16]],
  [#strong[संयुक्त क्रियाएँ एवं रंजक धातु व्यवस्था] \
  #en-sub[Compound Verbs & Explicators]],
  [#strong[खंड १७] \
  #en-sub[Part 17]],
  [#strong[प्रेरणार्थक क्रियाएँ एवं प्रक्रियात्मक रचना] \
  #en-sub[Causative Verbs & Derivations]],
  [#strong[खंड १८] \
  #en-sub[Part 18]],
  [#strong[पक्ष, वृत्ति एवं विवशतापरक संरचनाएँ] \
  #en-sub[Verbal Aspects, Modality & Obligation]],
  [#strong[खंड १९] \
  #en-sub[Part 19]],
  [#strong[कृदंत, पूर्वकालिक क्रिया एवं क्रिया-विशेषण] \
  #en-sub[Participles, Absolutives & Adverbs]],
  [#strong[खंड २०] \
  #en-sub[Part 20]],
  [#strong[वाच्य-विधान : कर्तृवाच्य, कर्मवाच्य व भाववाच्य] \
  #en-sub[Voice: Active, Passive & Impersonal]],
  [#strong[खंड २१] \
  #en-sub[Part 21]],
  [#strong[वाक्य-रचना, भेद एवं अव्यय संयोजन] \
  #en-sub[Sentence Syntax, Conjunctions & Modifiers]],
  [#strong[खंड २२] \
  #en-sub[Part 22]],
  [#strong[उपवाक्य, संबंधपरक रचना एवं नित्य-संबंधी] \
  #en-sub[Relative Clauses & Correlative Constructions]],
  [#strong[खंड २३] \
  #en-sub[Part 23]],
  [#strong[दैनिक जीवन, शिष्टाचार एवं सामाजिक संवाद] \
  #en-sub[Daily Life, Social Etiquette & Greetings]],
  [#strong[खंड २४] \
  #en-sub[Part 24]],
  [#strong[उपयोगिता, सेवाएँ, यात्रा एवं जन-संवाद] \
  #en-sub[Public Utilities, Travel & Essential Services]],
  [#strong[खंड २५] \
  #en-sub[Part 25]],
  [#strong[प्रयोजनमूलक एवं कार्यालयीन प्रशासनिक हिंदी] \
  #en-sub[Official Language Policy & Administrative Idiom]],
  [#strong[खंड २६] \
  #en-sub[Part 26]],
  [#strong[टिप्पण, आलेखन एवं प्रारूपण पद्धति] \
  #en-sub[Noting, Drafting & Official Formats]],
  [#strong[खंड २७] \
  #en-sub[Part 27]],
  [#strong[बैंकिंग, वाणिज्यिक एवं वित्तीय कार्य-प्रणाली] \
  #en-sub[Commercial Banking, Operations & Financial Terms]],
  [#strong[खंड २८] \
  #en-sub[Part 28]],
  [#strong[कंप्यूटर, यूनिकोड एवं इनस्क्रिप्ट टंकण] \
  #en-sub[Computing, Unicode & InScript Touch Typing]],
  [#strong[खंड २९] \
  #en-sub[Part 29]],
  [#strong[अनुवाद-सिद्धांत, मुहावरे एवं मानक वर्तनी] \
  #en-sub[Translation Theory, Idioms & Orthography]],
  [#strong[खंड ३०] \
  #en-sub[Part 30]],
  [#strong[गद्य-पाठमाला, संस्कृति एवं वृहद् शब्दकोश] \
  #en-sub[Literary Readings, Cultural Heritage & Master Lexicon]],
)

#pagebreak()

// --- PAGE 5: खंड १ मुखपृष्ठ एवं २० अनुभाग सूची ---
// --- खंड १ : मुखपृष्ठ एवं अनुभाग-सूची (Part 1 Opener) ---
#text(size: 14pt, weight: "bold")[खंड १ : देवनागरी लिपि-संरचना एवं सुलेख कला] \
#text(size: 9.0pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Part 1 : Devanagari Script Architecture & Calligraphy]
#v(1.5pt)
#line(length: 100%, stroke: 0.5pt + rgb("#000000"))
#v(1.5pt)
#text(size: 8.5pt)[इस खंड में देवनागरी लिपि के ऐतिहासिक उद्भव, वैज्ञानिक संरचना, अक्षरात्मक व्यवस्था, शिरोरेखा के प्रामाणिक नियम तथा सुलेख कला का सर्वांगीण अध्ययन प्रस्तुत किया गया है।] \
#text(size: 7.5pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[This part presents a comprehensive study of the historical origin of Devanagari script, its scientific architecture, syllabic abugida system, authentic shirorekha rules, and calligraphy.]
#v(1.5pt)
#text(size: 9.5pt, weight: "bold")[अनुभाग सूची] #h(6pt) #text(size: 8.0pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Section Directory (20 Sections)]
#v(0.5pt)
#table(
  columns: (28pt, 1fr, 28pt, 1fr),
  inset: (x: 4pt, y: 5.5pt),
  align: (center + horizon, left + horizon, center + horizon, left + horizon),
  [*अनु.* \ #text(size: 7.5pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Sec]],
  [*अनुभाग शीर्षक एवं विषय* \ #text(size: 7.5pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Section Title & Scope]],
  [*अनु.* \ #text(size: 7.5pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Sec]],
  [*अनुभाग शीर्षक एवं विषय* \ #text(size: 7.5pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Section Title & Scope]],

  [#text(size: 9.8pt, weight: "bold")[१.१] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.1]],
  [#text(size: 9.8pt, weight: "bold")[देवनागरी लिपि का ऐतिहासिक उद्भव] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Historical Origin & Evolution of Devanagari]],
  [#text(size: 9.8pt, weight: "bold")[१.११] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.11]],
  [#text(size: 9.8pt, weight: "bold")[ऊर्ध्व मात्राओं (े, ै, ो, औ) का संयोजन] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Top Diacritic Connections & Angles]],

  [#text(size: 9.8pt, weight: "bold")[१.२] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.2]],
  [#text(size: 9.8pt, weight: "bold")[अक्षरात्मक प्रकृति एवं आबुगिदा व्यवस्था] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Syllabic Nature & Abugida Architecture]],
  [#text(size: 9.8pt, weight: "bold")[१.१२] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.12]],
  [#text(size: 9.8pt, weight: "bold")[अधो मात्राओं (ु, ू, ृ) का सुलेखन] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Bottom Diacritics (u, uu, ri) Placement]],

  [#text(size: 9.8pt, weight: "bold")[१.३] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.3]],
  [#text(size: 9.8pt, weight: "bold")[शिरोरेखा के प्रामाणिक नियम एवं महत्व] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Shirorekha Rules, Importance & Alignment]],
  [#text(size: 9.8pt, weight: "bold")[१.१३] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.13]],
  [#text(size: 9.8pt, weight: "bold")[हस्तलेख सुधार प्रविधियाँ एवं अभ्यास] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Handwriting Drills & Stroke Consistency]],

  [#text(size: 9.8pt, weight: "bold")[१.४] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.4]],
  [#text(size: 9.8pt, weight: "bold")[खड़ी पाई वाले वर्णों की मानक संरचना] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Characters with Vertical Stem (Khadi Pai)]],
  [#text(size: 9.8pt, weight: "bold")[१.१४] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.14]],
  [#text(size: 9.8pt, weight: "bold")[देवनागरी अंक संरचना (० से ९) एवं स्ट्रोक] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Devanagari Numerals (0-9) Stroke Sequence]],

  [#text(size: 9.8pt, weight: "bold")[१.५] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.5]],
  [#text(size: 9.8pt, weight: "bold")[बिना पाई एवं गोलाकार वर्णों की संरचना] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Non-Stemmed & Circular Character Anatomy]],
  [#text(size: 9.8pt, weight: "bold")[१.१५] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.15]],
  [#text(size: 9.8pt, weight: "bold")[मानक लिपि संकेत एवं विराम चिह्नों का अंकन] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Punctuation Marks & Orthographic Signs]],

  [#text(size: 9.8pt, weight: "bold")[१.६] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.6]],
  [#text(size: 9.8pt, weight: "bold")[सुलेख स्ट्रोक क्रम एवं कलम संचालन] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Calligraphic Stroke Order & Pen Flow]],
  [#text(size: 9.8pt, weight: "bold")[१.१६] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.16]],
  [#text(size: 9.8pt, weight: "bold")[केंद्रीय हिंदी निदेशालय के मानकीकृत वर्ण] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[CHD Standardized Character Variants]],

  [#text(size: 9.8pt, weight: "bold")[१.७] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.7]],
  [#text(size: 9.8pt, weight: "bold")[अक्षरों का अनुपातिक एवं ज्यामितीय संतुलन] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Geometric Balance & Proportional Spacing]],
  [#text(size: 9.8pt, weight: "bold")[१.१७] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.17]],
  [#text(size: 9.8pt, weight: "bold")[भ्रामक वर्ण-युग्मों में दृश्य अंतर (ख/रव, घ/ध)] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Visually Similar Letters & Distinctions]],

  [#text(size: 9.8pt, weight: "bold")[१.८] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.8]],
  [#text(size: 9.8pt, weight: "bold")[ध, भ, थ, झ, श्र में शिरोरेखा विच्छेद] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Shirorekha Breaks in Broken-Loop Letters]],
  [#text(size: 9.8pt, weight: "bold")[१.१८] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.18]],
  [#text(size: 9.8pt, weight: "bold")[कैलीग्राफी निब एवं स्याही तकनीक] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Calligraphy Nibs, Ink Flow & Paper Angle]],

  [#text(size: 9.8pt, weight: "bold")[१.९] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.9]],
  [#text(size: 9.8pt, weight: "bold")[र वर्ण के विविध सुलेख रूप (रेफ़ व पदेन)] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Allographs of Ra (Reph & Paden)]],
  [#text(size: 9.8pt, weight: "bold")[१.१९] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.19]],
  [#text(size: 9.8pt, weight: "bold")[द्रुत लिपि एवं त्वरित हस्तलेखन अभ्यास] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Cursive Speed Writing & Legibility]],

  [#text(size: 9.8pt, weight: "bold")[१.१०] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.10]],
  [#text(size: 9.8pt, weight: "bold")[ह्रस्व व दीर्घ मात्राओं का आलेखन] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Placement Geometry of Short & Long Matras]],
  [#text(size: 9.8pt, weight: "bold")[१.२०] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.20]],
  [#text(size: 9.8pt, weight: "bold")[वर्ण सुलेख स्व-मूल्यांकन एवं परिशोधन] \ #text(size: 8.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Lettering Self-Evaluation & Correction]],
)

#pagebreak()
// --- PAGE 6: अनुभाग १.१ : देवनागरी लिपि का ऐतिहासिक उद्भव एवं विकास (भाग १) ---
#section-opener(
  [१.१], [देवनागरी लिपि का ऐतिहासिक उद्भव एवं विकास],
  [1.1], [Historical Origin & Structural Evolution of Devanagari Script]
)

#intro-para(
  [देवनागरी विश्व की सर्वाधिक वैज्ञानिक, व्यवस्थित एवं ध्वन्यात्मक लिपियों में से एक है। इसका विकास प्राचीन ब्राह्मी लिपि की उत्तरी धारा से हुआ है। यह लिपि बाएँ से दाएँ लिखी जाती है तथा इसकी सबसे बड़ी विशेषता यह है कि प्रत्येक वर्ण का उच्चारण उसके लिखित रूप के सर्वथा अनुरूप होता है।],
  [Devanagari is one of the most scientific, systematic, and phonetic scripts in the world, having evolved from the northern branch of ancient Brahmi. Written from left to right, its defining hallmark is absolute phonetic correspondence—every character is pronounced exactly as it is written.]
)

#section-subheading(
  [१], [लिपि की आधारभूत विशेषताएँ],
  [1], [Fundamental Characteristics of the Script Architecture]
)

#rule-box(
  [१. अक्षरात्मक प्रकृति],
  [1. Syllabic Nature / Abugida Architecture],
  [देवनागरी विशुद्ध वर्णात्मक नहीं अपितु अक्षरात्मक है। प्रत्येक व्यंजन वर्ण में अंतर्निहित 'अ' स्वर स्वाभाविक रूप से सम्मिलित रहता है (जैसे: क् + अ = क)। स्वर के अभाव को दर्शाने हेतु हलंत चिह्न (्) का प्रयोग किया जाता है। #en-line[Devanagari is an abugida rather than a pure alphabet. Every consonant possesses an inherent schwa vowel 'a' (e.g. k + a = ka). The virama / halant sign is employed when a consonant is devoid of its inherent vowel.]]
)

#v(5pt)
#rule-box(
  [२. शिरोरेखा का संरचनात्मक महत्व],
  [2. Structural Equilibrium of the Shirorekha],
  [अक्षरों के ऊपर खींची जाने वाली क्षैतिज रेखा 'शिरोरेखा' कहलाती है। यह शब्दों को एक सुदृढ़ दृश्य सूत्र में बाँधती है, पृष्ठ पर पाठ को अनुशासित संरेखण प्रदान करती है तथा लिपि को विशिष्ट कलात्मक पहचान देती है। #en-line[The continuous horizontal top line is termed Shirorekha. It unifies individual letter forms into cohesive word units, provides disciplined optical alignment across the page, and confers distinctive typographic identity.]]
)

#v(5pt)
#rule-box(
  [३. ज्यामितीय एवं रूपात्मक संतुलन],
  [3. Geometric Harmony and Proportional Spacing],
  [देवनागरी वर्णमाला ऊर्ध्व रेखाओं (खड़ी पाई), वृत्तों, अर्धवृत्तों तथा पाशों के अनुपातिक समन्वय पर आधारित है। लंबवत खड़ी पाई सदैव ९० अंश पर लंबवत होनी चाहिए ताकि अक्षरों में स्वाभाविक संतुलन बना रहे। #en-line[The Devanagari graphic repertoire is harmoniously constructed from vertical standing stems (Khadi Pai), circular nodes, semicircles, and loops. Vertical stems are strictly perpendicular at 90 degrees for visual equilibrium.]]
)
#pagebreak()

// --- PAGE 7: अनुभाग १.१ : लिपि-विकास, पारिभाषिक शब्दावली एवं अभ्यास ---
#spread-header(
  [२], [लिपि-उद्भव एवं विकास परंपरा],
  [2], [Historical Origin & Evolution Lineage]
)

भारतीय लिपियों की जननी प्राचीन 'ब्राह्मी लिपि' (ईसा पूर्व तीसरी सदी) मानी जाती है। ब्राह्मी से गुप्त लिपि, तत्पश्चात कुटिल (सिद्धमातृका) लिपि और उससे १०वीं-११वीं शताब्दी में नागरी (देवनागरी) लिपि का प्रादुर्भाव हुआ: #v(2pt)
#text(size: 8.5pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Ancient Brahmi (3rd century BCE) is the mother of Indian scripts. From Brahmi evolved the Gupta script, followed by Kutila (Siddhamatrika), eventually culminating in Devanagari around the 10th-11th century CE.]

#v(2pt)
#table(
  columns: (70pt, 120pt, 1fr),
  inset: (x: 5pt, y: 4.8pt),
  align: (center + horizon, left + horizon, left + horizon),
  [*काल / युग* \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[Period / Epoch]], [*लिपि अवस्था* \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[Script Stage]], [*विशिष्ट लक्षण* \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[Defining Characteristics]],
  [#strong[ई.पू. ३री सदी] \ #text(size: 6.8pt)[#text(fill: rgb("#1a1a1a"))[3rd C. BCE]]], [#strong[अशोककालीन ब्राह्मी] \ #text(size: 6.8pt)[#text(fill: rgb("#1a1a1a"))[Ashokan Brahmi]]], [सरल ज्यामितीय रेखाएँ, शिरोरेखा का पूर्ण अभाव। \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[Simple geometric angles; no horizontal headline.]],
  [#strong[४थी-५वीं सदी] \ #text(size: 6.8pt)[#text(fill: rgb("#1a1a1a"))[4th-5th C. CE]]], [#strong[गुप्त लिपि] \ #text(size: 6.8pt)[#text(fill: rgb("#1a1a1a"))[Gupta Script]]], [अक्षरों के शीर्ष पर ठोस त्रिकोण / चौरस सिरा निर्माण। \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[Solid triangular top headmarks on letter stems.]],
  [#strong[६ठी-९वीं सदी] \ #text(size: 6.8pt)[#text(fill: rgb("#1a1a1a"))[6th-9th C. CE]]], [#strong[कुटिल / सिद्धमातृका] \ #text(size: 6.8pt)[#text(fill: rgb("#1a1a1a"))[Kutila / Siddhamatrika]]], [शीर्ष पर क्षैतिज रेखा का विस्तार, वक्राकार अक्षरांग। \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[Horizontal line extension; bent, curved letter forms.]],
  [#strong[१०वीं सदी-] \ #text(size: 6.8pt)[#text(fill: rgb("#1a1a1a"))[10th C. CE+]]], [#strong[प्राचीन देवनागरी] \ #text(size: 6.8pt)[#text(fill: rgb("#1a1a1a"))[Early Devanagari]]], [सतत शिरोरेखा, खड़ी पाई तथा वर्तमान वर्ण-रूपों का परिपाक। \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[Continuous shirorekha, vertical stems, modern letters.]]
)

#topic-heading(
  [२], [प्रमुख पारिभाषिक शब्दावली],
  [3], [Core Technical Terms & Orthographic Concepts]
)

#table(
  columns: (80pt, 85pt, 1fr),
  inset: (x: 5pt, y: 4.5pt),
  align: (center + horizon, left + horizon, left + horizon),
  [*पारिभाषिक पद* \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[Hindi Term]], [*रोमन उच्चारण* \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[Transliteration]], [*विस्तृत अर्थ एवं संकल्पना* \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[Meaning & Contextual Explanation]],
  [#strong[शिरोरेखा]], [#text(fill: rgb("#1a1a1a"))[Shirorekha]], [वर्णों के शीर्ष पर खींची जाने वाली क्षैतिज रेखा। \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[Continuous horizontal headline drawn over characters.]],
  [#strong[खड़ी पाई]], [#text(fill: rgb("#1a1a1a"))[Khadi Pai]], [वर्णों की मुख्य लंबवत सीधी रेखा (उदा. क, ग, त)। \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[Primary vertical standing stem at 90 degrees.]],
  [#strong[हलंत (्)]], [#text(fill: rgb("#1a1a1a"))[Halant / Virama]], [व्यंजन से अंतर्निहित 'अ' स्वर हटाने वाला अधो-चिह्न। \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[Diacritic muting the inherent vowel to form pure consonant.]]
)

#v(6pt)

#exercise-box(
  [अनुभाग १.१ स्व-मूल्यांकन अभ्यास],
  [Section 1.1 Comprehension & Review Worksheet],
  [
    #strong[१. देवनागरी लिपि किस प्राचीन लिपि की वंशज है?] #h(10pt) #text(size: 8.5pt, fill: rgb("#000000"))[(अ) खरोष्ठी #h(8pt) (ब) ब्राह्मी #h(8pt) (स) ग्रीक]     #v(1pt)
    #text(size: 7.5pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Q1. Which ancient script is Devanagari directly descended from? (a) Kharosthi (b) Brahmi (c) Greek]     #v(5pt)
    #strong[२. 'आबुगिदा' लिपि व्यवस्था में प्रत्येक व्यंजन वर्ण में कौन सा स्वर अंतर्निहित रहता है?] ........................     #v(1pt)
    #text(size: 7.5pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Q2. In an abugida script architecture, which inherent vowel is naturally contained in every consonant? ....................]
  ]
)

#pagebreak()

// --- PAGE 8: अनुभाग १.२ : अक्षरात्मक प्रकृति एवं आबुगिदा व्यवस्था (भाग १) ---
#section-opener(
  [१.२], [अक्षरात्मक प्रकृति एवं आबुगिदा व्यवस्था],
  [1.2], [Syllabic Architecture & Abugida Structural System]
)

#intro-para(
  [देवनागरी लिपि की मूल संरचना 'अक्षरात्मक' (Abugida / Alphasyllabary) है। पश्चिमी वर्णमालाओं (जैसे लैटिन) के विपरीत जहाँ स्वर और व्यंजन स्वतंत्र एवं समान रूप से पृथक लिखे जाते हैं, देवनागरी में प्रत्येक स्वतंत्र व्यंजन वर्ण में 'अ' (ह्रस्व अ) का स्वर स्वाभाविक रूप से अंतर्निहित रहता है।],
  [The fundamental architecture of Devanagari is an abugida (alphasyllabary). Unlike Western alphabets (such as Latin) where vowels and consonants are written as separate, independent letters of equal standing, every baseline consonant in Devanagari inherently incorporates the neutral vowel 'a' (schwa).]
)

#section-subheading(
  [१], [आबुगिदा व्यवस्था के मूलभूत घटक],
  [1], [Primary Constituents of the Abugida System]
)

#rule-box(
  [१. अंतर्निहित 'अ' स्वर (Inherent Schwa Vowel)],
  [Inherent Schwa Principle],
  [जब हम 'क' लिखते हैं, तो उसका उच्चारण केवल 'क्' नहीं अपितु 'क् + अ' होता है। इसे सस्वर व्यंजन या पूर्ण अक्षर कहा जाता है। बिना किसी अतिरिक्त मात्रा चिह्न के व्यंजन अपनी स्वाभाविक सस्वर अवस्था में रहता है। #en-line[When we write the grapheme 'क', its phonetic realization is not merely the plosive /k/ but /kə/ (k + a). This constitutes a full syllabic unit. Consonants exist in this inherent vocalic state by default.]]
)

#v(5pt)
#rule-box(
  [२. मात्रा-विधान एवं स्वर-संयोजन (Vowel Diacritics)],
  [Diacritic Matra Modification],
  [जब व्यंजन के साथ 'अ' के अतिरिक्त किसी अन्य स्वर (आ, इ, ई, उ, ऊ, ऋ, ए, ऐ, ओ, औ) का मेल होता है, तब स्वर अपने मूल रूप में न आकर संबंधित 'मात्रा' चिह्न के रूप में व्यंजन के चारों ओर जुड़ता है। #en-line[When a consonant combines with any vowel other than inherent 'a', the vowel is rendered not as an independent letter but as a secondary diacritic glyph (Matra) attaching to the consonant.]]
)

#v(5pt)
#rule-box(
  [३. हलंत / विसर्ग चिह्न द्वारा स्वर-विलोपन (Virama / Halant Function)],
  [Vowel Suppression via Halant],
  [व्यंजन से अंतर्निहित 'अ' स्वर को पूर्णतः समाप्त करने हेतु उसके नीचे हलंत चिह्न (्) लगाया जाता है (उदा. क्, त्, म्)। हलंत युक्त वर्ण 'विशुद्ध व्यंजन' (Pure Consonant) का प्रतिनिधित्व करता है। #en-line[To suppress or remove the inherent vowel from a consonant, a subscript diagonal stroke known as Halant (Virama) is appended beneath the stem. Halant characters represent pure consonantal codas.]]
)

#topic-heading(
  [२], [क वर्ण का संपूर्ण मात्रा-संयोजन (बारहखड़ी स्वरूप)],
  [2], [Master Diacritic Paradigm of Consonant 'Ka' (Barakhadi Series)]
)

#table(
  columns: (38pt, 38pt, 38pt, 38pt, 38pt, 38pt, 38pt, 38pt, 38pt, 38pt, 38pt, 38pt),
  inset: (x: 2pt, y: 4pt),
  align: center + horizon,
  [*क* \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[ka]],
  [*का* \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[kaa]],
  [*कि* \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[ki]],
  [*की* \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[kee]],
  [*कु* \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[ku]],
  [*कू* \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[koo]],
  [*कृ* \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[kri]],
  [*के* \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[ke]],
  [*कै* \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[kai]],
  [*को* \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[ko]],
  [*कौ* \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[kau]],
  [*कं* \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[kam]],
  [क्+अ], [क्+आ], [क्+इ], [क्+ई], [क्+उ], [क्+ऊ], [क्+ऋ], [क्+ए], [क्+ऐ], [क्+ओ], [क्+औ], [क्+अं]
)

#pagebreak()

// --- PAGE 9: अनुभाग १.२ : वर्ण-विच्छेद, आबुगिदा विश्लेषण एवं अभ्यास (भाग २) ---
#spread-header(
  [३], [वर्ण-विच्छेद एवं ध्वन्यात्मक विश्लेषण],
  [3], [Phonetic Deconstruction & Orthographic Analysis]
)

देवनागरी में किसी शब्द के प्रत्येक स्वर और विशुद्ध व्यंजन को पृथक-पृथक कर प्रदर्शित करने की प्रक्रिया को 'वर्ण-विच्छेद' कहा जाता है। यह आबुगिदा व्यवस्था की गहन समझ और शुद्ध वर्तनी के अधिगम हेतु सर्वाधिक प्रभावी प्रविधि है: #v(2pt)
#text(size: 8.5pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[The process of disassembling a written word into its constituent pure consonants and independent vowels is known as Varna-Vichhed (orthographic analysis). It forms the pedagogical foundation of Devanagari literacy.]

#v(3pt)
#table(
  columns: (70pt, 120pt, 1fr),
  inset: (x: 5pt, y: 3.0pt),
  align: (center + horizon, left + horizon, left + horizon),
  [*शब्द* \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[Word]], [*ध्वनि संघटन (वर्ण-विच्छेद)* \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[Phonetic Decomposition]], [*आबुगिदा संरचनात्मक विवरण* \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[Structural Analysis & Vowel Behavior]],
  [#strong[कमल] \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[kamal]], [क् + अ + म् + अ + ल् + अ], [तीन अक्षरों में अंतर्निहित 'अ' स्वर की स्वाभाविक उपस्थिति। \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[Three syllabic units with default inherent schwa.]],
  [#strong[भारत] \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[bhaarat]], [भ् + आ + र् + अ + त् + अ], [प्रथम वर्ण में 'आ' की मात्रा, शेष में अंतर्निहित 'अ'। \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[First consonant with /aa/ matra, followed by schwas.]],
  [#strong[पुस्तक] \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[pustak]], [प् + उ + स् + त् + अ + क् + अ], ['स्' में स्वर का अभाव (हलंत/अर्ध-रूप), 'प्' में 'उ' मात्रा। \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[Vowel-less 's' cluster followed by 'ta' and 'ka'.]],
  [#strong[देवनागरी] \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[devanaagarii]], [द् + ए + व् + अ + न् + आ + ग् + अ + र् + ई], [ऊर्ध्व 'ए' मात्रा, पार्श्व 'आ' मात्रा एवं दीर्घ 'ई' मात्रा। \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[Top diacritic 'e', lateral 'aa', and terminal long 'ee'.]]
)

#topic-heading(
  [४], [आबुगिदा एवं वर्णमाला प्रणाली की तुलना],
  [4], [Abugida vs Full Alphabet Comparison]
)
#v(2pt)

#table(
  columns: (110pt, 1fr, 1fr),
  inset: (x: 5pt, y: 2.8pt),
  align: (left + horizon, left + horizon, left + horizon),
  [*तुलनात्मक बिंदु* \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[Comparative Parameter]], [*देवनागरी (आबुगिदा)* \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[Devanagari (Abugida)]], [*रोमन / अंग्रेज़ी (वर्णमाला)* \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[Roman / English (Alphabet)]],
  [#strong[मूल वर्ण की प्रकृति] \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[Basic Character Nature]], [अक्षरात्मक (व्यंजन + अंतर्निहित स्वर)। \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[Syllabic (Consonant + Inherent Schwa).]], [शुद्ध ध्वन्यात्मक (स्वर-रहित व्यंजन)। \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[Segmental phoneme without vowels.]],
  [#strong[स्वर की उपस्थिति] \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[Vowel Representation]], [मात्रा चिह्न के रूप में व्यंजन से संबंद्ध। \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[Secondary diacritic attached to stem.]], [पृथक एवं समान आकार का स्वतंत्र अक्षर। \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[Independent letter written in-line.]],
  [#strong[उच्चारण अनुरूपता] \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[Grapheme-Phoneme Match]], [शत-प्रतिशत प्रत्यक्ष एवं नियमित। \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[Strict 100% phonetic correspondence.]], [अप्रत्यक्ष एवं परिवर्तनशील (Silent letters). \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[Irregular spelling with silent letters.]]
)

#v(3pt)

#exercise-box(
  [अनुभाग १.२ स्व-मूल्यांकन अभ्यास],
  [Section 1.2 Abugida & Orthographic Worksheet],
  [
    #strong[१. देवनागरी में बिना किसी मात्रा वाले स्वतंत्र व्यंजन वर्ण में कौन सा स्वर अंतर्निहित रहता है?] #h(10pt) #text(size: 8.5pt, fill: rgb("#000000"))[(अ) आ #h(8pt) (ब) अ #h(8pt) (स) ई] \
    #text(size: 7.5pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Q1. Which vowel is naturally inherent in an unaugmented Devanagari consonant? (a) aa (b) a (schwa) (c) ee] \
    #v(3pt)
    #strong[२. 'विज्ञान' शब्द का मानक वर्ण-विच्छेद कीजिए:] ............................................................................ \
    #text(size: 7.5pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Q2. Write the standard phonetic deconstruction (varna-vichhed) for the word 'विज्ञान': ....................................]
  ]
)

#pagebreak()

// --- PAGE 10: अनुभाग १.३ : शिरोरेखा के प्रामाणिक नियम एवं महत्व (भाग १) ---
#section-opener(
  [१.३], [शिरोरेखा के प्रामाणिक नियम एवं महत्व],
  [1.3], [Shirorekha Rules, Importance & Alignment]
)

#intro-para(
  [केंद्रीय हिंदी निदेशालय (शिक्षा मंत्रालय, भारत सरकार) द्वारा प्रवर्तित 'देवनागरी लिपि तथा हिंदी वर्तनी का मानकीकरण' के अनुसार हिंदी लेखन में शिरोरेखा (Headline / Overhead Bar) का प्रयोग अनिवार्य एवं अनवरत रहेगा। यह रेखा केवल सौंदर्यात्मक आभूषण नहीं, अपितु प्रत्येक शब्द के स्वतंत्र वर्णों को एकीकृत भाषिक इकाई में आबद्ध करने वाला संरचनात्मक आधार है।],
  [Per the standardized guidelines 'Devanagari Script & Hindi Orthography Standardization' established by the Central Hindi Directorate (Ministry of Education, Govt of India), the continuous use of Shirorekha is mandatory. It serves as the foundational datum line binding phonetic characters into coherent lexical units.]
)

#section-subheading(
  [१], [शिरोरेखा के तीन अनिवार्य संरचनात्मक सिद्धांत],
  [1], [Three Core Architectural Principles of Shirorekha]
)

#rule-box(
  [१. शब्द-एकत्रीकरण एवं क्षैतिज संरेखण (मानकीकरण नियम)],
  [Word Integration & Horizontal Alignment Directive],
  [देवनागरी में अक्षर शीर्ष रेखा से नीचे लटकते हैं (Hanging Script)। शिरोरेखा सभी अक्षरों को शीर्ष से जोड़ते हुए स्थिर क्षैतिज संरेखण प्रदान करती है। एक पद के समस्त अक्षरों पर अखंड रेखा खींची जाती है। #en-line[Under official standardization rules, characters hang downward from an overhead ceiling bar. The shirorekha provides this top datum line, visually grouping letters into distinct lexical units under a single continuous stroke.]]
)

#v(4pt)
#rule-box(
  [२. स्ट्रोक-क्रम एवं अंतिम अंकन नियम (सुलेख संदर्शिका)],
  [Terminal Stroke Execution Order & Calligraphy Guide],
  [मानक सुलेख एवं टंकण नियम के अनुसार शिरोरेखा सदैव वर्ण के समस्त अवयवों (खड़ी पाई, वक्र, गांठे) के पूर्ण होने के उपरांत ही सबसे अंत में बाएं से दाएं खींची जाती है। पहले अक्षर-कलेवर निर्मित होता है, तदुपरांत रेखा। #en-line[Official calligraphic directives mandate that the shirorekha is strictly the final stroke executed. The core anatomy of the character is formed first; the overhead bar is pulled smoothly left-to-right across the top.]]
)

#v(4pt)
#rule-box(
  [३. शब्द-विभाजन एवं रिक्त-स्थान अनुशासन (वर्तनी नियम)],
  [Inter-Word Spacing & Lexical Boundaries Directive],
  [दो पृथक शब्दों के मध्य शिरोरेखा कभी भी निरंतर नहीं रह सकती। शब्द समाप्त होते ही शिरोरेखा को पूर्ण विराम दिया जाता है और मानक शब्द-दूरी (Word Space) के पश्चात ही अगले शब्द की नई शिरोरेखा प्रारंभ होती है। #en-line[The headline must never span across two independent words. Upon word completion, the bar terminates cleanly, followed by standard whitespace before the next word's headline initiates.]]
)

#pagebreak()

// --- PAGE 11: अनुभाग १.३ : शिरोरेखा विच्छेद, अपवाद एवं अभ्यास (भाग २) ---
#spread-header(
  [२], [शिरोरेखा-विच्छेद : खुले शीर्ष वाले विशिष्ट वर्ण],
  [2], [Open-Loop Characters with Broken Shirorekha]
)

केंद्रीय हिंदी निदेशालय के मानकीकरण नियमों के अनुसार कुछ वर्णों के शीर्ष पर घुंडी, गांठ अथवा वृत्ताकार लूप (Open Loop) होने के कारण उन पर अखंड शिरोरेखा नहीं खींची जाती। अन्य वर्णों (जैसे घ, म, य) से भ्रम निवारण हेतु इन वर्णों के लूप पर विच्छेद अनिवार्य है: #v(2pt)
#text(size: 8.5pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Per Central Hindi Directorate standardization directives, characters featuring an open loop or curl must never receive an unbroken headline. Preserving this gap prevents critical orthographic confusion with glyphs like घ, म, and य.]

#v(2pt)
#table(
  columns: (70pt, 120pt, 1fr),
  inset: (x: 5pt, y: 3.2pt),
  align: (center + horizon, left + horizon, left + horizon),
  [*वर्ण समूह* \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[Character]], [*शीर्ष संरचनात्मक लक्षण* \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[Top Structure]], [*मानक विच्छेद नियम एवं शुद्धि-कारण* \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[Shirorekha Rule & Official Rationale]],
  [#strong[ध, भ] \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[dha, bha]], [अग्रिम गांठ एवं ऊर्ध्व वृत्त।], [गांठ खुली रहती है; रेखा केवल पाई पर। पूर्ण रेखा से 'घ' व 'म' का भ्रम। \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[Loops open; bar on stem only. Full bar causes confusion with घ and म.]],
  [#strong[थ] \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[tha]], [कुंडलीदार वामावर्त सिरा।], [कुंडली पर रेखा नहीं; पाई पर संधान। पूर्ण रेखा से 'य' व 'प' का भ्रम। \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[No bar over curl. Prevents confusion with य and प.]],
  [#strong[झ, श्र] \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[jha, shra]], [द्वि-खंडीय एवं गांठदार शीर्ष।], [गांठ के ऊपर रेखा टूटी रहती है; मानक मुद्रण में विच्छेद संरक्षित। \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[Headline gap strictly preserved over top loop/knot in standard print.]]
)

#topic-heading(
  [३], [शिरोरेखा सहित एवं शिरोरेखा रहित लिपियों की तुलना],
  [3], [Comparative Study: Headlined vs Non-Headlined Scripts]
)
#v(2pt)

#table(
  columns: (110pt, 1fr, 1fr),
  inset: (x: 5pt, y: 3.2pt),
  align: (left + horizon, left + horizon, left + horizon),
  [*तुलनात्मक बिंदु* \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[Comparative Aspect]], [*देवनागरी (शिरोरेखा युक्त)* \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[Devanagari (Headlined)]], [*गुजराती / लैटिन (शिरोरेखा रहित)* \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[Gujarati / Latin (Headline-Free)]],
  [#strong[दृश्य संरेखण एवं गति] \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[Visual Alignment & Flow]], [शीर्ष रेखा त्वरित क्षैतिज दृष्टि-प्रवाह देती है। \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[Continuous top edge accelerates reading speed.]], [अक्षरों की भिन्न ऊंचाइयों से गति तय होती है। \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[Speed guided by ascenders and descenders.]],
  [#strong[शब्द-सीमा निर्धारण] \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[Boundary Demarcation]], [शिरोरेखा का विच्छेद तुरंत शब्द-समाप्ति दर्शाता है। \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[Headline gap immediately signals word boundary.]], [शब्द-सीमा केवल अंतः-शब्द दूरी (Space) पर निर्भर। \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[Word boundaries rely solely on whitespace.]],
  [#strong[हस्तलेखन गति] \ #text(size: 6.8pt, fill: rgb("#1a1a1a"))[Handwriting Speed]], [प्रत्येक शब्द के अंत में अतिरिक्त स्ट्रोक अनिवार्य। \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[Requires a conscious terminal stroke per word.]], [शीर्ष रेखा न होने से त्वरित घसीट लेखन संभव। \ #text(size: 6.5pt, fill: rgb("#1a1a1a"))[Faster cursive writing without top bar.]]
)

#v(4pt)

#exercise-box(
  [अनुभाग १.३ स्व-मूल्यांकन अभ्यास],
  [Section 1.3 Shirorekha & Orthography Review Worksheet],
  [
    #strong[१. केंद्रीय हिंदी निदेशालय के अनुसार किस वर्ण के शीर्ष पर शिरोरेखा का विच्छेद (खुली गांठ) अनिवार्य है?] #h(8pt) #text(size: 8.5pt, fill: rgb("#000000"))[(अ) क #h(8pt) (ब) ध #h(8pt) (स) ग] \
    #text(size: 7.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Q1. Per Central Hindi Directorate directives, which character requires an open broken headline? (a) ka (b) dha (c) ga] \
    #v(2pt)
    #strong[२. 'भ' और 'थ' वर्णों के ऊपर पूरी शिरोरेखा खींच देने से क्रमशः किन वर्णों का भ्रम उत्पन्न होता है?] ..................................................... \
    #text(size: 7.2pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Q2. Drawing a full solid shirorekha over 'भ' and 'थ' causes visual confusion with which respective letters? ........................]
  ]
)
