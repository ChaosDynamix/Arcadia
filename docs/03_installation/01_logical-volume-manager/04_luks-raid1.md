---
layout: default
title: Luks on Raid1
permalink: /installation/lvm/luks-raid1/
grand_parent: Installation
parent: Logical Volume Manager
nav_order: 4
---

# LVM / Luks on Raid1
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data.lvm.luks-raid1 %}

{% include installation_secure-erase.md data=scenario %}
{% include installation_partitioning.md data=scenario %}
{% include installation_raid.md %}
{% include installation_encryption.md data=scenario %}
{% include installation_lvm.md data=scenario %}
{% include installation_efi.md data=scenario %}
{% include installation_essential-packages.md data=scenario %}
{% include installation_filesystem-table.md data=scenario %}
{% include installation_keyfile.md data=scenario %}
{% include installation_initial-ramdisk.md data=scenario %}
{% include installation_microcode.md %}
{% include installation_boot-loader.md data=scenario %}
