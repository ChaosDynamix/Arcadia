---
title     : !!str Installation
parent    : !!str Luks on mirroring Raid
nav_order : !!int 3
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data["luks_mirroring_raid"] %}
{% assign txt = scenario.txts | where: "page", page.title | first %}

{% include system/system_packages.md %}
---
{% include storage/storage_tables.md %}
