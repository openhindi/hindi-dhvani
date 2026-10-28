# -*- coding: utf-8 -*-
"""Master assembler and generator for Table of Contents in Markdown."""

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
    lines.append("# मानक हिंदी ध्वनि संदर्भ : ३० खंडों का विहंगावलोकन")
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
    lines.append("# मानक हिंदी ध्वनि संदर्भ : संपूर्ण पाठ्यक्रम एवं विषय-सूची")
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
if __name__ == '__main__':
    validate()
    root_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    target_md = os.path.join(root_dir, 'source', 'Table_of_Contents.md')
    generate_markdown_toc(target_md)
    full_spec = os.path.join(root_dir, 'source', 'Curriculum_30_Parts_600_Sections.md')
    generate_markdown_toc(full_spec)
    master_parts_md = os.path.join(root_dir, 'source', 'Master_Parts_TOC.md')
    generate_markdown_master_parts(master_parts_md)
    print('Done generating curriculum files.')
