---
title: Preparation
uuid: 1defca51-840e-4740-8f1a-f28b7b650b99
parent_uuid: a852843f-53ac-47e9-a82d-d6cf288c8b76
nav_order: 1
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign library_collection = site.collections | where: "uuid", "5560831d-30b1-41be-9f94-1f2d0e405166" | first %}
{% assign query = page.uuid | prepend: "?parentuuid=" %}

{% include system/preparation/installation-image.md query=query %}
---
{% include system/preparation/installation-media.md query=query %}
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
