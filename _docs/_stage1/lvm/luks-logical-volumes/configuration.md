---
title: Configuration
nav_order: 3
parent: Luks on logical volumes
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign template = site.data.stage1.lvm.template.luks-logical-volumes %}

{% include stage1/localization.md template=template %}
{% include stage1/network.md template=template %}
{% include stage1/account.md template=template %}
{% include stage1/keyfile.md template=template %}
{% include stage1/initial-ramdisk.md template=template %}
{% include stage1/microcode.md %}
{% include stage1/boot-loader.md template=template %}
