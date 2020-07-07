---
title     : !!str Storage
parent    : !!str Luks on logical volumes
nav_order : !!int 2
permalink : !!str /luks-logical-volumes/storage
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data["luks_logical_volumes"] %}
{% assign txt = scenario.txts | where: "page", page.title | first %}

{% include storage/storage_secure-erase.md %}
---
{% include storage/storage_partitioning.md %}
---
{% include storage/storage_lvm.md %}
---
{% include storage/storage_encryption.md %}
---
{% include storage/storage_ext4.md %}
---
{% include storage/storage_efi.md %}
