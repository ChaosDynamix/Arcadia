---
title: Preparation
uuid: 4a50d874-f482-4074-b68c-cb7f76a65956
parent_uuid: 66ec7fd3-6e75-4f2b-92b6-9520dfecee1e
nav_order: 1
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data.ext4.scenario[page.parent_uuid] %}
{% assign template = site.data.template[scenario.template] %}

{% include system/preparation/installation-image.md %}
---
{% include system/preparation/installation-media.md %}
---
{% include system/preparation/keymap.md %}
---
{% include system/preparation/boot-mode.md %}
---
{% include system/preparation/network.md %}
---
{% include system/preparation/keyring.md %}
---
{% include system/preparation/mirrorlist.md %}
