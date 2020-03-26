---
layout: default
title: Mirrorlist
permalink: /installation/mirrorlist/
parent: Installation
nav_order: 1
---

# Mirrorlist
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Update Arch Linux keyring

The arch linux keyring holds all the signatures related to the packages. During the installation, a package is verified against this keyring to ensure that the downloaded file is properly signed. This keyring need to be updated in order to delete revoked keys and add new trusted keys.

```bash
$ pacman -Sy archlinux-keyring
```

If you are not in a live environment context, avoid refreshing the package list without upgrading the system. In practice, do not run `pacman -Sy package_name` instead of `pacman -Syu package_name`, as this could lead to dependency issues.

---

## Install reflector package

Reflector is a script which can retrieve the latest mirror list from the MirrorStatus page, filter the most up-to-date mirrors, sort them by speed and overwrite the file `/etc/pacman.d/mirrorlist`.

```bash
$ pacman -S reflector
```

---

## Launch the reflector script with your arguments

| Argument | Description                                                                                                                         |
| :------- | :---------------------------------------------------------------------------------------------------------------------------------- |
| -c       | Match one of the given countries (case-sensitive). Use `reflector --list-countries` to see which are available                                  |
| -a       | Only return mirrors that have synchronized in the last n hours. n may be an integer or a decimal number                             |
| -p       | March one of the given protocols, e.g "http", "https", "ftp"                                                                        |
| --sort   | Sort the mirrorlist. "rate": download rate; "country": server's location; "score": MirrorStatus score; "delay": MirrorStatus delay. |
| --save   | Save the mirrorlist to the given path.                                                                                              |

#### EXAMPLE
{: .no_toc .mt-5}

```bash
$ reflector -c FR -a 15 -p https --sort rate --save /etc/pacman.d/mirrorlist
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
