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
{% assign txt = scenario.txts | where: "page", page.title | first %}

{% include system/base.md %}
---
{% include system/keyfile.md %}
---
{% include system/encryption.md %}
---
{% include system/filesystem.md %}
---
{% include system/device-tables.md %}
---
{% include system/initialization.md %}
