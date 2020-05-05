---
title     : !!str Configuration
parent    : !!str Luks on mirroring Raid
nav_order : !!int 4
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data.system.lvm["luks_mirroring_raid"] %}

{% include system/base.md %}
---
{% include system/keyfile.md %}
---
{% include system/initialization.md %}
