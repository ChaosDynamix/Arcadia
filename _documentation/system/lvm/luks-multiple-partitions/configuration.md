---
title: Configuration
uuid: 36bc7364-4054-4699-982d-b7d74a05cbb7
parent_uuid: 66df9fd1-5ee6-42a1-831e-b3b9d6e26524
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
{% include system/configuration/crypttab-initramfs.md %}
---
{% include system/configuration/initial-ramdisk.md %}
---
{% include system/configuration/microcode.md %}
---
{% include system/configuration/boot-loader.md %}
