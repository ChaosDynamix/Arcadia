---
title: Preparation
uuid: b475231a-e702-4fc2-a611-0ae65fb41663
parent_uuid: 66df9fd1-5ee6-42a1-831e-b3b9d6e26524
nav_order: 1
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data.lvm.scenario[page.parent_uuid] %}
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
