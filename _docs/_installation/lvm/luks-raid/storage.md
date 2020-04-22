---
title: Storage
uuid: 34bb5e80-40fc-4e49-842f-5e578603d4b0
parent_uuid: ff8a81bc-82d1-440a-9f71-df9676a19a26
nav_order: 2
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign template = site.data.installation.lvm.template.luks-raid %}
{% assign scenario = site.data.installation.lvm.scenario.lvm-luks %}

{% include installation/storage/secure-erase.md template=template %}
---
{% include installation/storage/partitioning.md template=template %}
---
{% include installation/storage/raid.md template=template %}
---
{% include installation/storage/encryption.md template=template %}
---
{% include installation/storage/lvm.md template=template scenario=scenario %}
---
{% include installation/storage/efi.md template=template %}
