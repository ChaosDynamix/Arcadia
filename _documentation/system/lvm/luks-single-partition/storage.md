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

{% assign scenario = site.data.scenario[page.parent_uuid] %}
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
