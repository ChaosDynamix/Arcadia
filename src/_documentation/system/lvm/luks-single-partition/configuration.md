---
title: Configuration
uuid: a23bb653-76f7-48b5-b624-7790d9992cc0
parent_uuid: b84ab5fb-9500-4b17-b322-bd04e31f5d3a
nav_order: 4
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign data = site.data.system.configuration %}

{% include system/configuration/localization.md %}
---
{% include system/configuration/network.md %}
---
{% include system/configuration/account.md %}
---
{% include system/configuration/keyfile.md profile=data.keyfile.lvm.luks_single_partition %}
---
{% include system/configuration/initial-ramdisk.md profile=data.initial-ramdisk.lvm.luks_single_partition %}
---
{% include system/configuration/microcode.md %}
---
{% include system/configuration/boot-loader.md profile=data.boot-loader.lvm.luks_single_partition %}
