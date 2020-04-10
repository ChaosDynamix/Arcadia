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

{% assign luks-single-partition = site.data.docs.installation.lvm.template.luks-single-partition %}
{% assign lvm-luks = site.data.docs.installation.lvm.scenario.lvm-luks %}

{% include docs/installation/secure-erase.md template=luks-single-partition %}
{% include docs/installation/partitioning.md template=luks-single-partition %}
{% include docs/installation/encryption.md template=luks-single-partition %}
{% include docs/installation/lvm.md template=luks-single-partition scenario=lvm-luks %}
{% include docs/installation/efi.md template=luks-single-partition %}
{% include docs/installation/essential-packages.md template=luks-single-partition %}
{% include docs/installation/filesystem-table.md template=luks-single-partition %}
{% include docs/installation/keyfile.md template=luks-single-partition %}
{% include docs/installation/initial-ramdisk.md template=luks-single-partition %}
{% include docs/installation/microcode.md %}
{% include docs/installation/boot-loader.md template=luks-single-partition %}
