---
title     : !!str Storage
parent    : !!str Luks on logical volumes
nav_order : !!int 2
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data.system.lvm["luks_logical_volumes"] %}

{% include system/storage/secure-erase.md %}
---
{% include system/storage/partitioning.md %}
---
{% include system/storage/lvm.md step=1 %}
---
{% include system/storage/encryption.md step=1 %}
---
{% include system/storage/efi.md %}
