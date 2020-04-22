---
title: Storage
uuid: 2e4fc95c-3adb-46df-bf4b-c37e552a3195
parent_uuid: b84ab5fb-9500-4b17-b322-bd04e31f5d3a
nav_order: 2
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign template = site.data.installation.lvm.template.luks-single-partition %}
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
