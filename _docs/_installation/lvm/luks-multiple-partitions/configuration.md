---
title: Configuration
uuid: 36bc7364-4054-4699-982d-b7d74a05cbb7
parent_uuid: 66df9fd1-5ee6-42a1-831e-b3b9d6e26524
nav_order: 4
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign template = site.data.installation.lvm.template.luks-multiple-partitions %}

{% include installation/configuration/localization.md %}
---
{% include installation/configuration/network.md %}
---
{% include installation/configuration/account.md %}
---
{% include installation/configuration/keyfile.md template=template %}
---
{% include installation/configuration/initial-ramdisk.md template=template %}
---
{% include installation/configuration/microcode.md %}
---
{% include installation/configuration/boot-loader.md template=template %}
