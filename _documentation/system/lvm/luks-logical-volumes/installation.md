---
title     : !!str Installation
parent    : !!str Luks on logical volumes
nav_order : !!int 3
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data.system.lvm["luks_logical_volumes"] %}

{% include system/installation/essential-packages.md %}
