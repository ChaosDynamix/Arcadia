---
title     : !!str Installation
parent    : !!str Luks on logical volumes
nav_order : !!int 3
permalink : !!str /luks-logical-volumes/installation
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data["luks_logical_volumes"] %}
{% assign txt = scenario.txts | where: "page", page.title | first %}

{% include system/system_packages.md %}
---
{% include storage/storage_tables.md %}
