---
title: Installation
uuid: 6589e3c2-ced3-4945-88fc-20100f32b81b
parent_uuid: b84ab5fb-9500-4b17-b322-bd04e31f5d3a
nav_order: 3
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data.lvm.scenario[page.parent_uuid] %}
{% assign template = site.data.template[scenario.template] %}

{% include system/installation/essential-packages.md %}
