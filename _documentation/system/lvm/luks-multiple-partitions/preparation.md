---
title     : !!str Preparation
parent    : !!str Luks on multiple partitions
nav_order : !!int 1
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data.system.lvm["luks_multiple_partitions"] %}
{% assign txt = scenario.txts | where: "page", page.title | first %}

{% include system/installation-image.md %}
---
{% include system/installation-media.md %}
---
{% include system/live-environment.md %}
