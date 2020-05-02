---
title: Configuration
uuid: a23bb653-76f7-48b5-b624-7790d9992cc0
parent_uuid: 66ec7fd3-6e75-4f2b-92b6-9520dfecee1e
nav_order: 4
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data.ext4.scenario[page.parent_uuid] %}
{% assign template = site.data.template[scenario.template] %}

{% include system/configuration/localization.md %}
---
{% include system/configuration/network.md %}
---
{% include system/configuration/account.md %}
---
{% include system/configuration/microcode.md %}
---
{% include system/configuration/boot-loader.md %}
