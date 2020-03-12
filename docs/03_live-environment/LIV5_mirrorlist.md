---
layout: default
title: Mirrorlist
permalink: /live-environment/mirrorlist/
parent: Live environment
nav_order: 5
---

# Live environment mirrorlist

---

## Update Arch Linux keyring

```bash
$ pacman -Sy archlinux-keyring
```

---

## Generate a mirrorlist

### Install reflector package
{: .no_toc .pt-2}

```bash
$ pacman -S reflector
```

### Launch the reflector script with your parameters
{: .no_toc .pt-4}

```bash
$ reflector --country France --age 15 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```
