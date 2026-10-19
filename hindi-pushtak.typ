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
    } else if page-num >= 3 and page-num <= 8 {
      [विषय-सूची : खंड एवं अनुभाग]
    } else if page-num == 9 {
      [खंड १ : वर्ण-संरचना एवं सुलेख कला]
    } else if page-num == 10 {
      [अनुभाग १.१ : देवनागरी स्वतंत्र स्वर वर्ण]
    } else if page-num == 11 {
      [अनुभाग १.२ : सुलेख एवं स्ट्रोक क्रम]
    } else {
      [हिन्दी पुस्तक]
    }
    let right-title = if page-num == 2 {
      [About the Book : Approach & Methodology]
    } else if page-num >= 3 and page-num <= 8 {
      [Table of Contents : Parts & Sections]
    } else if page-num == 9 {
      [Part 1 : Devanagari Script & Anatomy]
    } else if page-num == 10 {
      [Section 1.1 : Devanagari Vowels & Sounds]
    } else if page-num == 11 {
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
  inset: (x: 4.5pt, y: 3.2pt)
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
  [#strong[देवनागरी लिपि-संरचना एवं सुलेख कला] \
  #en-sub[Devanagari Script Architecture & Calligraphy] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[१.१ : देवनागरी लिपि का ऐतिहासिक उद्भव एवं विकास #h(6pt)•#h(6pt) १.२ : अक्षरात्मक प्रकृति एवं आबुगिदा व्यवस्था #h(6pt)•#h(6pt) १.३ : शिरोरेखा के प्रामाणिक नियम एवं महत्व #h(6pt)•#h(6pt) १.४ : खड़ी पाई वाले वर्णों की मानक संरचना #h(6pt)•#h(6pt) १.५ : बिना पाई एवं गोलाकार वर्णों की संरचना #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[1.1 : Historical Origin & Evolution of Devanagari #h(6pt)•#h(6pt) 1.2 : Syllabic Nature & Abugida Architecture #h(6pt)•#h(6pt) 1.3 : Shirorekha Rules, Importance & Alignment #h(6pt)•#h(6pt) 1.4 : Characters with Vertical Stem (Khadi Pai) #h(6pt)•#h(6pt) 1.5 : Non-Stemmed & Circular Character Anatomy #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
  [#strong[खंड २] \
  #en-sub[Part 2]],
  [#strong[स्वर, अनुस्वार एवं नासिक्य ध्वनियाँ] \
  #en-sub[Vowels, Diacritics & Nasalization] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[२.१ : ह्रस्व स्वर (अ, इ, उ, ऋ) का स्वरूप व उच्चारण #h(6pt)•#h(6pt) २.२ : दीर्घ स्वर (आ, ई, ऊ) की ध्वन्यात्मकता #h(6pt)•#h(6pt) २.३ : संयुक्त स्वर (ए, ऐ, ओ, औ) का उच्चारण #h(6pt)•#h(6pt) २.४ : स्वतंत्र स्वर बनाम मात्रा रूप प्रणाली #h(6pt)•#h(6pt) २.५ : अनुस्वार (ं) का ध्वनिविज्ञान एवं नियम #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[2.1 : Short Vowels (a, i, u, ri) & Articulation #h(6pt)•#h(6pt) 2.2 : Long Vowels (aa, ee, oo) & Acoustics #h(6pt)•#h(6pt) 2.3 : Diphthongs (e, ai, o, au) Articulation #h(6pt)•#h(6pt) 2.4 : Independent Vowels vs Matra Forms #h(6pt)•#h(6pt) 2.5 : Phonetics & Orthography of Anusvara #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
  [#strong[खंड ३] \
  #en-sub[Part 3]],
  [#strong[व्यंजन-व्यवस्था एवं उच्चारण-विज्ञान] \
  #en-sub[Consonant Classification & Phonetics] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[३.१ : स्पर्श व्यंजन वर्ग (क-वर्ग से प-वर्ग तक) #h(6pt)•#h(6pt) ३.२ : कंठ्य ध्वनियाँ (क, ख, ग, घ, ङ) #h(6pt)•#h(6pt) ३.३ : तालव्य ध्वनियाँ (च, छ, ज, झ, ञ) #h(6pt)•#h(6pt) ३.४ : मूर्धन्य ध्वनियाँ (ट, ठ, ड, ढ, ण) #h(6pt)•#h(6pt) ३.५ : दंत्य ध्वनियाँ (त, थ, द, ध, न) #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[3.1 : Stop Consonants: 5 Varga Classes #h(6pt)•#h(6pt) 3.2 : Velar Consonants: Articulation & Drills #h(6pt)•#h(6pt) 3.3 : Palatal Consonants: Articulation & Drills #h(6pt)•#h(6pt) 3.4 : Retroflex Consonants: Tongue Positioning #h(6pt)•#h(6pt) 3.5 : Dental Consonants: Articulation & Contrast #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
  [#strong[खंड ४] \
  #en-sub[Part 4]],
  [#strong[संयुक्ताक्षर, संधि एवं वर्ण-विच्छेद] \
  #en-sub[Conjuncts, Sandhi & Orthographic Analysis] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[४.१ : संयुक्ताक्षर निर्माण के सामान्य नियम #h(6pt)•#h(6pt) ४.२ : खड़ी पाई हटाकर बनने वाले संयुक्ताक्षर #h(6pt)•#h(6pt) ४.३ : गुंडी काटकर बनने वाले संयुक्ताक्षर (क, फ) #h(6pt)•#h(6pt) ४.४ : हलंत चिह्न (्) का प्रामाणिक प्रयोग #h(6pt)•#h(6pt) ४.५ : र के विशिष्ट रूप : शिरोरेखा पर रेफ़ (र्) #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[4.1 : Principles of Conjunct Formation #h(6pt)•#h(6pt) 4.2 : Stem-Dropping Half Consonants (Khadi Pai) #h(6pt)•#h(6pt) 4.3 : Loop-Hook Dropping (ka, pha Conjuncts) #h(6pt)•#h(6pt) 4.4 : Virama / Halant Usage in Non-Stemmed Letters #h(6pt)•#h(6pt) 4.5 : Syllable-Initial R: The Reph Marker #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
  [#strong[खंड ५] \
  #en-sub[Part 5]],
  [#strong[संज्ञा, लिंग-व्यवस्था एवं प्रकृति] \
  #en-sub[Noun Classes & Grammatical Gender] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[५.१ : संज्ञा की परिभाषा एवं तीन मूलभूत भेद #h(6pt)•#h(6pt) ५.२ : व्यक्तिवाचक संज्ञा एवं प्रयोगात्मक नियम #h(6pt)•#h(6pt) ५.३ : जातिवाचक संज्ञा एवं उपभेद (द्रव्य व समूह) #h(6pt)•#h(6pt) ५.४ : भाववाचक संज्ञा निर्माण (संज्ञा, सर्वनाम से) #h(6pt)•#h(6pt) ५.५ : भाववाचक संज्ञा निर्माण (विशेषण व क्रिया से) #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[5.1 : Definition & Three Primary Noun Classes #h(6pt)•#h(6pt) 5.2 : Proper Nouns: Rules & Usage #h(6pt)•#h(6pt) 5.3 : Common, Material & Collective Nouns #h(6pt)•#h(6pt) 5.4 : Abstract Noun Derivations from Nouns/Pronouns #h(6pt)•#h(6pt) 5.5 : Abstract Nouns from Adjectives & Verbs #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
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
  [#strong[वचन-विधान एवं रूपांतरण व्यवस्था] \
  #en-sub[Number System & Pluralization] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[६.१ : एकवचन एवं बहुवचन की मूलभूत संकल्पना #h(6pt)•#h(6pt) ६.२ : आकारान्त पुल्लिंग संज्ञाओं का बहुवचन (-आ से -ए) #h(6pt)•#h(6pt) ६.३ : अनाकारान्त पुल्लिंग संज्ञाओं की अपरिवर्तनीयता #h(6pt)•#h(6pt) ६.४ : अकारान्त स्त्रीलिंग शब्दों का बहुवचन (-एँ) #h(6pt)•#h(6pt) ६.५ : आकारान्त स्त्रीलिंग शब्दों का बहुवचन (-एँ) #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[6.1 : Singular & Plural Conceptions #h(6pt)•#h(6pt) 6.2 : Pluralization of Marked Masculines (-aa to -e) #h(6pt)•#h(6pt) 6.3 : Invariable Unmarked Masculines in Direct Case #h(6pt)•#h(6pt) 6.4 : Pluralization of Feminines Ending in Consonant (-ein) #h(6pt)•#h(6pt) 6.5 : Pluralization of Feminines Ending in -aa (-aayein) #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
  [#strong[खंड ७] \
  #en-sub[Part 7]],
  [#strong[कारक-प्रणाली, परसर्ग एवं तिर्यक रूप] \
  #en-sub[Case System, Postpositions & Oblique Forms] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[७.१ : कारक की परिभाषा एवं आठों कारकों की रूपरेखा #h(6pt)•#h(6pt) ७.२ : प्रत्यक्ष कारक (Direct) बनाम तिर्यक कारक (Oblique) #h(6pt)•#h(6pt) ७.३ : पुल्लिंग संज्ञाओं का तिर्यक रूपांतरण नियम #h(6pt)•#h(6pt) ७.४ : स्त्रीलिंग संज्ञाओं का तिर्यक रूपांतरण नियम #h(6pt)•#h(6pt) ७.५ : बहुवचन तिर्यक रूप में सर्वव्यापी -ओं प्रत्यय #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[7.1 : Definition & Overview of Eight Hindi Cases #h(6pt)•#h(6pt) 7.2 : Direct Case vs Oblique Case Distinction #h(6pt)•#h(6pt) 7.3 : Oblique Formation of Masculine Nouns #h(6pt)•#h(6pt) 7.4 : Oblique Formation of Feminine Nouns #h(6pt)•#h(6pt) 7.5 : Universal Oblique Plural Marker -on #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
  [#strong[खंड ८] \
  #en-sub[Part 8]],
  [#strong[सर्वनाम-व्यवस्था एवं रूपावली] \
  #en-sub[Pronouns, Declensions & Demonstratives] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[८.१ : सर्वनाम की परिभाषा एवं छह मूलभूत भेद #h(6pt)•#h(6pt) ८.२ : पुरुषवाचक उत्तम पुरुष : मैं, हम की रूपावली #h(6pt)•#h(6pt) ८.३ : पुरुषवाचक मध्यम पुरुष : तू, तुम, आप का मर्यादा भेद #h(6pt)•#h(6pt) ८.४ : पुरुषवाचक अन्य पुरुष : यह, वह, ये, वे #h(6pt)•#h(6pt) ८.५ : सर्वनामों के साथ परसर्ग संयोजन (मुझको/मुझे) #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[8.1 : Definition & Six Categories of Pronouns #h(6pt)•#h(6pt) 8.2 : First Person Pronouns: Main, Hum Declensions #h(6pt)•#h(6pt) 8.3 : Second Person: Tu, Tum, Aap & Politeness Levels #h(6pt)•#h(6pt) 8.4 : Third Person: Yah, Vah, Ye, Ve & Declensions #h(6pt)•#h(6pt) 8.5 : Pronominal Case Forms: Fusion with Postpositions #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
  [#strong[खंड ९] \
  #en-sub[Part 9]],
  [#strong[विशेषण, प्रविशेषण एवं तुलनात्मक अवस्थाएँ] \
  #en-sub[Adjectives, Intensifiers & Comparisons] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[९.१ : विशेषण की परिभाषा, विशेष्य एवं उद्देश्य-विधेय #h(6pt)•#h(6pt) ९.२ : गुणवाचक विशेषण : रूप, रंग, आकार, स्वभाव #h(6pt)•#h(6pt) ९.३ : संख्यावाचक विशेषण : निश्चित एवं अनिश्चित #h(6pt)•#h(6pt) ९.४ : परिमाणवाचक विशेषण : नाप-तौल एवं मात्रा #h(6pt)•#h(6pt) ९.५ : सार्वनामिक (संकेतवाचक) विशेषण का स्वरूप #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[9.1 : Definition, Noun-Modifier & Attributive/Predicative #h(6pt)•#h(6pt) 9.2 : Qualitative Adjectives: Forms, Colors, Qualities #h(6pt)•#h(6pt) 9.3 : Numeral Adjectives: Definite & Indefinite #h(6pt)•#h(6pt) 9.4 : Quantitative Adjectives: Measurement & Mass #h(6pt)•#h(6pt) 9.5 : Demonstrative / Pronominal Adjectives #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
  [#strong[खंड १०] \
  #en-sub[Part 10]],
  [#strong[संख्या-पद्धति, गणना एवं मापन प्रणाली] \
  #en-sub[Numerals, Counting & Measurement Systems] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[१०.१ : देवनागरी अंक (० से ९) एवं अंतर्राष्ट्रीय रूप #h(6pt)•#h(6pt) १०.२ : १ से २० तक की मानक संख्याएँ एवं वर्तनी #h(6pt)•#h(6pt) १०.३ : २१ से ५० तक की संख्याएँ एवं ध्वनि नियम #h(6pt)•#h(6pt) १०.४ : ५१ से १०० तक की मानक देवनागरी संख्याएँ #h(6pt)•#h(6pt) १०.५ : क्रमवाचक संख्याएँ (पहला, दूसरा, तीसरा, चौथा) #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[10.1 : Devanagari Digits (0 to 9) & Arabic Equivalents #h(6pt)•#h(6pt) 10.2 : Cardinal Numerals 1 to 20: Forms & Spellings #h(6pt)•#h(6pt) 10.3 : Cardinal Numerals 21 to 50: Sound Patterns #h(6pt)•#h(6pt) 10.4 : Cardinal Numerals 51 to 100: Standard Forms #h(6pt)•#h(6pt) 10.5 : Ordinal Numbers: First to Tenth & Beyond #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
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
  [#strong[क्रिया-मूल, धातु एवं होना सहायक क्रिया] \
  #en-sub[Verb Roots, Infinitives & Copula Hona] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[११.१ : क्रिया की परिभाषा, धातु एवं ना-प्रत्ययांत मूल रूप #h(6pt)•#h(6pt) ११.२ : मूल धातु के भेद : रूढ़ धातु एवं यौगिक धातु #h(6pt)•#h(6pt) ११.३ : अकर्मक क्रिया : परिभाषा, लक्षण एवं पहचान #h(6pt)•#h(6pt) ११.४ : सकर्मक क्रिया : एककर्मक एवं द्विकर्मक क्रियाएँ #h(6pt)•#h(6pt) ११.५ : अकर्मक से सकर्मक रूपांतरण के प्राथमिक नियम #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[11.1 : Definition of Verb, Dhatu Root & -na Infinitive #h(6pt)•#h(6pt) 11.2 : Root Types: Simple Primitive vs Derived Roots #h(6pt)•#h(6pt) 11.3 : Intransitive Verbs: Definition & Behavior #h(6pt)•#h(6pt) 11.4 : Transitive Verbs: Single & Double Objects #h(6pt)•#h(6pt) 11.5 : Intransitive to Transitive Derivation Rules #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
  [#strong[खंड १२] \
  #en-sub[Part 12]],
  [#strong[वर्तमान काल : सामान्य, अपूर्ण एवं संदिग्ध] \
  #en-sub[Present Tenses: Simple, Continuous & Presumptive] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[१२.१ : सामान्य वर्तमान काल (ता है, ती है, ते हैं) की संरचना #h(6pt)•#h(6pt) १२.२ : नित्य अभ्यास, स्वभाव एवं सार्वभौमिक सत्य कथन #h(6pt)•#h(6pt) १२.३ : सामान्य वर्तमान काल में लिंग एवं वचन समन्वय #h(6pt)•#h(6pt) १२.४ : सामान्य वर्तमान काल में नकारात्मक वाक्य (नहीं करता) #h(6pt)•#h(6pt) १२.५ : सामान्य वर्तमान में प्रश्नवाचक वाक्य रचना #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[12.1 : Simple / Habitual Present: Structure & Formation #h(6pt)•#h(6pt) 12.2 : Expressing Habits, Routines & Universal Truths #h(6pt)•#h(6pt) 12.3 : Gender & Number Agreement in Habitual Present #h(6pt)•#h(6pt) 12.4 : Negation in Simple Present (Omission of Copula) #h(6pt)•#h(6pt) 12.5 : Interrogative Sentences in Simple Present #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
  [#strong[खंड १३] \
  #en-sub[Part 13]],
  [#strong[भूतकाल : सामान्य, आसन्न, पूर्ण एवं संदिग्ध] \
  #en-sub[Past Tenses: Simple, Immediate, Perfect & Habitual] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[१३.१ : सामान्य भूतकाल की संरचना (आ, ई, ए, ईं प्रत्यय) #h(6pt)•#h(6pt) १३.२ : अकर्मक क्रियाओं का सामान्य भूतकाल में प्रयोग #h(6pt)•#h(6pt) १३.३ : अनियमित भूतकालिक रूप (गया, किया, दिया, लिया, हुआ) #h(6pt)•#h(6pt) १३.४ : आसन्न भूतकाल (Immediate Past) की संरचना #h(6pt)•#h(6pt) १३.५ : पूर्ण भूतकाल (था, थी, थे, थीं) का प्रामाणिक प्रयोग #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[13.1 : Simple Past Formation (Root + aa, ee, e, een) #h(6pt)•#h(6pt) 13.2 : Intransitive Verbs in Simple Past #h(6pt)•#h(6pt) 13.3 : Irregular Past Participles (Gaya, Kiya, Diya, Liya) #h(6pt)•#h(6pt) 13.4 : Immediate Past Tense: Formation & Semantics #h(6pt)•#h(6pt) 13.5 : Past Perfect Tense: Formation with Tha/Thee #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
  [#strong[खंड १४] \
  #en-sub[Part 14]],
  [#strong[ने परसर्ग नियम एवं सकर्मक भूतकाल] \
  #en-sub[Ergative Ne Rule & Transitive Past Syntax] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[१४.१ : ने परसर्ग (Ergative Case) की ऐतिहासिक पृष्ठभूमि #h(6pt)•#h(6pt) १४.२ : ने प्रयोग का सार्वभौमिक सूत्र : सकर्मक भूतकालिक कृदंत #h(6pt)•#h(6pt) १४.३ : कर्ता के साथ ने आने पर क्रिया का कर्म-अधीन होना #h(6pt)•#h(6pt) १४.४ : कर्म के साथ को आने पर क्रिया का भावे रूप (तटस्थ पुल्लिंग) #h(6pt)•#h(6pt) १४.५ : अपवाद धातुएँ : बोलना, भूलना, लाना, समझना #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[14.1 : Historical & Typological Context of Ergativity #h(6pt)•#h(6pt) 14.2 : Universal Condition: Transitive Perfective Aspects #h(6pt)•#h(6pt) 14.3 : Object Agreement: Verb Agreeing with Direct Object #h(6pt)•#h(6pt) 14.4 : Neutral Agreement: Ne + Ko resulting in Masculine Singular #h(6pt)•#h(6pt) 14.5 : Exceptional Verbs Taking No Ne (Bolna, Bhoolna, Laana) #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
  [#strong[खंड १५] \
  #en-sub[Part 15]],
  [#strong[भविष्यत् काल, आज्ञार्थ एवं विध्यर्थ] \
  #en-sub[Future Tenses, Imperatives & Optatives] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[१५.१ : सामान्य भविष्यत् काल (गा, गी, गे) की संरचना #h(6pt)•#h(6pt) १५.२ : सामान्य भविष्यत् में उत्तम, मध्यम व अन्य पुरुष रूप #h(6pt)•#h(6pt) १५.३ : भविष्यत् काल में लिंग एवं वचन समन्वय #h(6pt)•#h(6pt) १५.४ : अपूर्ण भविष्यत् काल (कर रहा होगा) #h(6pt)•#h(6pt) १५.५ : पूर्ण भविष्यत् काल (कर चुका होगा, कर लिया होगा) #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[15.1 : Simple Future Formation: Root + e/o/oon + gaa/gee/ge #h(6pt)•#h(6pt) 15.2 : Future Conjugation Across 1st, 2nd, 3rd Persons #h(6pt)•#h(6pt) 15.3 : Gender & Number Concord in Future Tense #h(6pt)•#h(6pt) 15.4 : Future Continuous Tense: Kar Raha Hoga #h(6pt)•#h(6pt) 15.5 : Future Perfect Tense: Kar Liya Hoga #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
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
  [#strong[संयुक्त क्रियाएँ एवं रंजक धातु व्यवस्था] \
  #en-sub[Compound Verbs & Explicators] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[१६.१ : संयुक्त क्रिया की परिभाषा एवं संरचना (मुख्य + रंजक) #h(6pt)•#h(6pt) १६.२ : रंजक धातु जाना : पूर्णता, परिवर्तन एवं विदा #h(6pt)•#h(6pt) १६.३ : रंजक धातु लेना : स्व-लाभ, अंतर्मुखी फल #h(6pt)•#h(6pt) १६.४ : रंजक धातु देना : बहिर्मुखी फल, परोपकार #h(6pt)•#h(6pt) १६.५ : रंजक धातु पड़ना : आकस्मिकता, अनिवार्यता #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[16.1 : Compound Verb Concept: Main Stem + Explicator #h(6pt)•#h(6pt) 16.2 : Explicator Jana: Completion, Transition, Loss #h(6pt)•#h(6pt) 16.3 : Explicator Lena: Self-Benefactive Actions #h(6pt)•#h(6pt) 16.4 : Explicator Dena: Other-Benefactive Actions #h(6pt)•#h(6pt) 16.5 : Explicator Padna: Suddenness, Involuntariness #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
  [#strong[खंड १७] \
  #en-sub[Part 17]],
  [#strong[प्रेरणार्थक क्रियाएँ एवं प्रक्रियात्मक रचना] \
  #en-sub[Causative Verbs & Derivations] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[१७.१ : प्रेरणार्थक क्रिया की संकल्पना एवं प्रयोजन #h(6pt)•#h(6pt) १७.२ : मूल धातु, प्रथम प्रेरणार्थक एवं द्वितीय प्रेरणार्थक #h(6pt)•#h(6pt) १७.३ : प्रथम प्रेरणार्थक : प्रत्यक्ष प्रेरणा (-आना प्रत्यय) #h(6pt)•#h(6pt) १७.४ : द्वितीय प्रेरणार्थक : मध्यस्थ प्रेरणा (-वाना प्रत्यय) #h(6pt)•#h(6pt) १७.५ : आकारान्त, ईकारान्त धातुओं में ह्रस्वीकरण नियम #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[17.1 : Causative Verbs Concept & Pragmatics #h(6pt)•#h(6pt) 17.2 : Base Verb, First Causative & Second Causative #h(6pt)•#h(6pt) 17.3 : First Causative: Direct Causation (-aana suffix) #h(6pt)•#h(6pt) 17.4 : Second Causative: Mediated Causation (-vaana suffix) #h(6pt)•#h(6pt) 17.5 : Vowel Shortening Rules in Causative Stems #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
  [#strong[खंड १८] \
  #en-sub[Part 18]],
  [#strong[पक्ष, वृत्ति एवं विवशतापरक संरचनाएँ] \
  #en-sub[Verbal Aspects, Modality & Obligation] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[१८.१ : क्रिया-पक्ष (Aspect) की संकल्पना : सातत्य, अभ्यास, पूर्णता #h(6pt)•#h(6pt) १८.२ : सातत्यबोधक पक्ष : धातु + रहना (पढ़ता रहता है) #h(6pt)•#h(6pt) १८.३ : प्रगतिबोधक पक्ष : धातु + जाना (बढ़ता जाता है) #h(6pt)•#h(6pt) १८.४ : अभ्यासपरक पक्ष : भूतकालिक कृदंत + करना (लिखा करना) #h(6pt)•#h(6pt) १८.५ : आरंभबोधक पक्ष : तिर्यक क्रियार्थक + लगना (हँसने लगा) #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[18.1 : Aspectual Systems: Continuative, Habitual, Perfective #h(6pt)•#h(6pt) 18.2 : Continuative Aspect: Stem + Ta Rahna #h(6pt)•#h(6pt) 18.3 : Progressive Incremental Aspect: Stem + Ta Jana #h(6pt)•#h(6pt) 18.4 : Frequentative Aspect: Past Participle + Karna #h(6pt)•#h(6pt) 18.5 : Inceptive Aspect: Oblique Infinitive + Lagna #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
  [#strong[खंड १९] \
  #en-sub[Part 19]],
  [#strong[कृदंत, पूर्वकालिक क्रिया एवं क्रिया-विशेषण] \
  #en-sub[Participles, Absolutives & Adverbs] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[१९.१ : कृदंत की संकल्पना : धातु से बने विशेषण व संज्ञा #h(6pt)•#h(6pt) १९.२ : वर्तमानकालिक कृदंत (-ता हुआ, -ती हुई, -ते हुए) #h(6pt)•#h(6pt) १९.३ : भूतकालिक कृदंत (-आ हुआ, -ई हुई, -ए हुए) #h(6pt)•#h(6pt) १९.४ : कृदंतों का विशेषण के रूप में संज्ञा के साथ समन्वय #h(6pt)•#h(6pt) १९.५ : कृदंतों का क्रिया-विशेषण के रूप में अविकारी प्रयोग #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[19.1 : Concept of Participles (Kridanta Formations) #h(6pt)•#h(6pt) 19.2 : Present / Imperfective Participles (-ta hua) #h(6pt)•#h(6pt) 19.3 : Past / Perfective Participles (-aa hua) #h(6pt)•#h(6pt) 19.4 : Participles Functioning as Attributive Modifiers #h(6pt)•#h(6pt) 19.5 : Participles Functioning as Adverbs of Manner #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
  [#strong[खंड २०] \
  #en-sub[Part 20]],
  [#strong[वाच्य-विधान : कर्तृवाच्य, कर्मवाच्य व भाववाच्य] \
  #en-sub[Voice: Active, Passive & Impersonal] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[२०.१ : वाच्य की परिभाषा एवं तीन व्याकरणिक भेद #h(6pt)•#h(6pt) २०.२ : कर्तृवाच्य : कर्ता की प्रधानता एवं अन्वय नियम #h(6pt)•#h(6pt) २०.३ : कर्मवाच्य की संरचना : भूतकालिक कृदंत + जाना #h(6pt)•#h(6pt) २०.४ : कर्मवाच्य में कर्ता के साथ के द्वारा / से परसर्ग #h(6pt)•#h(6pt) २०.५ : कर्मवाच्य में क्रिया का कर्म के लिंग-वचन अनुसार होना #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[20.1 : Definition of Voice & Three Grammatical Forms #h(6pt)•#h(6pt) 20.2 : Active Voice: Subject Prominence & Concord #h(6pt)•#h(6pt) 20.3 : Passive Voice: Perfective Participle + Jana #h(6pt)•#h(6pt) 20.4 : Passive Agent Marking with Ke Dwara or Se #h(6pt)•#h(6pt) 20.5 : Verb Agreeing with Patient / Direct Object #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
)

#pagebreak()

// PAGE 7: खंड २१ से २५
#v(2pt)
#text(size: 16pt, weight: "bold")[विषय-सूची : भाग ५] \
#en-sub[Table of Contents : Parts 21 to 25]
#v(6pt)

#table(
  columns: (60pt, 1fr),
  align: (center + top, left + top),
  [*खंड* \ #en-sub[Part]], [*शीर्षक, अनुभाग एवं विषय* \ #en-sub[Title, Sections & Topics]],
  [#strong[खंड २१] \
  #en-sub[Part 21]],
  [#strong[वाक्य-रचना, भेद एवं अव्यय संयोजन] \
  #en-sub[Sentence Syntax, Conjunctions & Modifiers] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[२१.१ : वाक्य की परिभाषा, उद्देश्य एवं विधेय का स्वरूप #h(6pt)•#h(6pt) २१.२ : हिंदी पदक्रम (SOV) : कर्ता-कर्म-क्रिया का मौलिक नियम #h(6pt)•#h(6pt) २१.३ : पदक्रम में विशेषण, क्रिया-विशेषण एवं परसर्गों का स्थान #h(6pt)•#h(6pt) २१.४ : अर्थ के आधार पर वाक्य भेद (विधान, निषेध, प्रश्न, आज्ञा) #h(6pt)•#h(6pt) २१.५ : इच्छावाचक, संदेहवाचक, विस्मयवाचक एवं संकेतवाचक #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[21.1 : Sentence Anatomy: Subject (Uddeshya) & Predicate (Vidheya) #h(6pt)•#h(6pt) 21.2 : Word Order: Subject-Object-Verb (SOV) Architecture #h(6pt)•#h(6pt) 21.3 : Placement of Modifiers, Adverbs & Postpositions #h(6pt)•#h(6pt) 21.4 : Functional Sentence Types: Declarative, Negative, Interrogative #h(6pt)•#h(6pt) 21.5 : Optative, Dubitative, Exclamatory, Conditional #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
  [#strong[खंड २२] \
  #en-sub[Part 22]],
  [#strong[उपवाक्य, संबंधपरक रचना एवं नित्य-संबंधी] \
  #en-sub[Relative Clauses & Correlative Constructions] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[२२.१ : संबंधपरक-नित्यसंबंधी (Relative-Correlative) संरचना #h(6pt)•#h(6pt) २२.२ : व्यक्ति-संकेत : जो...वह / जिसने...उसने का नियम #h(6pt)•#h(6pt) २२.३ : वस्तु-संकेत : जो...वह / जिसमें...उसमें का नियम #h(6pt)•#h(6pt) २२.४ : स्थान-संकेत : जहाँ...वहाँ / जिधर...उधर #h(6pt)•#h(6pt) २२.५ : काल-संकेत : जब...तब / जिस समय...उस समय #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[22.1 : Relative-Correlative Syntactic Architecture #h(6pt)•#h(6pt) 22.2 : Personal Relatives: Jo...Vah / Jisine...Usne #h(6pt)•#h(6pt) 22.3 : Inanimate Relatives: Direct & Oblique Concord #h(6pt)•#h(6pt) 22.4 : Spatial Relatives: Jahaan...Vahaan / Jidhar...Udhar #h(6pt)•#h(6pt) 22.5 : Temporal Relatives: Jab...Tab / Jis Samay...Us Samay #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
  [#strong[खंड २३] \
  #en-sub[Part 23]],
  [#strong[दैनिक जीवन, शिष्टाचार एवं सामाजिक संवाद] \
  #en-sub[Daily Life, Social Etiquette & Greetings] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[२३.१ : पारंपरिक अभिवादन : नमस्ते, नमस्कार, प्रणाम, चरण स्पर्श #h(6pt)•#h(6pt) २३.२ : विविध अभिवादन : आदाब, सलाम, सत श्री अकाल #h(6pt)•#h(6pt) २३.३ : कुशल-क्षेम पूछना : आप कैसे हैं? क्या हाल-चाल है? #h(6pt)•#h(6pt) २३.४ : आत्म-परिचय देना : नाम, व्यवसाय, निवास एवं रुचि #h(6pt)•#h(6pt) २३.५ : दूसरों का परिचय कराना : औपचारिक व अनौपचारिक संदर्भ #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[23.1 : Traditional Greetings: Namaste, Namaskar, Pranam #h(6pt)•#h(6pt) 23.2 : Multi-Cultural Greetings: Aadaab, Sat Sri Akal #h(6pt)•#h(6pt) 23.3 : Inquiring Wellbeing: Aap Kaise Hain? Kya Haal Hai? #h(6pt)•#h(6pt) 23.4 : Self-Introduction: Name, Profession, Hometown, Hobbies #h(6pt)•#h(6pt) 23.5 : Introducing Others: Formal & Informal Introductions #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
  [#strong[खंड २४] \
  #en-sub[Part 24]],
  [#strong[उपयोगिता, सेवाएँ, यात्रा एवं जन-संवाद] \
  #en-sub[Public Utilities, Travel & Essential Services] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[२४.१ : बाज़ार एवं हाट में क्रय-विक्रय : भाव-ताव, मोल-भाव #h(6pt)•#h(6pt) २४.२ : फल, सब्ज़ी एवं किराना दुकान पर व्यावहारिक संवाद #h(6pt)•#h(6pt) २४.३ : वस्त्रालय एवं दर्ज़ी की दुकान पर माप व पसंद कथन #h(6pt)•#h(6pt) २४.४ : रेस्टोरेंट एवं भोजनालय में ऑर्डर, बिल भुगतान #h(6pt)•#h(6pt) २४.५ : रास्ता एवं दिशा पूछना : दाएँ, बाएँ, सीधे, चौराहा, नुक्कड़ #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[24.1 : Marketplace & Shopping: Bargaining & Inquiring Prices #h(6pt)•#h(6pt) 24.2 : Grocery, Fruit & Vegetable Vendor Conversations #h(6pt)•#h(6pt) 24.3 : Clothing Store & Tailor: Sizing, Fabrics, Alterations #h(6pt)•#h(6pt) 24.4 : Restaurant & Cafe: Ordering, Menu Queries, Settling Bill #h(6pt)•#h(6pt) 24.5 : Asking & Giving Directions: Right, Left, Straight, Roundabout #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
  [#strong[खंड २५] \
  #en-sub[Part 25]],
  [#strong[प्रयोजनमूलक एवं कार्यालयीन प्रशासनिक हिंदी] \
  #en-sub[Official Language Policy & Administrative Idiom] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[२५.१ : प्रयोजनमूलक हिंदी की संकल्पना, स्वरूप एवं क्षेत्र #h(6pt)•#h(6pt) २५.२ : संवैधानिक प्रावधान : अनुच्छेद ३४३ से ३५१ तक का विश्लेषण #h(6pt)•#h(6pt) २५.३ : राजभाषा अधिनियम १९६३ (यथा संशोधित १९६७) के प्रमुख उपबंध #h(6pt)•#h(6pt) २५.४ : राजभाषा नियम १९७६ एवं भारत के तीन भाषाई क्षेत्र (क, ख, ग) #h(6pt)•#h(6pt) २५.५ : वार्षिक कार्यक्रम, कार्यान्वयन समितियाँ (राभाकास / नगर) #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[25.1 : Functional Hindi: Concept, Scope & Linguistic Features #h(6pt)•#h(6pt) 25.2 : Constitutional Provisions: Articles 343 to 351 #h(6pt)•#h(6pt) 25.3 : Official Languages Act 1963 (As Amended 1967) #h(6pt)•#h(6pt) 25.4 : Official Language Rules 1976: Regions A, B, C #h(6pt)•#h(6pt) 25.5 : Annual Programme, Implementation Committees (OLIC/TOLIC) #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
)

#pagebreak()

// PAGE 8: खंड २६ से ३०
#v(2pt)
#text(size: 16pt, weight: "bold")[विषय-सूची : भाग ६] \
#en-sub[Table of Contents : Parts 26 to 30]
#v(6pt)

#table(
  columns: (60pt, 1fr),
  align: (center + top, left + top),
  [*खंड* \ #en-sub[Part]], [*शीर्षक, अनुभाग एवं विषय* \ #en-sub[Title, Sections & Topics]],
  [#strong[खंड २६] \
  #en-sub[Part 26]],
  [#strong[टिप्पण, आलेखन एवं प्रारूपण पद्धति] \
  #en-sub[Noting, Drafting & Official Formats] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[२६.१ : टिप्पण (Noting) की परिभाषा, उद्देश्य एवं कार्यप्रणाली #h(6pt)•#h(6pt) २६.२ : टिप्पण के प्रकार : नेमी (Routine) एवं सूक्ष्म टिप्पण #h(6pt)•#h(6pt) २६.३ : विस्तृत विचाराधीन टिप्पण (Deliberative/Substantive Note) #h(6pt)•#h(6pt) २६.४ : आवती पर आधारित टिप्पण (Note on Current Receipts) #h(6pt)•#h(6pt) २६.५ : स्वतः पूर्ण टिप्पण लेखन पद्धति एवं मानक चरण #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[26.1 : Definition, Purpose & Mechanics of Official Noting #h(6pt)•#h(6pt) 26.2 : Types of Notes: Routine Notes & Minute Sheets #h(6pt)•#h(6pt) 26.3 : Comprehensive Substantive / Self-Contained Notes #h(6pt)•#h(6pt) 26.4 : Notes Initiated on Receipts (Dak) #h(6pt)•#h(6pt) 26.5 : Drafting Self-Contained Notes: Facts, Rules, Decision #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
  [#strong[खंड २७] \
  #en-sub[Part 27]],
  [#strong[बैंकिंग, वाणिज्यिक एवं वित्तीय कार्य-प्रणाली] \
  #en-sub[Commercial Banking, Operations & Financial Terms] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[२७.१ : भारतीय बैंकिंग संरचना एवं राष्ट्रीयकृत बैंकों की भूमिका #h(6pt)•#h(6pt) २७.२ : बैंक की माध्यम भाषा एवं राजभाषा नीति कार्यान्वयन #h(6pt)•#h(6pt) २७.३ : बैंक खाता संचालन : बचत, चालू एवं सावधि जमा (FD/RD) #h(6pt)•#h(6pt) २७.४ : खाता खोलना, ग्राहक परिचय (KYC) एवं नामांकन (Nomination) #h(6pt)•#h(6pt) २७.५ : चेक, ड्राफ्ट, भुगतान आदेश एवं समाशोधन (Clearing) #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[27.1 : Indian Banking Architecture & Nationalized Banks #h(6pt)•#h(6pt) 27.2 : Bank Working Language & Official Language Compliance #h(6pt)•#h(6pt) 27.3 : Account Operations: Savings, Current, Term Deposits #h(6pt)•#h(6pt) 27.4 : Opening Accounts, KYC Norms & Nomination Procedures #h(6pt)•#h(6pt) 27.5 : Cheques, Drafts, Pay Orders & CTS Clearing Operations #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
  [#strong[खंड २८] \
  #en-sub[Part 28]],
  [#strong[कंप्यूटर, यूनिकोड एवं इनस्क्रिप्ट टंकण] \
  #en-sub[Computing, Unicode & InScript Touch Typing] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[२८.१ : कंप्यूटर की आधारभूत संरचना एवं हिंदी कम्प्यूटिंग #h(6pt)•#h(6pt) २८.२ : शब्द संसाधन (Word Processing) की मूलभूत संकल्पनाएँ #h(6pt)•#h(6pt) २८.३ : यूनिकोड (Unicode) क्या है : इतिहास, मानक एवं आवश्यकता #h(6pt)•#h(6pt) २८.४ : रेगेसी फॉन्ट (कृतिदेव/चाणक्य) बनाम यूनिकोड फॉन्ट (मंगल) #h(6pt)•#h(6pt) २८.५ : विंडोज़ 10 एवं 11 में हिंदी भाषा व इनपुट सक्रिय करना #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[28.1 : Fundamentals of Computing & Hindi IT Architecture #h(6pt)•#h(6pt) 28.2 : Core Concepts of Word Processing in Indian Languages #h(6pt)•#h(6pt) 28.3 : What is Unicode: History, Standard UTF-8/UTF-16 & Need #h(6pt)•#h(6pt) 28.4 : Legacy ASCII Fonts (KrutiDev) vs Unicode OpenType (Mangal) #h(6pt)•#h(6pt) 28.5 : Enabling Hindi Language & Input in Windows 10/11 #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
  [#strong[खंड २९] \
  #en-sub[Part 29]],
  [#strong[अनुवाद-सिद्धांत, मुहावरे एवं मानक वर्तनी] \
  #en-sub[Translation Theory, Idioms & Orthography] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[२९.१ : अनुवाद की संकल्पना, प्रकृति, आवश्यकता एवं महत्व #h(6pt)•#h(6pt) २९.२ : अनुवाद के प्रकार : शब्दानुवाद, भावानुवाद, रूपांतरण #h(6pt)•#h(6pt) २९.३ : अनुवाद प्रक्रिया के तीन सोपान : बोधन, अंतरण, पुनरीक्षण #h(6pt)•#h(6pt) २९.४ : स्रोत भाषा (SL) एवं लक्ष्य भाषा (TL) की संरचनात्मक भिन्नता #h(6pt)•#h(6pt) २९.५ : अंग्रेज़ी से हिंदी अनुवाद में पदक्रम एवं काल की समस्याएँ #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[29.1 : Translation: Concept, Nature, Need & Significance #h(6pt)•#h(6pt) 29.2 : Types: Literal, Free, Communicative, Adaptation #h(6pt)•#h(6pt) 29.3 : Three Stages of Translation: Analysis, Transfer, Restructuring #h(6pt)•#h(6pt) 29.4 : Structural Contrasts between Source & Target Languages #h(6pt)•#h(6pt) 29.5 : Syntactic Divergence & Tense Alignments (Eng to Hin) #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
  [#strong[खंड ३०] \
  #en-sub[Part 30]],
  [#strong[गद्य-पाठमाला, संस्कृति एवं वृहद् शब्दकोश] \
  #en-sub[Literary Readings, Cultural Heritage & Master Lexicon] \
  #v(1.5pt)
  #text(size: 7.2pt, fill: rgb("#333333"))[३०.१ : भारतीय संस्कृति एवं पर्व : दीपोत्सव, होली, ईद, पोंगल, बिहू #h(6pt)•#h(6pt) ३०.२ : प्रकृति एवं पर्यावरण संरक्षण : ऋतु-चक्र, नदियाँ, हिमालय #h(6pt)•#h(6pt) ३०.३ : ऐतिहासिक धरोहर एवं पर्यटन : दिल्ली, जयपुर, आगरा, केरल #h(6pt)•#h(6pt) ३०.४ : महात्मा गांधी एवं राष्ट्रभाषा विचार (गद्य पाठ) #h(6pt)•#h(6pt) ३०.५ : स्वामी विवेकानंद का प्रेरक जीवन-संदेश (गद्य पाठ) #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]] \
  #v(0.5pt)
  #text(size: 6.4pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[30.1 : Festivals & Heritage: Deepavali, Holi, Eid, Pongal, Bihu #h(6pt)•#h(6pt) 30.2 : Nature & Ecology: Seasons, Sacred Rivers, Himalayas #h(6pt)•#h(6pt) 30.3 : Monuments & Heritage Tourism: Delhi, Jaipur, Kerala #h(6pt)•#h(6pt) 30.4 : Mahatma Gandhi & the National Language Movement #h(6pt)•#h(6pt) 30.5 : Swami Vivekananda's Life & Universal Vision #h(6pt)•#h(6pt) [and 20 comprehensive sections]]],
)

#pagebreak()
// --- PAGE 9: खंड १ ---
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
