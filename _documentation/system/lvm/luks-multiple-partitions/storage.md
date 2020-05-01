---
title: Storage
uuid: b304ca59-5d23-40df-b187-3482e0b5652a
parent_uuid: 66df9fd1-5ee6-42a1-831e-b3b9d6e26524
nav_order: 2
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data.lvm.scenario[page.parent_uuid] %}
{% assign template = site.data.template[scenario.template] %}

{% include system/storage/secure-erase.md %}
---
{% include system/storage/partitioning.md %}
---
{% include system/storage/encryption.md step=1 %}
---
{% include system/storage/lvm.md %}
---
{% include system/storage/setup.md step=1 %}
---
{% include system/storage/efi.md %}
