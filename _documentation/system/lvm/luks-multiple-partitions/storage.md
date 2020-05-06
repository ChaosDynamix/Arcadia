---
title     : !!str Storage
parent    : !!str Luks on multiple partitions
nav_order : !!int 2
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data.system.lvm["luks_multiple_partitions"] %}
{% assign txt = scenario.txts | where: "page", page.title | first %}

{% include system/secure-erase.md %}
---
{% include system/partitioning.md %}
---
{% include system/encryption.md %}
---
{% include system/lvm.md %}
---
{% include system/filesystem.md %}
