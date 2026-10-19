// Hindi Pushtak (हिन्दी पुस्तक) — Master Typst Document
// Configured for authentic A4 book geometry, bilingual Devanagari typography, and strict monochrome palette.

#set page(
  paper: "a4",
  margin: (top: 22mm, bottom: 22mm, left: 20mm, right: 20mm),
  header: context {
    let page-num = counter(page).get().first()
    if page-num == 1 { return none }
    let left-title = if page-num == 2 {
      [पुस्तक परिचय : दृष्टिकोण एवं शिक्षण-पद्धति]
    } else if page-num >= 3 and page-num <= 6 {
      [विषय-सूची : खंड एवं अनुभाग]
    } else if page-num == 7 {
      [खंड १ : वर्ण-संरचना एवं सुलेख कला]
    } else if page-num == 8 {
      [अनुभाग १.१ : देवनागरी स्वतंत्र स्वर वर्ण]
    } else if page-num == 9 {
      [अनुभाग १.२ : सुलेख एवं स्ट्रोक क्रम]
    } else {
      [हिन्दी पुस्तक]
    }
    let right-title = if page-num == 2 {
      [About the Book : Approach & Methodology]
    } else if page-num >= 3 and page-num <= 6 {
      [Table of Contents : Parts & Sections]
    } else if page-num == 7 {
      [Part 1 : Devanagari Script & Anatomy]
    } else if page-num == 8 {
      [Section 1.1 : Devanagari Vowels & Sounds]
    } else if page-num == 9 {
      [Section 1.2 : Calligraphy & Stroke Rules]
    } else {
      [Hindi Pushtak]
    }
    grid(
      columns: (1fr, 1fr),
      align: (left, right),
      text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 10.5pt, fill: rgb("#666666"))[#left-title],
      text(font: ("Noto Sans Devanagari", "DejaVu Sans"), size: 10.5pt, fill: rgb("#666666"))[#right-title]
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

// --- PAGE 1: COVER ---
#align(right + top)[
  #v(80pt)
  #text(size: 30pt, fill: rgb("#111111"))[❖]
  #v(14pt)
  #text(size: 34pt, weight: "bold", fill: rgb("#111111"))[हिन्दी पुस्तक] \
  #en-sub[Hindi Pushtak]
]

#pagebreak()

// --- PAGE 2: पुस्तक परिचय ---
#v(6pt)
#text(size: 18pt, weight: "bold")[पुस्तक परिचय] \
#en-sub[About the Book : Approach & Methodology]
#v(12pt)

#h(16pt)हिन्दी पुस्तक भाषा के सर्वांगीण, वैज्ञानिक एवं सोपानवत अध्ययन हेतु प्रस्तुत एक प्रामाणिक संदर्भ ग्रंथ है। इस ग्रंथ की मूल संकल्पना देवनागरी लिपि के आंतरिक सौंदर्य, सुदृढ़ ध्वनिविज्ञान, समृद्ध शब्द-भंडार तथा व्यावहारिक व्याकरणिक संरचना को स्वाभाविक और तर्कसंगत रूप से सुगम बनाने पर आधारित है। आधुनिक युग में भाषा-अधिगम केवल नियमों को कंठस्थ करने तक सीमित नहीं रह सकता; अतः यह पुस्तक शिक्षार्थी को लिपि-विज्ञान के मूलाधारों से जोड़ते हुए अक्षरों के सटीक आलेखन, शिरोरेखा के संतुलन, उच्चारण-स्थानों की सूक्ष्म भिन्नताओं तथा मानक वर्तनी के अनिवार्य नियमों से परिचित कराती है। शिक्षार्थियों के भीतर भाषा के प्रति स्वाभाविक रुचि और विश्लेषणात्मक समझ विकसित करना ही इस प्रयास का मुख्य प्रयोजन है।

#en-para[Hindi Pushtak is an authoritative reference work presented for the comprehensive, scientific, and graded study of the Hindi language. The foundational concept of this work is based on making the intrinsic aesthetic beauty, rigorous phonetics, rich vocabulary, and practical grammatical architecture of the Devanagari script accessible in a natural and rational manner. In the contemporary era, language learning cannot remain confined to mechanical rote memorization; hence, this book connects the learner directly with the core foundations of script science, acquainting them with the precise stroke formation of characters, horizontal balance of the headline, subtle distinctions of articulation points, and essential conventions of standard orthography. Cultivating a genuine affinity and analytical understanding of the language within learners remains the principal objective of this endeavour.]

#v(8pt)
#h(16pt)इस ग्रंथ की अध्ययन पद्धति पूर्णतः क्रमिक, द्विभाषिक एवं व्यावहारिक अनुप्रयोगात्मक उपागम पर अवलंबित है, जिसमें आधारभूत वर्णमाला परिचय एवं सुलेख-अभ्यास से लेकर दैनंदिन जीवन के जीवंत संवादों, साहित्यिक गद्य-पाठों, मानक इनस्क्रिप्ट टंकण तथा उच्चस्तरीय प्रशासनिक व विधिक भाषा-प्रयोग तक की यात्रा निर्बाध रूप से संपन्न होती है। प्रत्येक व्याकरणिक एवं व्यावहारिक संकल्पना के साथ स्पष्ट द्विभाषिक विवेचन, प्रामाणिक उदाहरण और व्यावहारिक संदर्भ प्रस्तुत किए गए हैं, ताकि स्वयं अध्ययन करने वाले अध्येता तथा कक्षा-कक्ष के विद्यार्थी दोनों ही समान सहजता से भाषा के मर्म को आत्मसात कर सकें और शुद्ध अभिव्यक्ति का आत्मविश्वास अर्जित कर सकें।

#en-para[The pedagogical methodology of this text is rooted entirely in a systematic, bilingual, and functional-applied communicative approach, charting a seamless progression from fundamental alphabet anatomy and calligraphy drills to vibrant daily dialogues, graded prose narratives, standard InScript keyboard typing, and advanced official and statutory drafting. Every pedagogical concept is accompanied by explicit bilingual commentary, authentic illustrative examples, and practical usage contexts, empowering both independent self-taught scholars and classroom students to assimilate the living spirit of the language with confidence and express themselves with precision.]

#pagebreak()

// --- PAGES 3 to 6: विषय-सूची ---
#set table(
  stroke: (x, y) => if y == 0 { (bottom: 1pt + rgb("#111111"), top: 1pt + rgb("#111111")) } else { (bottom: 0.3pt + rgb("#e5e5e5")) },
  fill: (x, y) => if y == 0 { rgb("#f8f8f8") } else { none },
  inset: (x: 6pt, y: 5.5pt)
)

// PAGE 3: खंड १ से ५
#v(2pt)
#text(size: 16pt, weight: "bold")[विषय-सूची : भाग १] \
#en-sub[Table of Contents : Parts 1 to 5]
#v(6pt)

#table(
  columns: (60pt, 1fr),
  align: (center + top, left + top),
  [*खंड* \ #en-sub[Part]], [*शीर्षक, अनुभाग एवं विषय* \ #en-sub[Title, Sections & Topics]],
  [#strong[खंड १] \
  #en-sub[Part 1]],
  [#strong[वर्ण-संरचना एवं सुलेख कला] \
  #en-sub[Script, Strokes & Calligraphy] \
  #v(2pt)
  #text(size: 9.8pt, fill: rgb("#333333"))[१.१ : देवनागरी लिपि का उद्भव एवं स्वरूप #h(6pt)•#h(6pt) १.२ : सुलेख एवं स्ट्रोक क्रम के प्रामाणिक नियम #h(6pt)•#h(6pt) १.३ : शिरोरेखा एवं ज्यामितीय संतुलन] \
  #v(1pt)
  #text(size: 8.8pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.1 : Origin & Architecture of Devanagari #h(6pt)•#h(6pt) 1.2 : Calligraphy Rules & Stroke Order Sequence #h(6pt)•#h(6pt) 1.3 : Shirorekha & Geometric Balance]],
  [#strong[खंड २] \
  #en-sub[Part 2]],
  [#strong[ध्वनि-व्यवस्था एवं उच्चारण] \
  #en-sub[Sound System & Pronunciation] \
  #v(2pt)
  #text(size: 9.8pt, fill: rgb("#333333"))[२.१ : स्वर एवं व्यंजन वर्णमाला वर्गीकरण #h(6pt)•#h(6pt) २.२ : उच्चारण स्थान : कंठ्य, तालव्य, मूर्धन्य, दंत्य, ओष्ठ्य #h(6pt)•#h(6pt) २.३ : अल्पप्राण, महाप्राण, घोष एवं अघोष ध्वनियाँ] \
  #v(1pt)
  #text(size: 8.8pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[2.1 : Vowel & Consonant Classification #h(6pt)•#h(6pt) 2.2 : Places of Articulation: Velar to Labial #h(6pt)•#h(6pt) 2.3 : Aspiration & Voicing Distinctions]],
  [#strong[खंड ३] \
  #en-sub[Part 3]],
  [#strong[स्वर, मात्राएँ एवं संयुक्ताक्षर] \
  #en-sub[Vowels, Diacritics & Conjuncts] \
  #v(2pt)
  #text(size: 9.8pt, fill: rgb("#333333"))[३.१ : ह्रस्व, दीर्घ एवं संयुक्त स्वर व्यवस्था #h(6pt)•#h(6pt) ३.२ : मात्रा प्रणाली, अनुस्वार एवं अनुनासिक #h(6pt)•#h(6pt) ३.३ : संयुक्ताक्षर रचना, पाई वाले एवं बिना पाई वाले वर्ण] \
  #v(1pt)
  #text(size: 8.8pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[3.1 : Short, Long & Diphthong Vowel System #h(6pt)•#h(6pt) 3.2 : Matra System, Anusvara & Anunasika #h(6pt)•#h(6pt) 3.3 : Conjunct Formation, Stemmed & Non-Stemmed]],
  [#strong[खंड ४] \
  #en-sub[Part 4]],
  [#strong[संज्ञा, लिंग एवं वचन रूप] \
  #en-sub[Nouns, Gender & Number Inflection] \
  #v(2pt)
  #text(size: 9.8pt, fill: rgb("#333333"))[४.१ : संज्ञा के भेद : व्यक्तिवाचक, जातिवाचक, भाववाचक #h(6pt)•#h(6pt) ४.२ : पुल्लिंग एवं स्त्रीलिंग पहचान के नियम #h(6pt)•#h(6pt) ४.३ : एकवचन से बहुवचन रूपांतरण व्यवस्था] \
  #v(1pt)
  #text(size: 8.8pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[4.1 : Noun Classes: Proper, Common, Abstract #h(6pt)•#h(6pt) 4.2 : Masculine & Feminine Gender Rules #h(6pt)•#h(6pt) 4.3 : Singular to Plural Inflection System]],
  [#strong[खंड ५] \
  #en-sub[Part 5]],
  [#strong[कारक एवं विभक्ति-व्यवस्था] \
  #en-sub[Postpositions & Case System] \
  #v(2pt)
  #text(size: 9.8pt, fill: rgb("#333333"))[५.१ : हिन्दी के आठ कारक एवं उनके लक्षण #h(6pt)•#h(6pt) ५.२ : परसर्ग प्रयोग : ने, को, से, का, के, की, में, पर #h(6pt)•#h(6pt) ५.३ : तिर्यक रूप एवं विकारी संज्ञा रचना] \
  #v(1pt)
  #text(size: 8.8pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[5.1 : Eight Hindi Cases & Their Functions #h(6pt)•#h(6pt) 5.2 : Postposition Usage: ne, ko, se, ka, mein, par #h(6pt)•#h(6pt) 5.3 : Oblique Case Forms & Nominal Inflection]],
)

#pagebreak()

// PAGE 4: खंड ६ से १०
#v(2pt)
#text(size: 16pt, weight: "bold")[विषय-सूची : भाग २] \
#en-sub[Table of Contents : Parts 6 to 10]
#v(6pt)

#table(
  columns: (60pt, 1fr),
  align: (center + top, left + top),
  [*खंड* \ #en-sub[Part]], [*शीर्षक, अनुभाग एवं विषय* \ #en-sub[Title, Sections & Topics]],
  [#strong[खंड ६] \
  #en-sub[Part 6]],
  [#strong[सर्वनाम एवं संबंधपरक रूप] \
  #en-sub[Pronouns & Demonstratives] \
  #v(2pt)
  #text(size: 9.8pt, fill: rgb("#333333"))[६.१ : पुरुषवाचक सर्वनाम : उत्तम, मध्यम एवं अन्य पुरुष #h(6pt)•#h(6pt) ६.२ : निश्चयवाचक, अनिश्चयवाचक एवं निजवाचक सर्वनाम #h(6pt)•#h(6pt) ६.३ : संबंधवाचक एवं प्रश्नवाचक सर्वनाम प्रयोग] \
  #v(1pt)
  #text(size: 8.8pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[6.1 : Personal Pronouns: 1st, 2nd, 3rd Person #h(6pt)•#h(6pt) 6.2 : Demonstrative, Indefinite & Reflexive #h(6pt)•#h(6pt) 6.3 : Relative & Interrogative Pronouns]],
  [#strong[खंड ७] \
  #en-sub[Part 7]],
  [#strong[विशेषण एवं संख्या-पद्धति] \
  #en-sub[Adjectives & Numerals] \
  #v(2pt)
  #text(size: 9.8pt, fill: rgb("#333333"))[७.१ : गुणवाचक, परिमाणवाचक एवं सार्वनामिक विशेषण #h(6pt)•#h(6pt) ७.२ : आकारान्त विशेषणों का लिंग-वचन विकार #h(6pt)•#h(6pt) ७.३ : १ से १०० तक मानक देवनागरी अंक एवं शब्द] \
  #v(1pt)
  #text(size: 8.8pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[7.1 : Qualitative, Quantitative & Pronominal #h(6pt)•#h(6pt) 7.2 : Inflecting vs Non-Inflecting Adjectives #h(6pt)•#h(6pt) 7.3 : Standard Numerals 1 to 100 in Devanagari]],
  [#strong[खंड ८] \
  #en-sub[Part 8]],
  [#strong[क्रिया-मूल एवं वर्तमान काल] \
  #en-sub[Verb Roots & Present Tenses] \
  #v(2pt)
  #text(size: 9.8pt, fill: rgb("#333333"))[८.१ : धातु, क्रिया के भेद : अकर्मक एवं सकर्मक #h(6pt)•#h(6pt) ८.२ : होना क्रिया रूप एवं सहायक क्रियाएँ #h(6pt)•#h(6pt) ८.३ : सामान्य वर्तमान, अपूर्ण वर्तमान एवं संदिग्ध वर्तमान] \
  #v(1pt)
  #text(size: 8.8pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[8.1 : Verbal Roots, Intransitive & Transitive #h(6pt)•#h(6pt) 8.2 : Copula Hona & Auxiliary Verb Forms #h(6pt)•#h(6pt) 8.3 : Simple, Continuous & Presumptive Present]],
  [#strong[खंड ९] \
  #en-sub[Part 9]],
  [#strong[भूतकाल, भविष्यत् एवं ने नियम] \
  #en-sub[Past, Future & Ne Rule] \
  #v(2pt)
  #text(size: 9.8pt, fill: rgb("#333333"))[९.१ : सामान्य भूत, आसन्न भूत एवं पूर्ण भूतकाल #h(6pt)•#h(6pt) ९.२ : सकर्मक भूतकाल में कर्ता के साथ ने का अनिवार्य नियम #h(6pt)•#h(6pt) ९.३ : सामान्य एवं संभाव्य भविष्यत् काल रचना] \
  #v(1pt)
  #text(size: 8.8pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[9.1 : Simple, Immediate & Perfect Past Tenses #h(6pt)•#h(6pt) 9.2 : Ergative Ne Construction with Transitive Verbs #h(6pt)•#h(6pt) 9.3 : Simple & Subjunctive Future Formations]],
  [#strong[खंड १०] \
  #en-sub[Part 10]],
  [#strong[संयुक्त एवं प्रेरणार्थक क्रियाएँ] \
  #en-sub[Compound Verbs & Causatives] \
  #v(2pt)
  #text(size: 9.8pt, fill: rgb("#333333"))[१०.१ : रंजक क्रियाएँ : जाना, लेना, देना, बैठना, उठना #h(6pt)•#h(6pt) १०.२ : प्रथम एवं द्वितीय प्रेरणार्थक क्रिया निर्माण #h(6pt)•#h(6pt) १०.३ : अभ्यासपरक एवं सातत्यबोधक क्रिया रूप] \
  #v(1pt)
  #text(size: 8.8pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[10.1 : Explicator Compound Verbs: jana, lena, dena #h(6pt)•#h(6pt) 10.2 : First & Second Causative Derivations #h(6pt)•#h(6pt) 10.3 : Habitual & Continuative Verbal Aspects]],
)

#pagebreak()

// PAGE 5: खंड ११ से १५
#v(2pt)
#text(size: 16pt, weight: "bold")[विषय-सूची : भाग ३] \
#en-sub[Table of Contents : Parts 11 to 15]
#v(6pt)

#table(
  columns: (60pt, 1fr),
  align: (center + top, left + top),
  [*खंड* \ #en-sub[Part]], [*शीर्षक, अनुभाग एवं विषय* \ #en-sub[Title, Sections & Topics]],
  [#strong[खंड ११] \
  #en-sub[Part 11]],
  [#strong[कर्मवाच्य एवं मिश्र वाक्य] \
  #en-sub[Passive Voice & Complex Syntax] \
  #v(2pt)
  #text(size: 9.8pt, fill: rgb("#333333"))[११.१ : कर्तृवाच्य, कर्मवाच्य एवं भाववाच्य व्यवस्था #h(6pt)•#h(6pt) ११.२ : सरल, संयुक्त एवं मिश्रित वाक्य रचना #h(6pt)•#h(6pt) ११.३ : योजक अव्यय : कि, क्योंकि, इसलिए, यद्यपि...तथापि] \
  #v(1pt)
  #text(size: 8.8pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[11.1 : Active, Passive & Impersonal Voices #h(6pt)•#h(6pt) 11.2 : Simple, Compound & Complex Sentence Structures #h(6pt)•#h(6pt) 11.3 : Conjunctions: ki, kyonki, isliye, yadyapi]],
  [#strong[खंड १२] \
  #en-sub[Part 12]],
  [#strong[संकेतार्थक एवं विधिक प्रयोग] \
  #en-sub[Conditionals & Subjunctive Mood] \
  #v(2pt)
  #text(size: 9.8pt, fill: rgb("#333333"))[१२.१ : यदि...तो संकेतार्थक वाक्य रचना #h(6pt)•#h(6pt) १२.२ : संभाव्यार्थ, अनुज्ञार्थ एवं विध्यर्थ क्रिया रूप #h(6pt)•#h(6pt) १२.३ : बाध्यतापरक संरचनाएँ : पड़ना, होना, चाहिए] \
  #v(1pt)
  #text(size: 8.8pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[12.1 : Conditional yadi...to Constructions #h(6pt)•#h(6pt) 12.2 : Subjunctive, Imperative & Optative Moods #h(6pt)•#h(6pt) 12.3 : Obligation Constructions: padna, hona, chahiye]],
  [#strong[खंड १३] \
  #en-sub[Part 13]],
  [#strong[दैनिक जीवन एवं संभाषण] \
  #en-sub[Daily Conversations & Situations] \
  #v(2pt)
  #text(size: 9.8pt, fill: rgb("#333333"))[१३.१ : शिष्टाचार, अभिवादन एवं परिचय संवाद #h(6pt)•#h(6pt) १३.२ : पारिवारिक परिवेश, खान-पान एवं परिधान #h(6pt)•#h(6pt) १३.३ : बाज़ार, क्रय-विक्रय एवं यात्रा प्रसंग] \
  #v(1pt)
  #text(size: 8.8pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[13.1 : Etiquette, Greetings & Introductions #h(6pt)•#h(6pt) 13.2 : Family Life, Food, Dining & Attire #h(6pt)•#h(6pt) 13.3 : Marketplace, Shopping & Travel Situations]],
  [#strong[खंड १४] \
  #en-sub[Part 14]],
  [#strong[गद्य-पाठमाला एवं आख्यान] \
  #en-sub[Graded Prose Readings] \
  #v(2pt)
  #text(size: 9.8pt, fill: rgb("#333333"))[१४.१ : प्रकृति, ऋतु-वर्णन एवं भारतीय संस्कृति #h(6pt)•#h(6pt) १४.२ : प्रेरक जीवन-चरित एवं ऐतिहासिक आख्यान #h(6pt)•#h(6pt) १४.३ : आधुनिक जीवन, विज्ञान एवं पर्यावरण चेतना] \
  #v(1pt)
  #text(size: 8.8pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[14.1 : Nature, Seasons & Cultural Heritage #h(6pt)•#h(6pt) 14.2 : Inspirational Biographies & Historical Accounts #h(6pt)•#h(6pt) 14.3 : Modern Life, Science & Ecological Awareness]],
  [#strong[खंड १५] \
  #en-sub[Part 15]],
  [#strong[मानक वर्तनी एवं टंकण] \
  #en-sub[Orthography & InScript Typing] \
  #v(2pt)
  #text(size: 9.8pt, fill: rgb("#333333"))[१५.१ : केन्द्रीय हिन्दी निदेशालय के मानक वर्तनी नियम #h(6pt)•#h(6pt) १५.२ : देवनागरी इनस्क्रिप्ट कीबोर्ड विन्यास एवं अंगुली संचालन #h(6pt)•#h(6pt) १५.३ : गति अभ्यास एवं सामान्य टंकण अशुद्धियों का निवारण] \
  #v(1pt)
  #text(size: 8.8pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[15.1 : Standard Hindi Orthographic Conventions #h(6pt)•#h(6pt) 15.2 : Devanagari InScript Keyboard & Finger Placement #h(6pt)•#h(6pt) 15.3 : Typing Speed Drills & Error Correction]],
)

#pagebreak()

// PAGE 6: खंड १६ से २०
#v(2pt)
#text(size: 16pt, weight: "bold")[विषय-सूची : भाग ४] \
#en-sub[Table of Contents : Parts 16 to 20]
#v(6pt)

#table(
  columns: (60pt, 1fr),
  align: (center + top, left + top),
  [*खंड* \ #en-sub[Part]], [*शीर्षक, अनुभाग एवं विषय* \ #en-sub[Title, Sections & Topics]],
  [#strong[खंड १६] \
  #en-sub[Part 16]],
  [#strong[प्रशासनिक शब्दावली व टिप्पण] \
  #en-sub[Official Terminology & Notes] \
  #v(2pt)
  #text(size: 9.8pt, fill: rgb("#333333"))[१६.१ : मानक कार्यालयीन एवं प्रशासनिक पारिभाषिक शब्दावली #h(6pt)•#h(6pt) १६.२ : नेमी एवं सामान्य टिप्पण लेखन पद्धति #h(6pt)•#h(6pt) १६.३ : औपचारिक एवं अनुभागीय विचारणीय टिप्पण] \
  #v(1pt)
  #text(size: 8.8pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[16.1 : Standard Administrative & Official Terms #h(6pt)•#h(6pt) 16.2 : Routine & Procedural Note Drafting #h(6pt)•#h(6pt) 16.3 : Formal Sectional & Deliberative Notes]],
  [#strong[खंड १७] \
  #en-sub[Part 17]],
  [#strong[कार्यालयी पत्राचार एवं आलेखन] \
  #en-sub[Official Correspondence] \
  #v(2pt)
  #text(size: 9.8pt, fill: rgb("#333333"))[१७.१ : सरकारी पत्र एवं अर्ध-सरकारी पत्र प्रारूप #h(6pt)•#h(6pt) १७.२ : कार्यालय ज्ञापन, आदेश एवं परिपत्र आलेखन #h(6pt)•#h(6pt) १७.३ : अधिसूचना, संकल्प एवं प्रेस विज्ञप्ति रचना] \
  #v(1pt)
  #text(size: 8.8pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[17.1 : Official & Semi-Official Letter Formats #h(6pt)•#h(6pt) 17.2 : Office Memoranda, Orders & Circulars #h(6pt)•#h(6pt) 17.3 : Gazette Notifications, Resolutions & Press Releases]],
  [#strong[खंड १८] \
  #en-sub[Part 18]],
  [#strong[बैंकिंग व वित्तीय कार्य-प्रणाली] \
  #en-sub[Banking & Financial Hindi] \
  #v(2pt)
  #text(size: 9.8pt, fill: rgb("#333333"))[१८.१ : बैंकिंग एवं वित्तीय पारिभाषिक शब्दावली #h(6pt)•#h(6pt) १८.२ : खाता संचालन, सावधि जमा एवं ऋण पत्राचार #h(6pt)•#h(6pt) १८.३ : विनिमय पत्र, चेक, विप्रेषण एवं डिजिटल बैंकिंग] \
  #v(1pt)
  #text(size: 8.8pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[18.1 : Banking & Financial Glossary #h(6pt)•#h(6pt) 18.2 : Account Operations, Deposits & Loan Correspondence #h(6pt)•#h(6pt) 18.3 : Bills of Exchange, Cheques, Remittance & Digital Banking]],
  [#strong[खंड १९] \
  #en-sub[Part 19]],
  [#strong[राजभाषा नीति एवं शासन] \
  #en-sub[Constitutional Policy & Governance] \
  #v(2pt)
  #text(size: 9.8pt, fill: rgb("#333333"))[१९.१ : संवैधानिक प्रावधान : अनुच्छेद ३४३ से ३५१ #h(6pt)•#h(6pt) १९.२ : राजभाषा अधिनियम १९६३ एवं राजभाषा नियम १९७६ #h(6pt)•#h(6pt) १९.३ : वार्षिक कार्यक्रम, कार्यान्वयन समितियाँ एवं अनुवाद] \
  #v(1pt)
  #text(size: 8.8pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[19.1 : Constitutional Provisions: Articles 343 to 351 #h(6pt)•#h(6pt) 19.2 : Official Languages Act 1963 & Rules 1976 #h(6pt)•#h(6pt) 19.3 : Annual Programs, Implementation & Translation]],
  [#strong[खंड २०] \
  #en-sub[Part 20]],
  [#strong[शब्दावली, मुहावरे एवं निर्देशिका] \
  #en-sub[Lexicon, Idioms & Index] \
  #v(2pt)
  #text(size: 9.8pt, fill: rgb("#333333"))[२०.१ : दैनिक एवं आधिकारिक मुहावरे तथा लोकोक्तियाँ #h(6pt)•#h(6pt) २०.२ : प्रशासनिक एवं विधिक द्विभाषिक शब्दकोश #h(6pt)•#h(6pt) २०.३ : व्याकरणिक संकल्पना एवं विषय निर्देशिका] \
  #v(1pt)
  #text(size: 8.8pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[20.1 : Idiomatic Expressions & Proverbs #h(6pt)•#h(6pt) 20.2 : Bilingual Administrative & Legal Lexicon #h(6pt)•#h(6pt) 20.3 : Grammatical Concepts & Comprehensive Index]],
)

#pagebreak()

// --- PAGE 7: खंड १ ---
#v(6pt)
#text(size: 18pt, weight: "bold")[खंड १ : देवनागरी लिपि, वर्ण-संरचना एवं सुलेख कला] \
#en-sub[Part 1: Devanagari Script, Character Anatomy & Calligraphy]
#v(6pt)
#line(length: 100%, stroke: 0.5pt + rgb("#cccccc"))
#v(8pt)

#text(size: 14pt, weight: "bold")[अनुभाग १.१ : देवनागरी लिपि का उद्भव एवं स्वरूप] \
#en-sub[Section 1.1: Origin & Structural Architecture of Devanagari Script]
#v(6pt)

देवनागरी विश्व की सर्वाधिक वैज्ञानिक एवं ध्वन्यात्मक लिपियों में से एक है।
#en-line[Devanagari is one of the most scientific and phonetic scripts in the world.]
#v(6pt)

यह बाएँ से दाएँ लिखी जाती है। प्रत्येक वर्ण का उच्चारण उसके लिखित रूप के सर्वथा अनुरूप होता है।
#en-line[It is written from left to right. The pronunciation of every character corresponds precisely to its written form.]

#v(14pt)
#text(size: 12.5pt, weight: "bold")[१. लिपि की आधारभूत विशेषताएँ] \
#en-sub[1. Fundamental Characteristics of the Script]
#v(8pt)

#strong[१. अक्षरात्मक प्रकृति] \
#en-sub[1. Syllabic Nature / Abugida] \
#v(2pt)
प्रत्येक व्यंजन में अंतर्निहित अ स्वर स्वाभाविक रूप से सम्मिलित रहता है। \
#en-line[Every consonant naturally possesses an inherent a vowel unless muted e.g. ka plus a equals ka.]

#v(8pt)
#strong[२. शिरोरेखा] \
#en-sub[2. Top Horizontal Line / Shirorekha] \
#v(2pt)
अक्षरों के ऊपर खींची जाने वाली क्षैतिज रेखा शब्दों को एक सूत्र में बाँधती है। \
#en-line[The horizontal headline drawn over characters unites words and establishes structural equilibrium.]

#v(8pt)
#strong[३. ज्यामितीय संतुलन] \
#en-sub[3. Geometric Balance] \
#v(2pt)
देवनागरी वर्ण ऊर्ध्व रेखाओं, वृत्तों, अर्धवृत्तों तथा पाशों के संयोजन से बनते हैं। \
#en-line[Devanagari characters are harmoniously constructed using vertical strokes, circles, semicircles, and loops.]

#pagebreak()

// --- PAGE 8: देवनागरी स्वर वर्ण तालिका ---
#v(6pt)
#text(size: 14pt, weight: "bold")[देवनागरी स्वर वर्ण] \
#en-sub[Devanagari Vowels Swar]
#v(6pt)

#align(center)[
#table(
  columns: (52pt, 60pt, 165pt, 180pt),
  align: (center + top, center + top, left + top, left + top),
  [*स्वर* \ #en-sub[Letter]], [*रोमन* \ #en-sub[Roman]], [*उच्चारण संकेत* \ #en-sub[English Sound]], [*शब्द उदाहरण* \ #en-sub[Word Example]],
  [#strong[अ]], [a], [Short u as in about, cup], [अनार \ #en-sub[anaar : pomegranate]],
  [#strong[आ]], [aa], [Long a as in father, car], [आम \ #en-sub[aam : mango]],
  [#strong[इ]], [i], [Short i as in pin, bit], [इमली \ #en-sub[imli : tamarind]],
  [#strong[ई]], [ee / ii], [Long ee as in feel, peel], [ईख \ #en-sub[eekh : sugarcane]],
  [#strong[उ]], [u], [Short u as in put, bull], [उल्लू \ #en-sub[ullu : owl]],
  [#strong[ऊ]], [oo / uu], [Long oo as in pool, root], [ऊन \ #en-sub[oon : wool]],
  [#strong[ऋ]], [ri], [Vocalic ri as in rigid, rishi], [ऋषि \ #en-sub[rishi : sage]],
  [#strong[ए]], [e], [Single vowel e as in day, pen], [एक \ #en-sub[ek : one]],
  [#strong[ऐ]], [ai], [Diphthong ai as in pan, hand], [ऐनक \ #en-sub[ainak : spectacles]],
  [#strong[ओ]], [o], [Long o as in go, post], [ओखली \ #en-sub[okhli : mortar]],
  [#strong[औ]], [au], [Diphthong au as in caught, cow], [औरत \ #en-sub[aurat : woman]],
  [#strong[अं]], [am / an], [Nasal dot anasvara as in under], [अंगूर \ #en-sub[angoor : grapes]],
  [#strong[अः]], [ah], [Visarga aspiration], [प्रातः \ #en-sub[praatah : morning]]
)
]

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
