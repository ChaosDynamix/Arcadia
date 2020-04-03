---
layout: default
title: Luks on single partition
permalink: /installation/lvm/luks-single-partition/
grand_parent: Installation
parent: Logical Volume Manager
nav_order: 1

has_multiple-devices: false
has_multiple_containers: false
has_detached_header: false
has_raid: false
has_swapfile: false
init-system: busybox
---

# Single device / Luks on single partition
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
