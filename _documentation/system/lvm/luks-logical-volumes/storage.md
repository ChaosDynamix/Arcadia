---
title: Storage
uuid: 0992bde6-ecb3-4eff-bf7c-436456e3ac3f
parent_uuid: a852843f-53ac-47e9-a82d-d6cf288c8b76
nav_order: 2
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data.scenario[page.parent_uuid] %}

{% include system/storage/secure-erase.md %}
---
{% include system/storage/partitioning.md %}
---
{% include system/storage/lvm.md %}
---
{% include system/storage/encryption.md %}
---
{% include system/storage/efi.md %}
