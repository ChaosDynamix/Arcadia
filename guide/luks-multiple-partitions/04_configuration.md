---
title     : !!str Configuration
parent    : !!str Luks on multiple partitions
nav_order : !!int 4
permalink : !!str /luks-multiple-partitions/configuration
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data["luks_multiple_partitions"] %}
{% assign txt = scenario.txts | where: "page", page.title | first %}

{% include system/system_localization.md %}
---
{% include system/system_network.md %}
---
{% include storage/storage_trim.md %}
---
{% include system/system_users.md %}
---
{% include storage/storage_keyfiles.md %}
---
{% include storage/storage_tables.md %}
---
{% include system/system_initramfs.md %}
---
{% include system/system_microcode.md %}
---
{% include system/system_boot-loader.md %}
