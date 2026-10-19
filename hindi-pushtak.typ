// Hindi Pushtak (हिन्दी पुस्तक) — Master Typst Document
// Configured for authentic A4 book geometry, bilingual Devanagari typography, and strict monochrome palette.

#set page(
  paper: "a4",
  margin: (top: 22mm, bottom: 22mm, left: 20mm, right: 20mm),
  header: context {
    let page-num = counter(page).get().first()
    if page-num == 1 { return none }
    let left-title = if page-num == 2 {
      [पुस्तक परिचय]
    } else if page-num >= 3 and page-num <= 4 {
      [विषय-सूची : ३० खंड]
    } else if page-num == 5 {
      [खंड १ : अनुभाग सूची]
    } else if page-num == 6 {
      [अनुभाग १.१ : लिपि का स्वरूप]
    } else if page-num == 7 {
      [अनुभाग १.१ : लिपि-विकास एवं अभ्यास]
    } else if page-num == 8 {
      [अनुभाग १.२ : सुलेख एवं स्ट्रोक क्रम]
    } else {
      [हिन्दी पुस्तक]
    }
    let right-title = if page-num == 2 {
      [About the Book]
    } else if page-num >= 3 and page-num <= 4 {
      [Table of Contents : 30 Parts]
    } else if page-num == 5 {
      [Part 1 : Section Directory]
    } else if page-num == 6 {
      [Section 1.1 : Script Architecture]
    } else if page-num == 7 {
      [Section 1.1 : Evolution & Review Drills]
    } else if page-num == 8 {
      [Section 1.2 : Calligraphy & Stroke Rules]
    } else {
      [Hindi Pushtak]
    }
    grid(
      columns: (1fr, 1fr),
      align: (left, right),
      text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 9.5pt, fill: rgb("#666666"))[#left-title],
      text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 9.5pt, fill: rgb("#666666"))[#right-title]
    )
    line(length: 100%, stroke: 0.5pt + rgb("#cccccc"))
  },
  footer: context {
    let page-num = counter(page).get().first()
    if page-num == 1 { return none }
    line(length: 100%, stroke: 0.5pt + rgb("#cccccc"))
    v(3pt)
    align(right, text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 11pt, fill: rgb("#111111"))[#page-num])
  }
)

#set text(
  font: ("Noto Serif Devanagari", "Noto Sans Devanagari", "DejaVu Serif"),
  size: 12pt,
  lang: "hi"
)

#set par(justify: true, leading: 0.75em, first-line-indent: 0pt)

// Utility styles for interlinear English annotations
#let en-sub(it) = text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 10pt, fill: rgb("#666666"))[#it]
#let en-line(it) = block(spacing: 5pt, text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 10pt, fill: rgb("#666666"))[#it])
#let en-para(it) = block(above: 12pt, below: 12pt, text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 10.2pt, fill: rgb("#555555"))[#h(16pt)#it])

// Standardized Core Components
#let rule-box(title-hi, title-en, body) = block(
  width: 100%,
  stroke: (left: 3pt + rgb("#111111")),
  inset: (x: 10pt, top: 6pt, bottom: 6pt),
  fill: rgb("#fafafa"),
  spacing: 7pt
)[
  #strong[#title-hi] \
  #text(size: 8.5pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[#title-en] \
  #v(1pt)
  #body
]

#let exercise-box(title-hi, title-en, body) = block(
  width: 100%,
  stroke: 0.6pt + rgb("#bbbbbb"),
  inset: (x: 10pt, top: 8pt, bottom: 8pt),
  fill: rgb("#fcfcfc"),
  spacing: 8pt
)[
  #strong[#title-hi] #h(6pt) #text(size: 8.5pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[#title-en]
  #v(4pt)
  #line(length: 100%, stroke: 0.4pt + rgb("#dddddd"))
  #v(4pt)
  #body
]

#let kbd(key) = box(stroke: 0.6pt + rgb("#888888"), radius: 2.5pt, inset: (x: 4pt, y: 1.5pt), fill: rgb("#f4f4f4"))[
  #text(size: 7.5pt, font: "DejaVu Sans Mono", weight: "bold")[#key]
]

// --- PAGE 1: COVER ---
#align(right + top)[
  #v(80pt)
  #text(size: 30pt, fill: rgb("#111111"))[❖]
  #v(14pt)
  #text(size: 34pt, weight: "bold", fill: rgb("#111111"))[हिन्दी पुस्तक]
  #v(18pt)
  #text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 13pt, fill: rgb("#555555"))[Hindi Pushtak]
]

#pagebreak()

// --- PAGE 2: पुस्तक परिचय ---
#v(2pt)
#text(size: 16pt, weight: "bold")[पुस्तक परिचय] #text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 10pt, fill: rgb("#666666"))[About the Book]
#v(6pt)

#par(leading: 0.65em)[
  #text(size: 10.8pt)[
    #h(14pt)हिन्दी पुस्तक भाषा के सर्वांगीण, वैज्ञानिक एवं सोपानवत अध्ययन हेतु प्रस्तुत एक प्रामाणिक संदर्भ ग्रंथ है। इस ग्रंथ की मूल संकल्पना देवनागरी लिपि के आंतरिक सौंदर्य, सुदृढ़ ध्वनिविज्ञान, समृद्ध शब्द-भंडार तथा व्यावहारिक व्याकरणिक संरचना को स्वाभाविक और तर्कसंगत रूप से सुगम बनाने पर आधारित है। आधुनिक युग में भाषा-अधिगम केवल नियमों को कंठस्थ करने तक सीमित नहीं रह सकता; अतः यह पुस्तक शिक्षार्थी को लिपि-विज्ञान के मूलाधारों से जोड़ते हुए अक्षरों के सटीक आलेखन, शिरोरेखा के संतुलन, उच्चारण-स्थानों की सूक्ष्म भिन्नताओं तथा मानक वर्तनी के अनिवार्य नियमों से परिचित कराती है। शिक्षार्थियों के भीतर भाषा के प्रति स्वाभाविक रुचि और विश्लेषणात्मक समझ विकसित करना ही इस ग्रंथ का मुख्य प्रयोजन है।
  ]
]

#v(3pt)

#par(leading: 0.60em)[
  #text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 9.0pt, fill: rgb("#555555"))[
    #h(14pt)Hindi Pushtak is an authoritative reference work designed for the comprehensive, scientific, and graded study of the Hindi language. The foundational concept makes the intrinsic aesthetic beauty, rigorous phonetics, rich vocabulary, and practical grammatical architecture of the Devanagari script accessible in a natural and rational manner. Moving beyond mechanical rote memorization, it connects learners directly with the core foundations of script science, acquainting them with the precise stroke formation of characters, horizontal balance of the headline, subtle distinctions of articulation points, and essential conventions of standard orthography. Cultivating a genuine affinity and analytical understanding of the language remains the principal objective of this endeavour.
  ]
]

#v(6pt)

#par(leading: 0.65em)[
  #text(size: 10.8pt)[
    #h(14pt)इस ग्रंथ की अध्ययन पद्धति पूर्णतः क्रमिक, द्विभाषिक एवं व्यावहारिक अनुप्रयोगात्मक उपागम पर अवलंबित है, जिसमें आधारभूत वर्णमाला परिचय एवं सुलेख-अभ्यास से लेकर दैनंदिन जीवन के जीवंत संवादों, साहित्यिक गद्य-पाठों, मानक इनस्क्रिप्ट टंकण तथा उच्चस्तरीय प्रशासनिक व विधिक भाषा-प्रयोग तक की यात्रा निर्बाध रूप से संपन्न होती है। प्रत्येक व्याकरणिक एवं व्यावहारिक संकल्पना के साथ स्पष्ट द्विभाषिक विवेचन, प्रामाणिक उदाहरण और व्यावहारिक संदर्भ प्रस्तुत किए गए हैं, ताकि स्वयं अध्ययन करने वाले अध्येता तथा कक्षा-कक्ष के विद्यार्थी दोनों ही समान सहजता से भाषा के मर्म को आत्मसात कर सकें और शुद्ध अभिव्यक्ति का आत्मविश्वास अर्जित कर सकें।
  ]
]

#v(3pt)

#par(leading: 0.60em)[
  #text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 9.0pt, fill: rgb("#555555"))[
    #h(14pt)The pedagogical methodology of this text is rooted in a systematic, bilingual, and functional communicative approach, charting a seamless progression from fundamental alphabet anatomy and calligraphy drills to vibrant daily dialogues, graded prose narratives, standard InScript keyboard typing, and advanced official drafting. Every pedagogical concept is accompanied by explicit bilingual commentary, authentic illustrative examples, and practical usage contexts, empowering both independent self-taught scholars and classroom students to assimilate the living spirit of the language with confidence and express themselves with precision.
  ]
]

#v(6pt)

#par(leading: 0.65em)[
  #text(size: 10.8pt)[
    #h(14pt)भाषा केवल संप्रेषण का माध्यम नहीं, अपितु संस्कृति, चिंतन और मानवीय संवेदना की संवाहिका भी है। अतः यह ग्रंथ शिक्षार्थियों को व्यावहारिक संवाद-कौशल के साथ-साथ मानक पारिभाषिक शब्दावली, अनुवाद-सिद्धांत तथा समृद्ध साहित्यिक धरोहर से भी जोड़ता है। चाहे कार्यालयीन कार्य-व्यवहार हो, बैंकिंग एवं वाणिज्यिक गतिविधियाँ हों, अथवा सूचना प्रौद्योगिकी के अंतर्गत भारतीय भाषाओं का डिजिटल अनुप्रयोग, यह पुस्तक प्रत्येक क्षेत्र में भाषा की व्यावहारिक सक्षमता प्रदान करने हेतु एक सुदृढ़ सेतु की भूमिका निभाती है।
  ]
]

#v(3pt)

#par(leading: 0.60em)[
  #text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 9.0pt, fill: rgb("#555555"))[
    #h(14pt)Language is not merely a vehicle for communication, but a living conduit of culture, intellect, and human sensibility. Consequently, this work connects learners not only with functional conversational fluency, but equally with standardized technical terminology, translation principles, and rich cultural heritage. Whether navigating official administrative procedures, commercial and banking operations, or the digital landscape of Indian language computing, this text serves as a dependable bridge empowering learners with genuine communicative competence across all spheres.
  ]
]

#pagebreak()
// --- PAGES 3 to 4: विषय-सूची (३० खंड) ---
#set table(
  stroke: (x, y) => if y == 0 { (bottom: 1pt + rgb("#111111"), top: 1pt + rgb("#111111")) } else { (bottom: 0.3pt + rgb("#e5e5e5")) },
  fill: (x, y) => if y == 0 { rgb("#f8f8f8") } else { none },
  inset: (x: 5pt, y: 4.2pt)
)

// --- PAGE 3: विषय-सूची (खंड १ से १५) ---
#v(2pt)
#text(size: 16pt, weight: "bold")[विषय-सूची : भाग १] \
#en-sub[Table of Contents : Parts 1 to 15]
#v(8pt)

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
#v(8pt)

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
#v(0pt)
#text(size: 15pt, weight: "bold")[खंड १ : देवनागरी लिपि-संरचना एवं सुलेख कला] \
#text(size: 9.5pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Part 1 : Devanagari Script Architecture & Calligraphy]
#v(2pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cccccc"))
#v(2pt)
#text(size: 8.8pt)[इस खंड में देवनागरी लिपि के ऐतिहासिक उद्भव, वैज्ञानिक संरचना, अक्षरात्मक व्यवस्था, शिरोरेखा के प्रामाणिक नियम तथा सुलेख कला का सर्वांगीण अध्ययन प्रस्तुत किया गया है।] \
#text(size: 7.8pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[This part presents a comprehensive study of the historical origin of Devanagari script, its scientific architecture, syllabic abugida system, authentic shirorekha rules, and calligraphy.]
#v(2pt)
#text(size: 10pt, weight: "bold")[अनुभाग सूची] #h(6pt) #text(size: 8.5pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Section Directory (20 Sections)]
#v(1pt)
#table(
  columns: (38pt, 1fr),
  inset: (x: 4pt, y: 1.8pt),
  align: (center + horizon, left + horizon),
  [*अनुभाग* \ #text(size: 6.8pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Sec]], [*अनुभाग शीर्षक एवं अध्ययन विषय* \ #text(size: 6.8pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Section Title & Scope]],
  [#text(size: 7.8pt, weight: "bold")[१.१] \
  #text(size: 6.6pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.1]],
  [#text(size: 8.2pt, weight: "bold")[देवनागरी लिपि का ऐतिहासिक उद्भव एवं विकास] \
  #text(size: 7.0pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Historical Origin & Evolution of Devanagari]],
  [#text(size: 7.8pt, weight: "bold")[१.२] \
  #text(size: 6.6pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.2]],
  [#text(size: 8.2pt, weight: "bold")[अक्षरात्मक प्रकृति एवं आबुगिदा व्यवस्था] \
  #text(size: 7.0pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Syllabic Nature & Abugida Architecture]],
  [#text(size: 7.8pt, weight: "bold")[१.३] \
  #text(size: 6.6pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.3]],
  [#text(size: 8.2pt, weight: "bold")[शिरोरेखा के प्रामाणिक नियम एवं महत्व] \
  #text(size: 7.0pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Shirorekha Rules, Importance & Alignment]],
  [#text(size: 7.8pt, weight: "bold")[१.४] \
  #text(size: 6.6pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.4]],
  [#text(size: 8.2pt, weight: "bold")[खड़ी पाई वाले वर्णों की मानक संरचना] \
  #text(size: 7.0pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Characters with Vertical Stem (Khadi Pai)]],
  [#text(size: 7.8pt, weight: "bold")[१.५] \
  #text(size: 6.6pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.5]],
  [#text(size: 8.2pt, weight: "bold")[बिना पाई एवं गोलाकार वर्णों की संरचना] \
  #text(size: 7.0pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Non-Stemmed & Circular Character Anatomy]],
  [#text(size: 7.8pt, weight: "bold")[१.६] \
  #text(size: 6.6pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.6]],
  [#text(size: 8.2pt, weight: "bold")[सुलेख स्ट्रोक क्रम एवं कलम संचालन] \
  #text(size: 7.0pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Calligraphic Stroke Order & Pen Flow]],
  [#text(size: 7.8pt, weight: "bold")[१.७] \
  #text(size: 6.6pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.7]],
  [#text(size: 8.2pt, weight: "bold")[अक्षरों का अनुपातिक एवं ज्यामितीय संतुलन] \
  #text(size: 7.0pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Geometric Balance & Proportional Spacing]],
  [#text(size: 7.8pt, weight: "bold")[१.८] \
  #text(size: 6.6pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.8]],
  [#text(size: 8.2pt, weight: "bold")[ध, भ, थ, झ, श्र में शिरोरेखा विच्छेद] \
  #text(size: 7.0pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Shirorekha Breaks in Broken-Loop Letters]],
  [#text(size: 7.8pt, weight: "bold")[१.९] \
  #text(size: 6.6pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.9]],
  [#text(size: 8.2pt, weight: "bold")[र वर्ण के विविध सुलेख रूप (रेफ़ व पदेन)] \
  #text(size: 7.0pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Allographs of Ra (Reph & Paden)]],
  [#text(size: 7.8pt, weight: "bold")[१.१०] \
  #text(size: 6.6pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.10]],
  [#text(size: 8.2pt, weight: "bold")[ह्रस्व व दीर्घ मात्राओं का आलेखन] \
  #text(size: 7.0pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Placement Geometry of Short & Long Matras]],
  [#text(size: 7.8pt, weight: "bold")[१.११] \
  #text(size: 6.6pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.11]],
  [#text(size: 8.2pt, weight: "bold")[ऊर्ध्व मात्राओं (े, ै, ो, औ) का संयोजन] \
  #text(size: 7.0pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Top Diacritic Connections & Angles]],
  [#text(size: 7.8pt, weight: "bold")[१.१२] \
  #text(size: 6.6pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.12]],
  [#text(size: 8.2pt, weight: "bold")[अधो मात्राओं (ु, ू, ृ) का सुलेखन] \
  #text(size: 7.0pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Bottom Diacritics (u, uu, ri) Placement]],
  [#text(size: 7.8pt, weight: "bold")[१.१३] \
  #text(size: 6.6pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.13]],
  [#text(size: 8.2pt, weight: "bold")[हस्तलेख सुधार प्रविधियाँ एवं अभ्यास] \
  #text(size: 7.0pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Handwriting Drills & Stroke Consistency]],
  [#text(size: 7.8pt, weight: "bold")[१.१४] \
  #text(size: 6.6pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.14]],
  [#text(size: 8.2pt, weight: "bold")[देवनागरी अंक संरचना (० से ९) एवं स्ट्रोक] \
  #text(size: 7.0pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Devanagari Numerals (0-9) Stroke Sequence]],
  [#text(size: 7.8pt, weight: "bold")[१.१५] \
  #text(size: 6.6pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.15]],
  [#text(size: 8.2pt, weight: "bold")[मानक लिपि संकेत एवं विराम चिह्नों का अंकन] \
  #text(size: 7.0pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Punctuation Marks & Orthographic Signs]],
  [#text(size: 7.8pt, weight: "bold")[१.१६] \
  #text(size: 6.6pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.16]],
  [#text(size: 8.2pt, weight: "bold")[केंद्रीय हिंदी निदेशालय के मानकीकृत वर्ण] \
  #text(size: 7.0pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[CHD Standardized Character Variants]],
  [#text(size: 7.8pt, weight: "bold")[१.१७] \
  #text(size: 6.6pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.17]],
  [#text(size: 8.2pt, weight: "bold")[भ्रामक वर्ण-युग्मों में दृश्य अंतर (ख/रव, घ/ध)] \
  #text(size: 7.0pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Visually Similar Letters & Distinctions]],
  [#text(size: 7.8pt, weight: "bold")[१.१८] \
  #text(size: 6.6pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.18]],
  [#text(size: 8.2pt, weight: "bold")[कैलीग्राफी निब एवं स्याही तकनीक] \
  #text(size: 7.0pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Calligraphy Nibs, Ink Flow & Paper Angle]],
  [#text(size: 7.8pt, weight: "bold")[१.१९] \
  #text(size: 6.6pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.19]],
  [#text(size: 8.2pt, weight: "bold")[द्रुत लिपि एवं त्वरित हस्तलेखन अभ्यास] \
  #text(size: 7.0pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Cursive Speed Writing & Legibility]],
  [#text(size: 7.8pt, weight: "bold")[१.२०] \
  #text(size: 6.6pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.20]],
  [#text(size: 8.2pt, weight: "bold")[वर्ण सुलेख स्व-मूल्यांकन एवं परिशोधन] \
  #text(size: 7.0pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Lettering Self-Evaluation & Correction]],
)

#pagebreak()
// --- PAGE 6: अनुभाग १.१ : लिपि का उद्भव एवं स्वरूप ---
#v(2pt)
#text(size: 16pt, weight: "bold")[अनुभाग १.१ : देवनागरी लिपि का उद्भव एवं स्वरूप] \
#text(size: 9.8pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Section 1.1 : Origin & Structural Architecture of Devanagari Script]
#v(4pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cccccc"))
#v(6pt)

देवनागरी विश्व की सर्वाधिक वैज्ञानिक, व्यवस्थित एवं ध्वन्यात्मक लिपियों में से एक है। इसका विकास प्राचीन ब्राह्मी लिपि की उत्तरी धारा से हुआ है। यह लिपि बाएँ से दाएँ लिखी जाती है तथा इसकी सबसे बड़ी विशेषता यह है कि प्रत्येक वर्ण का उच्चारण उसके लिखित रूप के सर्वथा अनुरूप होता है।
#block(above: 3pt, below: 8pt)[
  #text(size: 9.5pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Devanagari is one of the most scientific, systematic, and phonetic scripts in the world, having evolved from the northern branch of ancient Brahmi. Written from left to right, its defining hallmark is absolute phonetic correspondence—every character is pronounced exactly as it is written.]
]

#v(2pt)
#text(size: 12.5pt, weight: "bold")[१. लिपि की आधारभूत विशेषताएँ] \
#text(size: 8.8pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1. Fundamental Characteristics of the Script Architecture]
#v(5pt)

#rect(width: 100%, stroke: (left: 3pt + rgb("#111111")), inset: (left: 8pt, y: 5pt), fill: rgb("#fafafa"))[
  #strong[१. अक्षरात्मक प्रकृति]   #en-sub[1. Syllabic Nature / Abugida Architecture]   #v(1pt)
  देवनागरी विशुद्ध वर्णात्मक नहीं अपितु अक्षरात्मक है। प्रत्येक व्यंजन वर्ण में अंतर्निहित 'अ' स्वर स्वाभाविक रूप से सम्मिलित रहता है (जैसे: क् + अ = क)। स्वर के अभाव को दर्शाने हेतु हलंत चिह्न (्) का प्रयोग किया जाता है।   #en-line[Devanagari is an abugida rather than a pure alphabet. Every consonant possesses an inherent schwa vowel 'a' (e.g. k + a = ka). The virama / halant sign is employed when a consonant is devoid of its inherent vowel.]
]

#v(5pt)

#rect(width: 100%, stroke: (left: 3pt + rgb("#111111")), inset: (left: 8pt, y: 5pt), fill: rgb("#fafafa"))[
  #strong[२. शिरोरेखा का संरचनात्मक महत्व]   #en-sub[2. Structural Equilibrium of the Shirorekha]   #v(1pt)
  अक्षरों के ऊपर खींची जाने वाली क्षैतिज रेखा 'शिरोरेखा' कहलाती है। यह शब्दों को एक सुदृढ़ दृश्य सूत्र में बाँधती है, पृष्ठ पर पाठ को अनुशासित संरेखण प्रदान करती है तथा लिपि को विशिष्ट कलात्मक पहचान देती है।   #en-line[The continuous horizontal top line is termed Shirorekha. It unifies individual letter forms into cohesive word units, provides disciplined optical alignment across the page, and confers distinctive typographic identity.]
]

#v(5pt)

#rect(width: 100%, stroke: (left: 3pt + rgb("#111111")), inset: (left: 8pt, y: 5pt), fill: rgb("#fafafa"))[
  #strong[३. ज्यामितीय एवं रूपात्मक संतुलन]   #en-sub[3. Geometric Harmony and Proportional Spacing]   #v(1pt)
  देवनागरी वर्णमाला ऊर्ध्व रेखाओं (खड़ी पाई), वृत्तों, अर्धवृत्तों तथा पाशों के अनुपातिक समन्वय पर आधारित है। लंबवत खड़ी पाई सदैव ९० अंश पर लंबवत होनी चाहिए ताकि अक्षरों में स्वाभाविक संतुलन बना रहे।   #en-line[The Devanagari graphic repertoire is harmoniously constructed from vertical standing stems (Khadi Pai), circular nodes, semicircles, and loops. Vertical stems are strictly perpendicular at 90 degrees for visual equilibrium.]
]
#pagebreak()

// --- PAGE 7: अनुभाग १.१ : लिपि-विकास, पारिभाषिक शब्दावली एवं अभ्यास ---
#v(2pt)
#text(size: 14pt, weight: "bold")[२. लिपि-उद्भव एवं विकास परंपरा] #text(size: 8.8pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[2. Historical Origin & Evolution Lineage]
#v(4pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cccccc"))
#v(5pt)

भारतीय लिपियों की जननी प्राचीन 'ब्राह्मी लिपि' (ईसा पूर्व तीसरी सदी) मानी जाती है। ब्राह्मी से गुप्त लिपि, तत्पश्चात कुटिल (सिद्धमातृका) लिपि और उससे १०वीं-११वीं शताब्दी में नागरी (देवनागरी) लिपि का प्रादुर्भाव हुआ: #v(2pt)
#text(size: 8.5pt, fill: rgb("#555555"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Ancient Brahmi (3rd century BCE) is the mother of Indian scripts. From Brahmi evolved the Gupta script, followed by Kutila (Siddhamatrika), eventually culminating in Devanagari around the 10th-11th century CE.]

#v(2pt)
#table(
  columns: (70pt, 120pt, 1fr),
  inset: (x: 5pt, y: 4.8pt),
  align: (center + horizon, left + horizon, left + horizon),
  [*काल / युग* \ #text(size: 6.8pt, fill: rgb("#666666"))[Period / Epoch]], [*लिपि अवस्था* \ #text(size: 6.8pt, fill: rgb("#666666"))[Script Stage]], [*विशिष्ट लक्षण* \ #text(size: 6.8pt, fill: rgb("#666666"))[Defining Characteristics]],
  [#strong[ई.पू. ३री सदी] \ #text(size: 6.8pt)[3rd C. BCE]], [#strong[अशोककालीन ब्राह्मी] \ #text(size: 6.8pt)[Ashokan Brahmi]], [सरल ज्यामितीय रेखाएँ, शिरोरेखा का पूर्ण अभाव। \ #text(size: 6.5pt, fill: rgb("#666666"))[Simple geometric angles; no horizontal headline.]],
  [#strong[४थी-५वीं सदी] \ #text(size: 6.8pt)[4th-5th C. CE]], [#strong[गुप्त लिपि] \ #text(size: 6.8pt)[Gupta Script]], [अक्षरों के शीर्ष पर ठोस त्रिकोण / चौरस सिरा निर्माण। \ #text(size: 6.5pt, fill: rgb("#666666"))[Solid triangular top headmarks on letter stems.]],
  [#strong[६ठी-९वीं सदी] \ #text(size: 6.8pt)[6th-9th C. CE]], [#strong[कुटिल / सिद्धमातृका] \ #text(size: 6.8pt)[Kutila / Siddhamatrika]], [शीर्ष पर क्षैतिज रेखा का विस्तार, वक्राकार अक्षरांग। \ #text(size: 6.5pt, fill: rgb("#666666"))[Horizontal line extension; bent, curved letter forms.]],
  [#strong[१०वीं सदी-] \ #text(size: 6.8pt)[10th C. CE+]], [#strong[प्राचीन देवनागरी] \ #text(size: 6.8pt)[Early Devanagari]], [सतत शिरोरेखा, खड़ी पाई तथा वर्तमान वर्ण-रूपों का परिपाक। \ #text(size: 6.5pt, fill: rgb("#666666"))[Continuous shirorekha, vertical stems, modern letters.]]
)

#v(6pt)
#text(size: 13pt, weight: "bold")[३. प्रमुख पारिभाषिक शब्दावली] #text(size: 8.5pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[3. Core Technical Terms & Orthographic Concepts]
#v(3pt)

#table(
  columns: (80pt, 85pt, 1fr),
  inset: (x: 5pt, y: 4.5pt),
  align: (center + horizon, left + horizon, left + horizon),
  [*पारिभाषिक पद* \ #text(size: 6.8pt, fill: rgb("#666666"))[Hindi Term]], [*रोमन उच्चारण* \ #text(size: 6.8pt, fill: rgb("#666666"))[Transliteration]], [*विस्तृत अर्थ एवं संकल्पना* \ #text(size: 6.8pt, fill: rgb("#666666"))[Meaning & Contextual Explanation]],
  [#strong[शिरोरेखा]], [Shirorekha], [वर्णों के शीर्ष पर खींची जाने वाली क्षैतिज रेखा। \ #text(size: 6.5pt, fill: rgb("#666666"))[Continuous horizontal headline drawn over characters.]],
  [#strong[खड़ी पाई]], [Khadi Pai], [वर्णों की मुख्य लंबवत सीधी रेखा (उदा. क, ग, त)। \ #text(size: 6.5pt, fill: rgb("#666666"))[Primary vertical standing stem at 90 degrees.]],
  [#strong[हलंत (्)]], [Halant / Virama], [व्यंजन से अंतर्निहित 'अ' स्वर हटाने वाला अधो-चिह्न। \ #text(size: 6.5pt, fill: rgb("#666666"))[Diacritic muting the inherent vowel to form pure consonant.]]
)

#v(6pt)

#exercise-box(
  [अनुभाग १.१ स्व-मूल्यांकन अभ्यास],
  [Section 1.1 Comprehension & Review Worksheet],
  [
    #strong[१. देवनागरी लिपि किस प्राचीन लिपि की वंशज है?] #h(10pt) #text(size: 8.5pt, fill: rgb("#444444"))[(अ) खरोष्ठी #h(8pt) (ब) ब्राह्मी #h(8pt) (स) ग्रीक]     #v(1pt)
    #text(size: 7.5pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Q1. Which ancient script is Devanagari directly descended from? (a) Kharosthi (b) Brahmi (c) Greek]     #v(5pt)
    #strong[२. 'आबुगिदा' लिपि व्यवस्था में प्रत्येक व्यंजन वर्ण में कौन सा स्वर अंतर्निहित रहता है?] ........................     #v(1pt)
    #text(size: 7.5pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Q2. In an abugida script architecture, which inherent vowel is naturally contained in every consonant? ....................]
  ]
)

#pagebreak()

// --- PAGE 9: अनुभाग १.२ : सुलेख एवं स्ट्रोक क्रम ---
#v(4pt)
#text(size: 14pt, weight: "bold")[अनुभाग १.२ : सुलेख एवं स्ट्रोक क्रम के प्रामाणिक नियम] \
#en-sub[Section 1.2: Authentic Calligraphy Rules & Stroke Order Sequence]
#v(6pt)

देवनागरी लिपि में सुंदर, संतुलित एवं सुपाठ्य हस्तलेखन हेतु स्ट्रोक का क्रम निश्चित एवं वैज्ञानिक है:
#en-line[For elegant, balanced, and legible handwriting in Devanagari, the sequence of strokes is fixed and systematic:]

#v(4pt)
#strong[१. प्रथम चरण : वाम वक्र रचना] \
#en-sub[Step 1 : Left Curve Construction] \
#v(1pt)
बाएँ भाग की वक्र रेखा या अर्धवृत्त की रचना की जाती है। \
#en-line[Draw the curved stroke or semicircle on the left-hand section.]

#v(4pt)
#strong[२. द्वितीय चरण : मध्य योजक रेखा] \
#en-sub[Step 2 : Central Connector] \
#v(1pt)
मध्य की छोटी क्षैतिज योजक रेखा, यदि वर्ण में उपस्थित हो, खींची जाती है। \
#en-line[Draw the central horizontal connecting stroke if present in the character structure.]

#v(4pt)
#strong[३. तृतीय चरण : खड़ी पाई] \
#en-sub[Step 3 : Vertical Standing Line] \
#v(1pt)
लंबवत ऊर्ध्व रेखा खड़ी पाई ऊपर से नीचे की ओर खींची जाती है। \
#en-line[Draw the primary vertical standing stroke Khadi Pai smoothly from top to bottom.]

#v(4pt)
#strong[४. अंतिम चरण : शिरोरेखा] \
#en-sub[Step 4 : Top Horizontal Line] \
#v(1pt)
वर्ण के पूर्ण होने के उपरांत ऊपर की शिरोरेखा को बाएँ से दाएँ खींचा जाता है। \
#en-line[Finally, draw the top horizontal line Shirorekha from left to right; the Shirorekha is always drawn last.]

#v(6pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cccccc"))
#v(5pt)

#text(size: 13pt, weight: "bold")[विशेष सुलेखीय नियम] \
#en-sub[Special Calligraphic Rules]
#v(4pt)

#rect(width: 100%, stroke: (left: 3pt + rgb("#111111")), inset: (left: 8pt, y: 5pt), fill: rgb("#fafafa"))[
  #strong[अपूर्ण शिरोरेखा वाले वर्ण] \
  #en-sub[Broken Top Line Characters] \
  #v(1pt)
  देवनागरी में ध, भ, थ, झ, तथा श्र जैसे वर्णों में शिरोरेखा पूरे वर्ण पर नहीं खींची जाती, अपितु बाएँ वृत्त अथवा पाश को खुला छोड़कर केवल दाहिनी खड़ी पाई पर खींची जाती है। \
  #en-line[In characters with open upper loops such as dha, bha, tha, jha, shra, the Shirorekha is not drawn completely across the character. The loop remains open and the horizontal stroke touches only the right vertical stem.]
]

#v(5pt)

#rect(width: 100%, stroke: (left: 3pt + rgb("#111111")), inset: (left: 8pt, y: 5pt), fill: rgb("#fafafa"))[
  #strong[समानुपातिक सौंदर्य] \
  #en-sub[Proportional Harmony] \
  #v(1pt)
  प्रत्येक वर्ण की चौड़ाई और ऊँचाई का अनुपात संतुलित होना चाहिए तथा खड़ी पाई सदैव ९० अंश पर लंबवत होनी चाहिए। \
  #en-line[The width and height ratio of each character must remain balanced, with the vertical stem aligned strictly at 90 degrees.]
]
