---
title     : !!str Preparation
parent    : !!str Luks on mirroring Raid
nav_order : !!int 1
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data["luks_mirroring_raid"] %}
{% assign txt = scenario.txts | where: "page", page.title | first %}

{% include media/media_image.md %}
---
{% include media/media_flash.md %}
---
{% include media/media_boot.md %}
---
{% include media/media_keyboard.md %}
---
{% include media/media_mode.md %}
---
{% include media/media_network.md %}
---
{% include media/media_keyring.md %}
---
{% include media/media_mirrorlist.md %}
