---
title     : !!str Configuration
parent    : !!str Luks on logical volumes
nav_order : !!int 4
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data.system.lvm["luks_logical_volumes"] %}

{% include system/configuration/localization.md %}
---
{% include system/configuration/network.md %}
---
{% include system/configuration/account.md %}
---
{% include system/configuration/keyfile.md %}
---
{% include system/storage/encryption.md step=2 %}
---
{% include system/storage/lvm.md step=2 %}
---
{% include system/configuration/table.md %}
---
{% include system/configuration/initial-ramdisk.md %}
---
{% include system/configuration/microcode.md %}
---
{% include system/configuration/boot-loader.md %}
