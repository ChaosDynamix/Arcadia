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

{% include system/base.md %}
---
{% include system/keyfile.md %}
---
{% include system/encryption.md step=2 %}
---
{% include system/filesystem.md step=2 %}
---
{% include system/device-tables.md step=2 %}
---
{% include system/initialization.md %}
