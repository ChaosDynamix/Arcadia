---
title: Installation
nav_order: 2
parent: Luks on multiple partitions
---

# {{ page.parent }} / {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign template = site.data.installation.lvm.template.luks-multiple-partitions %}

{% include installation/essential-packages.md template=template %}
{% include installation/filesystem-table.md template=template %}
