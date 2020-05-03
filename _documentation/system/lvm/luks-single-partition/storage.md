---
title     : !!str Storage
parent    : !!str Luks on single partition
nav_order : !!int 2
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data.system.lvm["luks_single_partition"] %}

{% include system/storage/secure-erase.md %}
---
{% include system/storage/partitioning.md %}
---
{% include system/storage/encryption.md step=1 %}
---
{% include system/storage/lvm.md %}
---
{% include system/storage/efi.md %}
