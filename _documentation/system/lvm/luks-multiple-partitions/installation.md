---
title     : !!str Installation
parent    : !!str Luks on multiple partitions
nav_order : !!int 3
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data.system.lvm["luks_multiple_partitions"] %}
{% assign txt = scenario.txts | where: "page", page.title | first %}

{% include system/essential-packages.md %}
---
{% include system/device-tables.md %}
