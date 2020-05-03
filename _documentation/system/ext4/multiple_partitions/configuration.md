---
title     : !!str Configuration
parent    : !!str Multiple partitions
nav_order : !!int 4
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data.system.ext4["multiple_partitions"] %}

{% include system/configuration/localization.md %}
---
{% include system/configuration/network.md %}
---
{% include system/configuration/account.md %}
---
{% include system/configuration/microcode.md %}
---
{% include system/configuration/boot-loader.md %}
