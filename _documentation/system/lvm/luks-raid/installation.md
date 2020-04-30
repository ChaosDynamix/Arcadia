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

{% assign scenario = site.data.scenario[page.parent_uuid] %}

{% include system/installation/essential-packages.md %}
---
{% include system/installation/filesystem-table.md %}
