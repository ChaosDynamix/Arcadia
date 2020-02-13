---
layout: default
title: Mirrorlist
nav_order: 5
has_children: false
parent: Live environment
permalink: /live-environment/mirrorlist/
has_toc: false
---

# Live environment mirrorlist
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## About

Packages to be installed must be downloaded from mirror servers, which are defined in `/etc/pacman.d/mirrorlist`. On the live system, all mirrors are enabled, and sorted by their synchronization status and speed at the time the installation image was created.

### Mirror priority
{: .no_toc}

The higher a mirror is placed in the list, the more priority it is given when downloading a package. You may want to edit the file accordingly, and move the geographically closest mirrors to the top of the list, although other criteria should be taken into account.

### References
{: .no_toc .text-delta .pt-5}

- [ArchWiki - Installation guide - Select the mirrors](https://wiki.archlinux.org/index.php/Installation_guide#Select_the_mirrors)

---

## Arch Linux keyring

`archlinux-keyring` package update the signatures to prevent issues and ensure proper security.

In order to install a package on the live environment, we need to synchronize the repository databases. `pacman -Sy` is not the recommended command to install a package but we are on a live environment so we can't upgrade the system.

### Update the keyring
{: .no_toc}

```bash
pacman -Sy archlinux-keyring
```

### References
{: .no_toc .text-delta .pt-5}

- [ArchWiki - Pacman - Installing packages](https://wiki.archlinux.org/index.php/Pacman#Installing_packages)
- [ArchWiki - Pacman - Troubleshooting](https://wiki.archlinux.org/index.php/Pacman#Signature_from_%22User_%3Cemail@example.org%3E%22_is_unknown_trust,_installation_failed)
