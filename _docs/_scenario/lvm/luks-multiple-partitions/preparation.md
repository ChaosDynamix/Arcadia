---
title: Preparation
nav_order: 1
parent: Luks on multiple partitions
---

# {{ page.parent }} / {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign template = site.data.installation.lvm.template.luks-multiple-partitions %}
{% assign scenario = site.data.installation.lvm.scenario.lvm-luks %}

{% include installation/secure-erase.md template=template %}
{% include installation/partitioning.md template=template %}
{% include installation/encryption.md template=template %}
{% include installation/lvm.md template=template scenario=scenario %}
{% include installation/efi.md template=template %}
