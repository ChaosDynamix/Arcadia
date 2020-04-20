---
title: Installation
nav_order: 2
parent: Luks on multiple partitions
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign template = site.data.stage1.lvm.template.luks-multiple-partitions %}

{% include stage1/essential-packages.md template=template %}
{% include stage1/filesystem-table.md template=template %}
