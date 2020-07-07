---
title     : !!str Installation
parent    : !!str Luks on multiple partitions
nav_order : !!int 3
permalink : !!str /luks-multiple-partitions/installation
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data["luks_multiple_partitions"] %}
{% assign txt = scenario.txts | where: "page", page.title | first %}

{% include system/system_packages.md %}
---
{% include storage/storage_tables.md %}
