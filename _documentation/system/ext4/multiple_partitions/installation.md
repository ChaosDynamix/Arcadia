---
title     : !!str Installation
parent    : !!str Multiple partitions
nav_order : !!int 3
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data.system.ext4["multiple_partitions"] %}

{% include system/installation/essential-packages.md %}
