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

{% assign library_collection = site.collections | where: "title", "library" | first %}
{% assign query = page.uuid | prepend: "?parentuuid=" %}

{% include installation/preparation/installation-image.md query=query %}
---
{% include installation/preparation/installation-media.md %}
---
{% include installation/preparation/keymap.md %}
---
{% include installation/preparation/boot-mode.md %}
---
{% include installation/preparation/network.md %}
---
{% include installation/preparation/keyring.md %}
---
{% include installation/preparation/mirrorlist.md %}
