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

{% assign storage_data = site.data.system.storage %}

{% include system/storage/secure-erase.md profile=storage_data.secure-erase.single %}
---
{% include system/storage/partitioning.md profile=storage_data.partitioning.luks_single_partition %}
---
{% include system/storage/encryption.md profile=storage_data.encryption.lvm.luks_single_partition %}
---
{% include system/storage/lvm.md template=storage_data.lvm.template.lvm_on_luks profile=storage_data.lvm.luks_single_partition %}
---
{% include system/storage/efi.md profile=storage_data.efi.single %}
