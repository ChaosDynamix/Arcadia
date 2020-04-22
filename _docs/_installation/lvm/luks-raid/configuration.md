---
title: Configuration
uuid: 5ae49f0f-b640-43f4-adce-c3585ab4f51c
parent_uuid: ff8a81bc-82d1-440a-9f71-df9676a19a26
nav_order: 4
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign template = site.data.installation.lvm.template.luks-raid %}

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
