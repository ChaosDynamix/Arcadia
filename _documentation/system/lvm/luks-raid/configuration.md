---
title: Configuration
uuid: 5ae49f0f-b640-43f4-adce-c3585ab4f51c
parent_uuid: ff8a81bc-82d1-440a-9f71-df9676a19a26
nav_order: 4
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data.lvm.scenario[page.parent_uuid] %}
{% assign template = site.data.template[scenario.template] %}

{% include system/configuration/localization.md %}
---
{% include system/configuration/network.md %}
---
{% include system/configuration/account.md %}
---
{% include system/configuration/keyfile.md %}
---
{% include system/configuration/initial-ramdisk.md %}
---
{% include system/configuration/microcode.md %}
---
{% include system/configuration/boot-loader.md %}
