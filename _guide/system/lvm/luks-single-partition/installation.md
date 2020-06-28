---
title     : !!str Installation
parent    : !!str Luks on single partition
nav_order : !!int 3
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data.system.lvm["luks_single_partition"] %}
{% assign txt = scenario.txts | where: "page", page.title | first %}

{% include system/essential-packages.md %}
---
{% include system/device-tables.md %}
