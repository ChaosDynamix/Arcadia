---
title     : !!str Configuration
parent    : !!str Luks on mirroring Raid
nav_order : !!int 4
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data["luks_mirroring_raid"] %}
{% assign txt = scenario.txts | where: "page", page.title | first %}

{% include system/system_localization.md %}
---
{% include system/system_network.md %}
---
{% include system/system_users.md %}
---
{% include storage/storage_keyfiles.md %}
---
{% include system/system_initramfs.md %}
---
{% include system/system_microcode.md %}
---
{% include system/system_boot-loader.md %}
