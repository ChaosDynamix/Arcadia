---
title: Preparation
uuid: 4a50d874-f482-4074-b68c-cb7f76a65956
parent_uuid: b84ab5fb-9500-4b17-b322-bd04e31f5d3a
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
