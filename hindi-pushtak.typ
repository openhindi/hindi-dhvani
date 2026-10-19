// Hindi Pushtak (हिन्दी पुस्तक) — Master Typst Document
// Configured for authentic A4 book geometry, bilingual Devanagari typography, and strict monochrome palette.

#set page(
  paper: "a4",
  margin: (top: 18mm, bottom: 16mm, left: 20mm, right: 20mm),
  header: context {
    let page-num = counter(page).get().first()
    if page-num == 1 { return none }
    let left-title = if page-num == 2 {
      [पुस्तक परिचय (About the Book)]
    } else if page-num == 3 {
      [विषय-सूची (Table of Contents)]
    } else if page-num == 4 {
      [अनुभाग १.१ (Section 1.1)]
    } else if page-num == 5 {
      [अनुभाग १.२ (Section 1.2)]
    } else {
      [हिन्दी पुस्तक]
    }
    let right-title = if page-num == 2 {
      [दृष्टिकोण (Approach)]
    } else if page-num == 3 {
      [पाठ्यक्रम (Syllabus)]
    } else if page-num >= 4 {
      [खंड १ : देवनागरी लिपि]
    } else {
      [Hindi Pushtak]
    }
    [
      #grid(
        columns: (1fr, 1fr),
        align: (left, right),
        text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 8.5pt, fill: rgb("#666666"))[#left-title],
        text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 8.5pt, fill: rgb("#666666"))[#right-title]
      )
      #line(length: 100%, stroke: 0.5pt + rgb("#cccccc"))
    ]
  },
  footer: context {
    let page-num = counter(page).get().first()
    if page-num == 1 { return none }
    [
      #line(length: 100%, stroke: 0.5pt + rgb("#cccccc"))
      #v(3pt)
      #align(right, text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 9pt, fill: rgb("#111111"))[#page-num])
    ]
  }
)

#set text(
  font: ("Noto Serif Devanagari", "Noto Sans Devanagari", "DejaVu Serif"),
  size: 10pt,
  lang: "hi"
)

#set par(justify: true, leading: 0.75em, first-line-indent: 14pt)

// Utility styles for interlinear English annotations
#let en-sub(it) = text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 8pt, fill: rgb("#666666"))[#it]
#let en-line(it) = block(spacing: 4pt, text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 8pt, fill: rgb("#666666"))[#it])
#let en-para(it) = block(spacing: 6pt, text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 8.2pt, fill: rgb("#555555"))[#it])

// --- PAGE 1: COVER ---
#align(right + top)[
  #v(80pt)
  #text(size: 28pt, fill: rgb("#111111"))[❖]
  #v(14pt)
  #text(size: 32pt, weight: "bold", fill: rgb("#111111"))[हिन्दी पुस्तक]
  #v(6pt)
  #text(size: 15pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Hindi Pushtak]
]

#pagebreak()

// --- PAGE 2: पुस्तक परिचय ---
#v(10pt)
#text(size: 16pt, weight: "bold")[पुस्तक परिचय] \
#en-sub[About the Book : Approach & Methodology]
#v(14pt)

'हिन्दी पुस्तक' (Hindi Pushtak) हिन्दी भाषा के सर्वांगीण, वैज्ञानिक एवं सोपानवत अध्ययन हेतु प्रस्तुत एक प्रामाणिक ग्रंथ है। इस ग्रंथ की मूल संकल्पना देवनागरी लिपि के आंतरिक सौंदर्य, सुदृढ़ ध्वनिविज्ञान तथा समृद्ध व्याकरणिक संरचना को स्वाभाविक और तर्कसंगत रूप से सुगम बनाने पर आधारित है। आधुनिक युग में भाषा-अधिगम केवल नियमों को कंठस्थ करने तक सीमित नहीं रह सकता; अतः यह पुस्तक विद्यार्थी को लिपि-विज्ञान के मूलाधारों से जोड़ते हुए अक्षरों के सटीक आलेखन, शिरोरेखा के संतुलन, उच्चारण-स्थानों की सूक्ष्म भिन्नताओं तथा मानक वर्तनी के अनिवार्य नियमों से परिचित कराती है। शिक्षार्थियों के भीतर भाषा के प्रति स्वाभाविक रुचि और विश्लेषणात्मक समझ विकसित करना ही इस प्रयास का मुख्य प्रयोजन है।

#en-para['Hindi Pushtak' is an authoritative work presented for the comprehensive, scientific, and graded study of the Hindi language. The foundational concept of this work is based on making the intrinsic aesthetic beauty, rigorous phonetics, and rich grammatical architecture of the Devanagari script accessible in a natural and rational manner. In the contemporary era, language learning cannot remain confined to mechanical rote memorization; hence, this book connects the learner directly with the core foundations of script science, acquainting them with the precise stroke formation of characters, horizontal alignment (Shirorekha), subtle distinctions of articulation points, and essential conventions of standard orthography. Cultivating a genuine affinity and analytical understanding of the language within learners remains the principal objective of this endeavour.]

#v(10pt)
इस ग्रंथ की अध्ययन पद्धति पूर्णतः क्रमिक, द्विभाषिक एवं व्यावहारिक अनुप्रयोगात्मकता पर अवलंबित है, जिसमें आधारभूत स्वर-व्यंजन परिचय से लेकर दैनंदिन जीवन के जीवंत संवादों, साहित्यिक गद्य-पाठों तथा उच्चस्तरीय प्रशासनिक व विधिक भाषा-प्रयोग तक की यात्रा निर्बाध रूप से संपन्न होती है। प्रत्येक व्याकरणिक संकल्पना के साथ स्पष्ट द्विभाषिक विवेचन, प्रामाणिक उदाहरण और व्यावहारिक संदर्भ प्रस्तुत किए गए हैं, ताकि स्वयं अध्ययन करने वाले अध्येता तथा कक्षा-कक्ष के विद्यार्थी दोनों ही समान सहजता से भाषा की आत्मा को आत्मसात कर सकें और शुद्ध अभिव्यक्ति का आत्मविश्वास अर्जित कर सकें।

#en-para[The pedagogy of this text is rooted entirely in a systematic, bilingual, and practical-communicative methodology, charting a seamless progression from fundamental vowels and consonants to vibrant daily dialogues, literary prose narratives, and advanced official and statutory drafting. Every grammatical concept is accompanied by explicit bilingual commentary, authentic illustrative examples, and contextual usage, empowering both independent self-taught scholars and formal classroom students to assimilate the true spirit of the language with confidence and express themselves with precision.]

#pagebreak()

// --- PAGE 3: विषय-सूची ---
#v(6pt)
#text(size: 16pt, weight: "bold")[विषय-सूची] \
#en-sub[Table of Contents]
#v(10pt)

#set table(
  stroke: (x, y) => if y == 0 { (bottom: 1pt + rgb("#111111"), top: 1pt + rgb("#111111")) } else { (bottom: 0.4pt + rgb("#e5e5e5")) },
  fill: (x, y) => if y == 0 { rgb("#f8f8f8") } else { none }
)

#align(center)[
#table(
  columns: (65pt, 170pt, 195pt),
  align: (center + top, left + top, left + top),
  [*खंड (Part)*], [*शीर्षक (Title)*], [*मुख्य विषय (Core Subject)*],
  [#strong[खंड १]\ #en-sub[Part 1]], [#strong[वर्ण-संरचना एवं सुलेख कला]\ #en-sub[Script, Strokes & Calligraphy]], [वर्णमाला, शिरोरेखा, स्वर-व्यंजन, स्ट्रोक क्रम\ #en-sub[Alphabet, top line, vowels, consonants]],
  [#strong[खंड २]\ #en-sub[Part 2]], [#strong[ध्वनि-व्यवस्था एवं उच्चारण]\ #en-sub[Sound System & Pronunciation]], [उच्चारण स्थान, अल्पप्राण-महाप्राण, घोष-अघोष\ #en-sub[Places of articulation, aspiration, voicing]],
  [#strong[खंड ३]\ #en-sub[Part 3]], [#strong[स्वर, मात्राएँ एवं संयुक्ताक्षर]\ #en-sub[Vowels, Diacritics & Conjuncts]], [मात्रा प्रणाली, अनुस्वार-अनुनासिक, संयुक्त वर्ण\ #en-sub[Matra system, nasalisation, conjuncts]],
  [#strong[खंड ४]\ #en-sub[Part 4]], [#strong[संज्ञा, लिंग एवं वचन रूप]\ #en-sub[Nouns, Gender & Number Inflection]], [संज्ञा भेद, पुल्लिंग-स्त्रीलिंग, वचन विकार\ #en-sub[Noun classes, gender, number inflection]],
  [#strong[खंड ५]\ #en-sub[Part 5]], [#strong[कारक एवं विभक्ति-व्यवस्था]\ #en-sub[Postpositions & Case System]], [आठ कारक, परसर्ग (ने, को, से, का, में, पर)\ #en-sub[Eight cases, case markers (ne, ko, se)]],
  [#strong[खंड ६]\ #en-sub[Part 6]], [#strong[सर्वनाम एवं संबंधपरक रूप]\ #en-sub[Pronouns & Demonstratives]], [पुरुषवाचक, निजवाचक, प्रश्नवाचक सर्वनाम\ #en-sub[Personal, reflexive, interrogative pronouns]],
  [#strong[खंड ७]\ #en-sub[Part 7]], [#strong[विशेषण एवं संख्या-पद्धति]\ #en-sub[Adjectives & Numerals]], [गुणवाचक विशेषण, १ से १०० तक गिनती\ #en-sub[Qualitative adjectives, numerals 1 to 100]],
  [#strong[खंड ८]\ #en-sub[Part 8]], [#strong[क्रिया-मूल एवं वर्तमान काल]\ #en-sub[Verb Roots & Present Tenses]], [धातु, 'होना' क्रिया, सामान्य व अपूर्ण वर्तमान\ #en-sub[Verbal roots, copula 'hona', present tenses]],
  [#strong[खंड ९]\ #en-sub[Part 9]], [#strong[भूतकाल, भविष्यत् एवं 'ने' नियम]\ #en-sub[Past, Future & 'Ne' Rule]], [भूतकाल के भेद, सकर्मक क्रिया में 'ने', भविष्यत्\ #en-sub[Past tenses, transitive 'ne' rule, future]],
  [#strong[खंड १०]\ #en-sub[Part 10]], [#strong[संयुक्त एवं प्रेरणार्थक क्रियाएँ]\ #en-sub[Compound Verbs & Causatives]], [रंजक क्रियाएँ (जाना, लेना, देना), प्रेरणार्थक धातु\ #en-sub[Explicators (jana, lena, dena), causatives]],
  [#strong[खंड ११]\ #en-sub[Part 11]], [#strong[कर्मवाच्य एवं मिश्र वाक्य]\ #en-sub[Passive Voice & Complex Syntax]], [कर्तृवाच्य, कर्मवाच्य, संयुक्त व मिश्रित वाक्य\ #en-sub[Active-passive voice, compound syntax]],
  [#strong[खंड १२]\ #en-sub[Part 12]], [#strong[संकेतार्थक एवं विधिक प्रयोग]\ #en-sub[Conditionals & Subjunctive Mood]], [यदि...तो संरचनाएँ, सम्भावना, बाध्यता\ #en-sub[Conditionals, subjunctive & obligative]],
  [#strong[खंड १३]\ #en-sub[Part 13]], [#strong[दैनिक जीवन एवं संवाद]\ #en-sub[Daily Conversations & Situations]], [५० व्यावहारिक प्रसंग: घर, बाजार, यात्रा, स्वास्थ्य\ #en-sub[50 situational dialogues: home, travel]],
  [#strong[खंड १४]\ #en-sub[Part 14]], [#strong[गद्य-पाठमाला एवं आख्यान]\ #en-sub[Graded Prose Readings]], [१७ प्रेरक गद्य पाठ, यात्रा-वृत्तांत, संस्कृति\ #en-sub[17 inspiring prose lessons, culture]],
  [#strong[खंड १५]\ #en-sub[Part 15]], [#strong[मानक वर्तनी एवं टंकण]\ #en-sub[Orthography & InScript Typing]], [मानक वर्तनी नियम, इनस्क्रिप्ट कीबोर्ड अभ्यास\ #en-sub[Standard spelling rules, InScript typing]],
  [#strong[खंड १६]\ #en-sub[Part 16]], [#strong[प्रशासनिक शब्दावली व टिप्पण]\ #en-sub[Official Terminology & Notes]], [कार्यालयीन शब्दावली, नेमी व औपचारिक टिप्पण\ #en-sub[Administrative glossary, routine notes]],
  [#strong[खंड १७]\ #en-sub[Part 17]], [#strong[कार्यालयी पत्राचार एवं आलेखन]\ #en-sub[Official Correspondence]], [सरकारी पत्र, ज्ञापन, आदेश, अधिसूचना\ #en-sub[Official letters, memoranda, notifications]],
  [#strong[खंड १८]\ #en-sub[Part 18]], [#strong[बैंकिंग व वित्तीय कार्य-प्रणाली]\ #en-sub[Banking & Financial Hindi]], [बैंकिंग शब्दावली, खाता, ऋण, चेक, विनिमय\ #en-sub[Banking terminology, accounts, loans]],
  [#strong[खंड १९]\ #en-sub[Part 19]], [#strong[राजभाषा नीति एवं शासन]\ #en-sub[Constitutional Policy]], [संवैधानिक प्रावधान, राजभाषा नियम, अनुवाद\ #en-sub[Constitutional provisions, Official Language]],
  [#strong[खंड २०]\ #en-sub[Part 20]], [#strong[शब्दावली, मुहावरे एवं निर्देशिका]\ #en-sub[Lexicon, Idioms & Index]], [मुहावरे, लोकोक्तियाँ, पारिभाषिक शब्दकोश\ #en-sub[Idioms, proverbs, comprehensive index]]
)
]

#pagebreak()

// --- PAGE 4: खंड १ (Part 1) ---
#v(6pt)
#text(size: 16pt, weight: "bold")[खंड १ : देवनागरी लिपि, वर्ण-संरचना एवं सुलेख कला] \
#en-sub[Part 1: Devanagari Script, Character Anatomy & Calligraphy]
#v(6pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cccccc"))
#v(8pt)

#text(size: 12pt, weight: "bold")[अनुभाग १.१ : देवनागरी लिपि का उद्भव एवं स्वरूप] \
#en-sub[Section 1.1: Origin & Structural Architecture of Devanagari Script]
#v(6pt)

देवनागरी विश्व की सर्वाधिक वैज्ञानिक एवं ध्वन्यात्मक लिपियों में से एक है।
#en-line[Devanagari is one of the most scientific and phonetic scripts in the world.]

यह बाएँ से दाएँ लिखी जाती है। प्रत्येक वर्ण का उच्चारण उसके लिखित रूप के सर्वथा अनुरूप होता है।
#en-line[It is written from left to right. The pronunciation of every character corresponds precisely to its written form.]

#v(4pt)
#text(size: 10.5pt, weight: "bold")[१. लिपि की आधारभूत विशेषताएँ] \
#en-sub[1. Fundamental Characteristics of the Script]
#v(4pt)

+ #strong[अक्षरात्मक प्रकृति (Syllabic / Abugida)]: प्रत्येक व्यंजन में अंतर्निहित 'अ' स्वर स्वाभाविक रूप से सम्मिलित रहता है। \
  #en-line[Every consonant naturally possesses an inherent 'a' vowel unless muted (e.g. k + a = ka).]
+ #strong[शिरोरेखा (Top Horizontal Line / Shirorekha)]: अक्षरों के ऊपर खींची जाने वाली क्षैतिज रेखा शब्दों को एक सूत्र में बाँधती है। \
  #en-line[The horizontal headline drawn over characters unites words and establishes structural equilibrium.]
+ #strong[ज्यामितीय संतुलन (Geometric Balance)]: देवनागरी वर्ण ऊर्ध्व रेखाओं, वृत्तों, अर्धवृत्तों तथा पाशों के संयोजन से बनते हैं। \
  #en-line[Devanagari characters are harmoniously constructed using vertical strokes, circles, semicircles, and loops.]

#v(8pt)
#text(size: 11pt, weight: "bold")[देवनागरी स्वर वर्ण] \
#en-sub[Devanagari Vowels (Swar)]
#v(4pt)

#align(center)[
#table(
  columns: (50pt, 55pt, 155pt, 170pt),
  align: (center + top, center + top, left + top, left + top),
  [*स्वर (Letter)*], [*रोमन (Roman)*], [*उच्चारण संकेत (English Sound)*], [*शब्द उदाहरण (Example)*],
  [#strong[अ]], [a], [Short 'u' as in _about, cup_], [अनार (_anaar_ - pomegranate)],
  [#strong[आ]], [aa], [Long 'a' as in _father, car_], [आम (_aam_ - mango)],
  [#strong[इ]], [i], [Short 'i' as in _pin, bit_], [इमली (_imli_ - tamarind)],
  [#strong[ई]], [ee / ii], [Long 'ee' as in _feel, peel_], [ईख (_eekh_ - sugarcane)],
  [#strong[उ]], [u], [Short 'u' as in _put, bull_], [उल्लू (_ullu_ - owl)],
  [#strong[ऊ]], [oo / uu], [Long 'oo' as in _pool, root_], [ऊन (_oon_ - wool)],
  [#strong[ऋ]], [ri], [Vocalic 'ri' as in _rigid, rishi_], [ऋषि (_rishi_ - sage)],
  [#strong[ए]], [e], [Single vowel 'e' as in _day, pen_], [एक (_ek_ - one)],
  [#strong[ऐ]], [ai], [Diphthong 'ai' as in _pan, hand_], [ऐनक (_ainak_ - spectacles)],
  [#strong[ओ]], [o], [Long 'o' as in _go, post_], [ओखली (_okhli_ - mortar)],
  [#strong[औ]], [au], [Diphthong 'au' as in _caught, cow_], [औरत (_aurat_ - woman)],
  [#strong[अं]], [am / an], [Nasal dot (अनुस्वार) as in _under_], [अंगूर (_angoor_ - grapes)],
  [#strong[अः]], [ah], [Visarga (विसर्ग) aspiration], [प्रातः (_praatah_ - morning)]
)
]

#pagebreak()

// --- PAGE 5: अनुभाग १.२ ---
#v(6pt)
#text(size: 12pt, weight: "bold")[अनुभाग १.२ : सुलेख एवं स्ट्रोक क्रम के प्रामाणिक नियम] \
#en-sub[Section 1.2: Authentic Calligraphy Rules & Stroke Order Sequence]
#v(8pt)

देवनागरी लिपि में सुंदर, संतुलित एवं सुपाठ्य हस्तलेखन हेतु स्ट्रोक का क्रम निश्चित एवं वैज्ञानिक है:
#en-line[For elegant, balanced, and legible handwriting in Devanagari, the sequence of strokes is fixed and systematic:]

#v(4pt)
+ #strong[प्रथम चरण (Step 1 - वाम वक्र रचना)]: बाएँ भाग की वक्र रेखा या अर्धवृत्त की रचना की जाती है। \
  #en-line[Draw the curved stroke or semicircle on the left-hand section.]
+ #strong[द्वितीय चरण (Step 2 - मध्य योजक रेखा)]: मध्य की छोटी क्षैतिज योजक रेखा (यदि वर्ण में उपस्थित हो) खींची जाती है। \
  #en-line[Draw the central horizontal connecting stroke (if present in the character structure).]
+ #strong[तृतीय चरण (Step 3 - खड़ी पाई)]: लंबवत ऊर्ध्व रेखा (खड़ी पाई - Standing Line) ऊपर से नीचे की ओर खींची जाती है। \
  #en-line[Draw the primary vertical standing stroke (Khadi Pai) smoothly from top to bottom.]
+ #strong[अंतिम चरण (Step 4 - शिरोरेखा)]: वर्ण के पूर्ण होने के उपरांत ऊपर की शिरोरेखा को बाएँ से दाएँ खींचा जाता है। \
  #en-line[Finally, draw the top horizontal line (Shirorekha) from left to right; the Shirorekha is always drawn last.]

#v(10pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cccccc"))
#v(8pt)

#text(size: 11pt, weight: "bold")[विशेष सुलेखीय नियम (Special Calligraphic Rules)]
#v(6pt)

#rect(width: 100%, stroke: (left: 3pt + rgb("#111111")), inset: (left: 10pt, y: 6pt), fill: rgb("#fafafa"))[
  #strong[अपूर्ण शिरोरेखा वाले वर्ण (Broken Top Line Characters)]: \
  देवनागरी में ध, भ, थ, झ, तथा श्र जैसे वर्णों में शिरोरेखा पूरे वर्ण पर नहीं खींची जाती, अपितु बाएँ वृत्त/पाश (Loop) को खुला छोड़कर केवल दाहिनी खड़ी पाई पर खींची जाती है। \
  #en-line[In characters with open upper loops (such as ध, भ, थ, झ, श्र), the Shirorekha is not drawn completely across the character. The loop remains open and the horizontal stroke touches only the right vertical stem.]
]

#v(8pt)

#rect(width: 100%, stroke: (left: 3pt + rgb("#111111")), inset: (left: 10pt, y: 6pt), fill: rgb("#fafafa"))[
  #strong[समानुपातिक सौंदर्य (Proportional Harmony)]: \
  प्रत्येक वर्ण की चौड़ाई और ऊँचाई का अनुपात संतुलित होना चाहिए तथा खड़ी पाई सदैव ९० अंश पर लंबवत होनी चाहिए। \
  #en-line[The width and height ratio of each character must remain balanced, with the vertical stem aligned strictly at 90 degrees.]
]
