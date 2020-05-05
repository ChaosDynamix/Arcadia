---
title     : !!str Storage
parent    : !!str Luks on mirroring Raid
nav_order : !!int 2
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data.system.lvm["luks_mirroring_raid"] %}

{% include system/secure-erase.md %}
---
{% include system/partitioning.md %}
---
{% include system/raid.md %}
---
{% include system/encryption.md step=1 %}
---
{% include system/lvm.md %}
---
{% include system/filesystem.md step=1 %}
