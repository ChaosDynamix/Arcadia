---
title     : !!str Preparation
parent    : !!str Luks on mirroring Raid
nav_order : !!int 1
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data.system.lvm["luks_mirroring_raid"] %}

{% include system/installation-image.md %}
---
{% include system/installation-media.md %}
---
{% include system/live-environment.md %}
