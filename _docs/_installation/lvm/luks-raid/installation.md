---
title: Installation
uuid: 2a39008d-1962-40fe-9b32-7f6dcdf70283
parent_uuid: ff8a81bc-82d1-440a-9f71-df9676a19a26
nav_order: 3
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign template = site.data.installation.lvm.template.luks-raid %}

{% include installation/installation/essential-packages.md template=template %}
---
{% include installation/installation/filesystem-table.md template=template %}
