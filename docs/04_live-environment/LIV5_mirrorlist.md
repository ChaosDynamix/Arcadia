---
layout: default
title: LIV5 Mirrorlist
nav_order: 5
has_children: false
parent: 03 Live environment
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

## Update Arch Linux keyring

`archlinux-keyring` package update the signatures to prevent issues and ensure proper security.

In order to install a package on the live environment, we need to synchronize the repository databases. `pacman -Sy` is not the recommended command to install a package but we are on a live environment so we can't upgrade the system.

```bash
pacman -Sy archlinux-keyring
```

### References
{: .no_toc .text-delta .pt-5}

- [ArchWiki - Pacman - Installing packages](https://wiki.archlinux.org/index.php/Pacman#Installing_packages)
- [ArchWiki - Pacman - Troubleshooting](https://wiki.archlinux.org/index.php/Pacman#Signature_from_%22User_%3Cemail@example.org%3E%22_is_unknown_trust,_installation_failed)

---

## Generate a mirrorlist

Use one of the two solutions below

### Using Pacman-contrib
{: .no_toc .pt-4 .d-inline-block}

Experimental
{: .label .label-yellow .mx-2}

The `pacman-contrib` package provides a Bash script, `/usr/bin/rankmirrors`, which can be used to rank the mirrors according to their connection and opening speeds to take advantage of using the fastest local mirror.

```bash
# Install pacman-contrib package
$ pacman -S pacman-contrib

#  Get the generated mirrorlist (edit the link accordingly)
$ curl -o /etc/pacman.d/mirrorlist.backup "https://www.archlinux.org/mirrorlist/?country=FR&protocol=https"

# Uncommment all the servers
$ sed -i "s/^#Server/Server/" /etc/pacman.d/mirrorlist.backup

#  Rank the mirrors
$ rankmirrors -n 5 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist
```

### Using Reflector
{: .no_toc .pt-4}

Reflector is a script which can retrieve the latest mirror list from the MirrorStatus page, filter the most up-to-date mirrors, sort them by speed and overwrite the file `/etc/pacman.d/mirrorlist`.

```bash
# Install reflector package
$ pacman -S reflector

# Launch the reflector script
$ reflector --country France --age 15 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```

### References
{: .no_toc .text-delta .pt-5}

- [ArchWiki - Mirrors - Sorting mirrors](https://wiki.archlinux.org/index.php/Mirrors#Sorting_mirrors)
- [ArchWiki - Reflector](https://wiki.archlinux.org/index.php/Reflector)
- [Manual - curl](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/curl/curl.1.en)
- [Manual - sed](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/sed/sed.1.en)
