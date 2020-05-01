---
title: Storage
uuid: 34bb5e80-40fc-4e49-842f-5e578603d4b0
parent_uuid: ff8a81bc-82d1-440a-9f71-df9676a19a26
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
{% include system/storage/raid.md %}
---
{% include system/storage/encryption.md step=1 %}
---
{% include system/storage/lvm.md %}
---
{% include system/storage/efi.md %}
