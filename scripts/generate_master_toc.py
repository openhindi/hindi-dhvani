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

def validate():
    print(f"Total parts loaded: {len(ALL_PARTS)}")
    assert len(ALL_PARTS) == 30, f"Expected 30 parts, got {len(ALL_PARTS)}"
    for idx, (p_num, p_dev, p_en, secs) in enumerate(ALL_PARTS):
        assert p_num == idx + 1, f"Part number mismatch at index {idx}: {p_num}"
        assert len(secs) == 20, f"Part {p_num} ({p_dev}) does not have 20 sections, has {len(secs)}"
    total_sections = sum(len(s) for _, _, _, s in ALL_PARTS)
    print(f"Total sections loaded: {total_sections} (30 parts * 20 sections = 600 sections)")
    print("Validation passed successfully!")

def generate_markdown_toc(output_path):
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

    dev_numerals = ["०", "१", "२", "३", "४", "५", "६", "७", "८", "९"]
    def to_dev_num(n):
        return "".join(dev_numerals[int(d)] for d in str(n))

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

def generate_typst_toc_block():
    """Generates the 6 Table of Contents pages in Typst for hindi-pushtak.typ (5 parts per page)."""
    dev_numerals = ["०", "१", "२", "३", "४", "५", "६", "७", "८", "९"]
    def to_dev_num(n):
        return "".join(dev_numerals[int(d)] for d in str(n))

    pages = []
    for page_idx in range(6):
        start_part = page_idx * 5
        end_part = start_part + 5
        current_parts = ALL_PARTS[start_part:end_part]
        p_start_num = start_part + 1
        p_end_num = end_part

        p_lines = []
        p_lines.append(f"// PAGE {page_idx + 3}: खंड {to_dev_num(p_start_num)} से {to_dev_num(p_end_num)}")
        p_lines.append("#v(2pt)")
        p_lines.append(f'#text(size: 16pt, weight: "bold")[विषय-सूची : भाग {to_dev_num(page_idx + 1)}] \\')
        p_lines.append(f"#en-sub[Table of Contents : Parts {p_start_num} to {p_end_num}]")
        p_lines.append("#v(6pt)")
        p_lines.append("")
        p_lines.append("#table(")
        p_lines.append("  columns: (60pt, 1fr),")
        p_lines.append("  align: (center + top, left + top),")
        p_lines.append('  [*खंड* \\ #en-sub[Part]], [*शीर्षक, अनुभाग एवं विषय* \\ #en-sub[Title, Sections & Topics]],')

        for p_num, p_dev, p_en, secs in current_parts:
            # First row cell: Part number
            p_lines.append(f'  [#strong[खंड {to_dev_num(p_num)}] \\')
            p_lines.append(f'  #en-sub[Part {p_num}]],')

            # Second row cell: Title + sections
            # Show summary of key 4-5 milestone sections or compact flow of 20 sections
            # In Typst TOC table, each part lists representative sections or all 20 sections grouped cleanly
            sec_hindi_spans = []
            sec_eng_spans = []
            for s_dev_num, s_dev_title, s_en_num, s_en_title in secs:
                sec_hindi_spans.append(f"{s_dev_num} : {s_dev_title}")
                sec_eng_spans.append(f"{s_en_num} : {s_en_title}")

            hin_summary = " #h(6pt)•#h(6pt) ".join(sec_hindi_spans[:5]) + " #h(6pt)•#h(6pt) [एवं २० विशिष्ट अनुभाग]"
            en_summary = " #h(6pt)•#h(6pt) ".join(sec_eng_spans[:5]) + " #h(6pt)•#h(6pt) [and 20 comprehensive sections]"

            p_lines.append(f'  [#strong[{p_dev}] \\')
            p_lines.append(f'  #en-sub[{p_en}] \\')
            p_lines.append('  #v(1.5pt)')
            p_lines.append(f'  #text(size: 8pt, fill: rgb("#333333"))[{hin_summary}] \\')
            p_lines.append('  #v(0.5pt)')
            p_lines.append(f'  #text(size: 7.2pt, fill: rgb("#666666"), font: ("Noto Sans Devanagari", "DejaVu Sans"))[{en_summary}]],')

        p_lines.append(")")
        p_lines.append("")
        p_lines.append("#pagebreak()")
        p_lines.append("")
        pages.append("\n".join(p_lines))

    return "\n".join(pages)

if __name__ == "__main__":
    validate()
    root_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    target_md = os.path.join(root_dir, "source", "Table_of_Contents.md")
    generate_markdown_toc(target_md)
    # Also write a complete reference markdown in source folder:
    full_spec = os.path.join(root_dir, "source", "Curriculum_30_Parts_600_Sections.md")
    generate_markdown_toc(full_spec)
    print("Done generating curriculum files.")
