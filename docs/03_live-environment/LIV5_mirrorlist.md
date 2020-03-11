---
layout: default
title: Mirrorlist
permalink: /live-environment/mirrorlist/
parent: Live environment
nav_order: 5
---

# Live environment mirrorlist

---

### Update Arch Linux keyring
{: .no_toc .pt-2}

```bash
$ pacman -Sy archlinux-keyring
```

### Generate a mirrorlist
{: .no_toc .pt-4}

```bash
# Install reflector package
$ pacman -S reflector

# Launch the reflector script with your parameters
$ reflector --country France --age 15 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```
