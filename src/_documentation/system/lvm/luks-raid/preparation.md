---
title: Preparation
uuid: 3a8866f1-817f-4acc-87be-5d38ecfcfcef
parent_uuid: ff8a81bc-82d1-440a-9f71-df9676a19a26
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
