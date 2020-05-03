---
title     : !!str Storage
parent    : !!str Multiple partitions
nav_order : !!int 2
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data.system.ext4["multiple_partitions"] %}

{% include system/storage/partitioning.md %}
---
{% include system/storage/ext4.md %}
---
{% include system/storage/efi.md %}
