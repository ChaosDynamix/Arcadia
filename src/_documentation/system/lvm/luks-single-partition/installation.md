---
title: Installation
uuid: 6589e3c2-ced3-4945-88fc-20100f32b81b
parent_uuid: b84ab5fb-9500-4b17-b322-bd04e31f5d3a
nav_order: 3
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign data = site.data.system.installation %}

{% include system/installation/essential-packages.md profile=data.essential-packages.lvm %}
---
{% include system/installation/filesystem-table.md profile=data.filesystem-table.lvm %}
