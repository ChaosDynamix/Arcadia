---
layout: default
title: Luks-multiple-partitions
permalink: /installation/lvm/luks-multiple-partitions/
grand_parent: Installation
parent: LVM
nav_order: 3
---

# LVM / Luks on multiple partitions

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign luks-multiple-partitions = site.data.docs.installation.lvm.template.luks-multiple-partitions %}
{% assign lvm-luks = site.data.docs.installation.lvm.scenario.lvm-luks %}

{% include docs/installation/secure-erase.md template=luks-multiple-partitions %}
{% include docs/installation/partitioning.md template=luks-multiple-partitions %}
{% include docs/installation/encryption.md template=luks-multiple-partitions %}
{% include docs/installation/lvm.md template=luks-multiple-partitions scenario=lvm-luks %}
{% include docs/installation/efi.md template=luks-multiple-partitions %}
{% include docs/installation/essential-packages.md template=luks-multiple-partitions %}
{% include docs/installation/filesystem-table.md template=luks-multiple-partitions %}
{% include docs/installation/keyfile.md template=luks-multiple-partitions %}
{% include docs/installation/initial-ramdisk.md template=luks-multiple-partitions %}
{% include docs/installation/microcode.md %}
{% include docs/installation/boot-loader.md template=luks-multiple-partitions %}
