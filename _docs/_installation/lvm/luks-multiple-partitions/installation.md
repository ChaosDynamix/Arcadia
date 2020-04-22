---
title: Installation
uuid: cdd3cc84-7a0a-49f4-9e26-f47a52ef0e46
parent_uuid: 66df9fd1-5ee6-42a1-831e-b3b9d6e26524
nav_order: 3
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign template = site.data.installation.lvm.template.luks-multiple-partitions %}

{% include installation/installation/essential-packages.md template=template %}
---
{% include installation/installation/filesystem-table.md template=template %}
