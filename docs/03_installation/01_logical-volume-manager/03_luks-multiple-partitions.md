---
layout: default
title: Luks on multiple partitions
permalink: /installation/lvm/luks-multiple-partitions/
grand_parent: Installation
parent: Logical Volume Manager
nav_order: 3

has_multiple-devices: true
has_multiple_containers: true
has_detached_header: false
has_raid: false
has_swapfile: false
init-system: systemd
---

# Multiple devices / Luks on multiple partitions
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
{% include keyfile.md %}
{% include filesystem-table.md %}
{% include initial-ramdisk.md %}
{% include microcode.md %}
{% include boot-loader.md %}
