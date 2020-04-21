---
title: Preparation
nav_order: 1
parent: Luks on Raid
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign template = site.data.stage1.lvm.template.luks-raid %}
{% assign scenario = site.data.stage1.lvm.scenario.lvm-luks %}

{% include stage1/secure-erase.md template=template %}
{% include stage1/partitioning.md template=template %}
{% include stage1/encryption.md template=template %}
{% include stage1/lvm.md template=template scenario=scenario %}
{% include stage1/efi.md template=template %}
