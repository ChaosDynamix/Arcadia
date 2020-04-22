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

{% assign template = site.data.installation.lvm.template.luks-single-partition %}

{% include installation/configuration/localization.md %}
---
{% include installation/configuration/network.md %}
---
{% include installation/configuration/account.md %}
---
{% include installation/configuration/keyfile.md template=template %}
---
{% include installation/configuration/initial-ramdisk.md template=template %}
---
{% include installation/configuration/microcode.md %}
---
{% include installation/configuration/boot-loader.md template=template %}
