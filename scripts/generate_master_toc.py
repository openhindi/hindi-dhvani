# -*- coding: utf-8 -*-
"""Master assembler and generator for Table of Contents in Markdown and Typst."""

import os
import sys

# Add scripts directory to path
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from curriculum_tier1 import TIER_1
from curriculum_tier2 import TIER_2
from curriculum_tier3a import TIER_3A
from curriculum_tier3b import TIER_3B
from curriculum_tier4 import TIER_4
from curriculum_tier5 import TIER_5
from curriculum_tier6 import TIER_6

ALL_PARTS = TIER_1 + TIER_2 + TIER_3A + TIER_3B + TIER_4 + TIER_5 + TIER_6

DEV_NUMERALS = ["०", "१", "२", "३", "४", "५", "६", "७", "८", "९"]

def to_dev_num(n):
    return "".join(DEV_NUMERALS[int(d)] for d in str(n))

def validate():
    print(f"Total parts loaded: {len(ALL_PARTS)}")
    assert len(ALL_PARTS) == 30, f"Expected 30 parts, got {len(ALL_PARTS)}"
    for idx, (p_num, p_dev, p_en, secs) in enumerate(ALL_PARTS):
        assert p_num == idx + 1, f"Part number mismatch at index {idx}: {p_num}"
        assert len(secs) == 20, f"Part {p_num} ({p_dev}) does not have 20 sections, has {len(secs)}"
    total_sections = sum(len(s) for _, _, _, s in ALL_PARTS)
    print(f"Total sections loaded: {total_sections} (30 parts * 20 sections = 600 sections)")
    print("Validation passed successfully!")

def generate_markdown_master_parts(output_path):
    """Generates a summary markdown table of just the 30 parts."""
    lines = []
    lines.append("# मानक हिंदी पुस्तक : ३० खंडों का विहंगावलोकन")
    lines.append("*Master Table of Contents : 30 Parts Overview*")
    lines.append("")
    lines.append("---")
    lines.append("")
    lines.append("| खंड (Part) | शीर्षक (Hindi Title) | English Title | कुल अनुभाग (Sections) |")
    lines.append("| :---: | :--- | :--- | :---: |")
    for p_num, p_dev, p_en, secs in ALL_PARTS:
        lines.append(f"| **खंड {to_dev_num(p_num)}** ({p_num}) | {p_dev} | {p_en} | २० (20) |")
    lines.append("")
    content = "\n".join(lines)
    with open(output_path, "w", encoding="utf-8") as f:
        f.write(content)
    print(f"Generated Master Parts Markdown at: {output_path}")

def generate_markdown_toc(output_path):
    """Generates the full comprehensive 30-part, 600-section markdown file."""
    lines = []
    lines.append("# मानक हिंदी पुस्तक : संपूर्ण पाठ्यक्रम एवं विषय-सूची")
    lines.append("*Comprehensive 30-Part, 600-Section Master Curriculum & Table of Contents*")
    lines.append("")
    lines.append("---")
    lines.append("")
    lines.append("> **संरचना निर्देश (Architectural Overview)**:")
    lines.append("> यह बृहद् पाठ्यक्रम भारत सरकार के केंद्रीय हिंदी प्रशिक्षण संस्थान (राजभाषा विभाग), प्रामाणिक पाठमालाओं (प्रबोध, प्रवीण, पारंगत, बैंकिंग प्रज्ञा), मानक व्याकरण एवं इनस्क्रिप्ट टंकण संदर्शिकाओं के आधार पर ३० सुसंबद्ध खंडों (Parts) एवं ६०० विशिष्ट अनुभागों (Sections) में संरचित किया गया है। प्रत्येक खंड में यथार्थतः २० अनुभाग हैं।")
    lines.append("")
    lines.append("---")
    lines.append("")
    lines.append("## ३० खंडों का संक्षिप्त विहंगावलोकन (Master Parts Overview)")
    lines.append("")
    lines.append("| खंड (Part) | शीर्षक (Hindi Title) | English Title |")
    lines.append("| :---: | :--- | :--- |")
    for p_num, p_dev, p_en, _ in ALL_PARTS:
        lines.append(f"| **खंड {to_dev_num(p_num)}** ({p_num}) | {p_dev} | {p_en} |")
    lines.append("")
    lines.append("---")
    lines.append("")

    for p_num, p_dev, p_en, secs in ALL_PARTS:
        lines.append(f"## खंड {to_dev_num(p_num)} : {p_dev}")
        lines.append(f"**Part {p_num} : {p_en}**")
        lines.append("")
        lines.append("| अनुभाग (Section) | शीर्षक (Hindi Topic) | English Description |")
        lines.append("| :---: | :--- | :--- |")
        for s_dev_num, s_dev_title, s_en_num, s_en_title in secs:
            lines.append(f"| **{s_dev_num}** ({s_en_num}) | {s_dev_title} | {s_en_title} |")
        lines.append("")
        lines.append("---")
        lines.append("")

    content = "\n".join(lines)
    with open(output_path, "w", encoding="utf-8") as f:
        f.write(content)
    print(f"Generated Markdown TOC at: {output_path}")

def generate_typst_master_parts_block():
    """Generates the front-matter 2 pages of 30 parts in Typst (15 parts per page)."""
    pages = []
    
    # Page 1 of TOC: Parts 1 to 15
    # Page 2 of TOC: Parts 16 to 30
    for page_idx in range(2):
        start_part = page_idx * 15
        end_part = start_part + 15
        current_parts = ALL_PARTS[start_part:end_part]
        p_start_num = start_part + 1
        p_end_num = end_part

        p_lines = []
        p_lines.append(f"// --- PAGE {page_idx + 3}: विषय-सूची (खंड {to_dev_num(p_start_num)} से {to_dev_num(p_end_num)}) ---")
        p_lines.append("#v(2pt)")
        p_lines.append(f'#text(size: 16pt, weight: "bold")[विषय-सूची : भाग {to_dev_num(page_idx + 1)}] \\')
        p_lines.append(f"#en-sub[Table of Contents : Parts {p_start_num} to {p_end_num}]")
        p_lines.append("#v(4pt)")
        p_lines.append("")
        p_lines.append("#table(")
        p_lines.append("  columns: (54pt, 1fr),")
        p_lines.append("  inset: (x: 5pt, y: 5.2pt),")
        p_lines.append("  align: (center + horizon, left + horizon),")
        p_lines.append('  [*खंड* \\ #en-sub[Part]], [*शीर्षक एवं विषय-वस्तु* \\ #en-sub[Title & Scope of Part]],')

        for p_num, p_dev, p_en, _ in current_parts:
            p_lines.append(f'  [#strong[खंड {to_dev_num(p_num)}] \\')
            p_lines.append(f'  #en-sub[Part {p_num}]],')
            p_lines.append(f'  [#strong[{p_dev}] \\')
            p_lines.append(f'  #en-sub[{p_en}]],')

        p_lines.append(")")
        p_lines.append("")
        p_lines.append("#pagebreak()")
        p_lines.append("")
        pages.append("\n".join(p_lines))

    return "\n".join(pages)

def generate_typst_part_opener_page(part_num, overview_hi="", overview_en=""):
    """Generates the dedicated Part Opener page containing the complete 20-section directory table fitting on exactly 1 page."""
    part_data = ALL_PARTS[part_num - 1]
    p_num, p_dev, p_en, secs = part_data

    lines = []
    lines.append(f"// --- खंड {to_dev_num(p_num)} : मुखपृष्ठ एवं अनुभाग-सूची (Part {p_num} Opener) ---")
    lines.append(f'#text(size: 14pt, weight: "bold")[खंड {to_dev_num(p_num)} : {p_dev}] \\')
    lines.append(f'#text(size: 9.0pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Part {p_num} : {p_en}]')
    lines.append("#v(1.5pt)")
    lines.append('#line(length: 100%, stroke: 0.5pt + rgb("#000000"))')
    lines.append("#v(1.5pt)")
    
    if overview_hi and overview_en:
        lines.append(f'#text(size: 8.5pt)[{overview_hi}] \\')
        lines.append(f'#text(size: 7.5pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[{overview_en}]')
        lines.append("#v(1.5pt)")

    lines.append('#text(size: 9.5pt, weight: "bold")[अनुभाग सूची] #h(6pt) #text(size: 8.0pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Section Directory (20 Sections)]')
    lines.append("#v(0.5pt)")
    lines.append("#table(")
    lines.append("  columns: (38pt, 1fr),")
    lines.append("  inset: (x: 4pt, y: 3.3pt),")
    lines.append("  align: (center + horizon, left + horizon),")
    lines.append('  [*अनुभाग* \\ #text(size: 6.8pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Sec]], [*अनुभाग शीर्षक एवं अध्ययन विषय* \\ #text(size: 6.8pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[Section Title & Scope]],')

    for s_dev_num, s_dev_title, s_en_num, s_en_title in secs:
        lines.append(f'  [#text(size: 7.8pt, weight: "bold")[{s_dev_num}] \\')
        lines.append(f'  #text(size: 6.6pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[{s_en_num}]],')
        lines.append(f'  [#text(size: 8.2pt, weight: "bold")[{s_dev_title}] \\')
        lines.append(f'  #text(size: 7.0pt, fill: rgb("#1a1a1a"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[{s_en_title}]],')

    lines.append(")")
    lines.append("")
    lines.append("#pagebreak()")
    lines.append("")
    return "\n".join(lines)

if __name__ == "__main__":
    validate()
    root_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    target_md = os.path.join(root_dir, "source", "Table_of_Contents.md")
    generate_markdown_toc(target_md)
    # Also write a complete reference markdown in source folder:
    full_spec = os.path.join(root_dir, "source", "Curriculum_30_Parts_600_Sections.md")
    generate_markdown_toc(full_spec)
    master_parts_md = os.path.join(root_dir, "source", "Master_Parts_TOC.md")
    generate_markdown_master_parts(master_parts_md)
    print("Done generating curriculum files.")
