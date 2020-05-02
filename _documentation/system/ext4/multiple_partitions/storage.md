---
title: Storage
uuid: 2e4fc95c-3adb-46df-bf4b-c37e552a3195
parent_uuid: 66ec7fd3-6e75-4f2b-92b6-9520dfecee1e
nav_order: 2
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data.ext4.scenario[page.parent_uuid] %}
{% assign template = site.data.template[scenario.template] %}
{% assign profile = site.data.ext4.profile[scenario.ext4.profile] %}

{% include system/storage/partitioning.md %}
---
{% include system/storage/setup.md step=1 %}
---
{% include system/storage/efi.md %}
