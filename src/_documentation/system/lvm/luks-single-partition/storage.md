---
title: Storage
uuid: 2e4fc95c-3adb-46df-bf4b-c37e552a3195
parent_uuid: b84ab5fb-9500-4b17-b322-bd04e31f5d3a
nav_order: 2
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign data = site.data.system.storage %}

{% include system/storage/secure-erase.md dev_number=1 %}
---
{% include system/storage/partitioning.md scenario=data.partitioning.scenarios.luks_single_partition %}
---
{% include system/storage/encryption.md scenario=data.encryption.scenarios.luks_single_partition context="lvm" %}
---
{% include system/storage/lvm/lvm-luks.md scenario=data.lvm.scenarios.luks_single_partition %}
---
{% include system/storage/efi.md part_number=1 %}
