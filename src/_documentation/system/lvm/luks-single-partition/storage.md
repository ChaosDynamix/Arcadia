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

{% assign storage_profile = site.data.system.storage %}

{% assign secure_erase_profile = storage_profile.secure-erase.profile.solo %}
{% include system/storage/secure-erase.md profile=secure_erase_profile %}
---
{% assign partitioning_profile = storage_profile.partitioning %}
{% include system/storage/partitioning.md profile=partitioning_profile %}
