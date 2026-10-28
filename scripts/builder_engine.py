import os
import sys

def build_batch(part_num, part_title, part_subtitle, sections_data):
    p_str = f"{part_num:02d}"
    print(f"Building Batch {part_num} (Part {part_num}: {part_title})...")
    
    for s_idx, d in enumerate(sections_data, start=1):
        s_str = f"{s_idx:02d}"
        sec_id = f"sec-{p_str}-{s_str}"
        
        table_header_str = " | ".join(d["table_headers"])
        table_sep_str = " | ".join([":---"] * len(d["table_headers"]))
        table_rows_str = "\n".join(["| " + " | ".join(row) + " |" for row in d["table_rows"]])
        
        content = f"""# {d['title']}
## {d['subtitle']}

**अनुभाग कोड:** `{sec_id}` | **भाग {part_num}: {part_title}** | **खण्ड: {s_str}/२०**

---

### विषय-प्रवेश एवं सैद्धांतिक अवलोकन
{d['desc']}

---

### व्याकरणिक विश्लेषण एवं नियम-निरूपण
{d['analysis']}

---

### प्रामाणिक संदर्भ तालिका एवं रूपावली
| {table_header_str} |
| {table_sep_str} |
{table_rows_str}

---

### ध्वनि-विज्ञान एवं उच्चारण संबंधी सूक्ष्मताएँ (Phonetic Insights)
1. **स्वराघात एवं लय (Stress & Cadence)**: क्रिया रूपों के उच्चारण में अंतिम स्वर पर स्वाभाविक आरोह-अवरोह और वाक्यीय लय का विशेष महत्त्व है।
2. **अनुनासिकता की यथार्थता**: बहुवचन सहायक क्रियाओं ('हैं', 'थीं', 'होंगे') में नासिक्य विवर का पूर्ण उपयोग अर्थ और व्याकरण को शुद्ध रखता है।
3. **हलन्त एवं स्फोट**: क्रिया धातुओं के अंतिम व्यंजन का उच्चारण स्पष्ट होना चाहिए ताकि धातु और प्रत्यय का संधि-स्थल भ्रमित न हो।

---

### कक्षा-अभ्यास एवं मूल्यांकन कार्य (Drills & Assessment)
**अभ्यास निर्देश**: {d['drill']}

1. **रूपांतरण अभ्यास**: दिए गए नियमों के आधार पर ५ नवीन क्रिया रूपों की रचना कर वाक्य प्रयोग करें।
2. **अन्विति दोष शोधन**: लिंग, वचन और पुरुष के अनुसार क्रिया के त्रुटिपूर्ण रूपों को सुधारें।
3. **संवादात्मक प्रयोग**: दैनिक जीवन की बातचीत में लक्षित व्याकरणिक संरचनाओं का सस्वर अभ्यास करें।

---

### पॉडकास्ट वाचन आलेख (Studio Audio Script)
> **वाचक स्वर (Podcast Anchor)**:
> "{d['script']}"
"""
        with open(f"md/{sec_id}.md", "w", encoding="utf-8") as f:
            f.write(content)
        
    print(f"Batch {part_num} complete: 20 sections written to md/sec-{p_str}-*.md")

