---
title: Storage
uuid: b304ca59-5d23-40df-b187-3482e0b5652a
parent_uuid: 66df9fd1-5ee6-42a1-831e-b3b9d6e26524
nav_order: 2
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign template = site.data.installation.lvm.template.luks-multiple-partitions %}
{% assign scenario = site.data.installation.lvm.scenario.lvm-luks %}

{% include installation/storage/secure-erase.md template=template %}
---
{% include installation/storage/partitioning.md template=template %}
---
{% include installation/storage/encryption.md template=template %}
---
{% include installation/storage/lvm.md template=template scenario=scenario %}
---
{% include installation/storage/efi.md template=template %}
