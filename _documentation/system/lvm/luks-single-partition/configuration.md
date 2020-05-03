---
title     : !!str Configuration
parent    : !!str Luks on single partition
nav_order : !!int 4
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data.system.lvm["luks_single_partition"] %}

{% include system/configuration/localization.md %}
---
{% include system/configuration/network.md %}
---
{% include system/configuration/account.md %}
---
{% include system/configuration/keyfile.md %}
---
{% include system/configuration/initial-ramdisk.md %}
---
{% include system/configuration/microcode.md %}
---
{% include system/configuration/boot-loader.md %}
