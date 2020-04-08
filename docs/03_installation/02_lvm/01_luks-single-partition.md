---
layout: default
title: Luks-single-partition
permalink: /installation/lvm/luks-single-partition/
grand_parent: Installation
parent: LVM
nav_order: 1
---

# LVM / Luks on single partition

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign scenario = site.data.lvm.luks-single-partition %}

{% include installation/secure-erase.md data=scenario %}
{% include installation/partitioning.md data=scenario %}
{% include installation/encryption.md data=scenario %}
{% include installation/lvm.md data=scenario %}
{% include installation/efi.md data=scenario %}
{% include installation/essential-packages.md data=scenario %}
{% include installation/filesystem-table.md data=scenario %}
{% include installation/keyfile.md data=scenario %}
{% include installation/initial-ramdisk.md data=scenario %}
{% include installation/microcode.md %}
{% include installation/boot-loader.md data=scenario %}
