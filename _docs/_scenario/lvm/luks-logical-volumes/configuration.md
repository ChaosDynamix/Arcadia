---
title: Configuration
nav_order: 3
parent: Luks on logical volumes
---

# {{ page.parent }} / {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign template = site.data.installation.lvm.template.luks-logical-volumes %}

{% include installation/localization.md template=template %}
{% include installation/network.md template=template %}
{% include installation/account.md template=template %}
{% include installation/keyfile.md template=template %}
{% include installation/initial-ramdisk.md template=template %}
{% include installation/microcode.md %}
{% include installation/boot-loader.md template=template %}
