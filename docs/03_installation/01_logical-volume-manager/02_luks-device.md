---
layout: default
title: Luks on device
permalink: /installation/lvm/luks-device/
nav_exclude: true

has_multiple-devices: false
has_multiple_containers: false
has_detached_header: true
has_raid: false
has_swapfile: false
init-system: systemd
---

# LVM / Luks on device
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% include secure-erase.md %}
{% include partitioning.md %}
{% include encryption.md %}
{% include logical-volume-manager.md %}
{% include efi-partition.md %}
{% include mirrorlist.md %}
{% include essential-packages.md %}
{% include filesystem-table.md %}
{% include keyfile.md %}
{% include initial-ramdisk.md %}
{% include microcode.md %}
{% include boot-loader.md %}
