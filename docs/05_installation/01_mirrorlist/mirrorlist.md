---
layout: default
title: Mirrorlist
permalink: /installation/mirrorlist/
parent: Installation
nav_order: 1
---

# Installation mirrorlist
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Update Arch Linux keyring

```bash
$ pacman -Sy archlinux-keyring
```

---

## Install reflector package

```bash
$ pacman -S reflector
```

---

## Launch the reflector script with your parameters

```bash
$ reflector --country France --age 15 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```

---

## References
{: .no_toc}

### MIRRORLIST
{: .no_toc .text-delta .pt-2}

1. [ArchWiki - Installation guide - Select the mirrors](https://wiki.archlinux.org/index.php/Installation_guide#Select_the_mirrors)
1. [ArchWiki - Pacman - Installing packages](https://wiki.archlinux.org/index.php/Pacman#Installing_packages)
1. [ArchWiki - Pacman - Troubleshooting](https://wiki.archlinux.org/index.php/Pacman#Signature_from_%22User_%3Cemail@example.org%3E%22_is_unknown_trust,_installation_failed)
1. [ArchWiki - Mirrors - Sorting mirrors](https://wiki.archlinux.org/index.php/Mirrors#Sorting_mirrors)
1. [ArchWiki - Reflector](https://wiki.archlinux.org/index.php/Reflector)
