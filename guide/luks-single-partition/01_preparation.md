---
title     : !!str Preparation
parent    : !!str Luks on single partition
nav_order : !!int 1
permalink : !!str /luks-single-partition/preparation
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data["luks_single_partition"] %}
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
