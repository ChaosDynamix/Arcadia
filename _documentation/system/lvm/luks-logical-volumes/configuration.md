---
title: Configuration
uuid: 67f7de5b-5d15-4479-abd7-799ab52ce14a
parent_uuid: a852843f-53ac-47e9-a82d-d6cf288c8b76
nav_order: 4
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data.scenario[page.parent_uuid] %}
{% assign template = site.data.template[scenario.template] %}

{% include system/configuration/localization.md %}
---
{% include system/configuration/network.md %}
---
{% include system/configuration/account.md %}
---
{% include system/configuration/keyfile.md %}
---
{% include system/storage/encryption.md step=2 %}
---
{% include system/storage/setup.md step=2 %}
---
{% include system/configuration/fstab.md %}
---
{% include system/configuration/crypttab.md %}
---
{% include system/configuration/initial-ramdisk.md %}
---
{% include system/configuration/microcode.md %}
---
{% include system/configuration/boot-loader.md %}
