---
layout: default
title: Luks on Raid1
permalink: /installation/lvm/luks-raid1/
grand_parent: Installation
parent: Logical Volume Manager
nav_order: 4

has_multiple-devices: true
has_multiple_containers: false
has_detached_header: false
has_raid: true
has_swapfile: false
init-system: busybox
---

# Multiple devices / Luks on Raid1
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% include secure-erase.md %}
{% include partitioning.md %}
{% include raid.md %}
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
