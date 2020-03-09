---
layout: default
title: Live environment
permalink: /live-environment/
nav_order: 3
has_children: true
has_toc: false
---

# Live environment

---

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Keyboard layout

### Select a keymap
{: .no_toc .pt-2}

```bash
# List all the keymaps
$ ls /usr/share/kbd/keymaps/**/*.map.gz | less

# Search specific keymaps
$ ls /usr/share/kbd/keymaps/**/*.map.gz | grep -i search_term
```

### Load the keymap
{: .no_toc .pt-4}

```bash
# Replace fr-latin9 accordingly
$ loadkeys fr-latin9
```

### INFORMATIONS
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - US keyboard layout image](https://en.wikipedia.org/wiki/File:KB_United_States-NoAltGr.svg)
1. [Wikipedia - Keyboard layout](https://en.wikipedia.org/wiki/Keyboard_layout)

### GUIDES
{: .no_toc .text-delta .pt-2}

1. [ArchWiki - Installation guide - Set the keyboard layout](https://wiki.archlinux.org/index.php/Installation_guide#Set_the_keyboard_layout)
1. [ArchWiki - Linux console - Keyboard configuration](https://wiki.archlinux.org/index.php/Linux_console/Keyboard_configuration)

### MANUALS
{: .no_toc .text-delta .pt-2}

1. [Man page - localectl](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/systemd/localectl.1.en)
1. [Man page - ls](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ls.1.en)
1. [Man page - less](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/less/less.1.en)
1. [Man page - grep](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/grep/grep.1.en)
1. [Man page - loadkeys](https://jlk.fjfi.cvut.cz/arch/manpages/man/loadkeys.1)

---

## Boot mode

### Verify the boot mode
{: .no_toc .pt-2}

```bash
$ ls /sys/firmware/efi/efivars
```

### INFORMATIONS
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - UEFI](https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface)
1. [Wikipedia - EFI system partition](https://en.wikipedia.org/wiki/EFI_system_partition)

### GUIDES
{: .no_toc .text-delta .pt-2}

1. [ArchWiki - Installation guide - Verify the boot mode](https://wiki.archlinux.org/index.php/Installation_guide#Verify_the_boot_mode)

### MANUALS
{: .no_toc .text-delta .pt-2}

1. [Man page - ls](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ls.1.en)

---

## Internet connection

### Ensure your network interface is listed and enabled
{: .no_toc .pt-2}

```bash
$ ip link
```

### Check connectivity
{: .no_toc .pt-4}

```bash
$ ping -c 3 archlinux.org
```

### GUIDES
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Installation guide - Connect to the internet](https://wiki.archlinux.org/index.php/Installation_guide#Connect_to_the_internet)

### MANUALS
{: .no_toc .text-delta .pt-2}

1. [Man pages - ping](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/iputils/ping.8.en)

---

## System clock

### Update the system clock
{: .no_toc .pt-2}

```bash
# Activate the NTP service
$ timedatectl set-ntp true

# Check the current system clock time, NTP service and the RTC
$ timedatectl
```

### INFORMATIONS
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - System time](https://en.wikipedia.org/wiki/System_time)
1. [Wikipedia - Real time clock](https://en.wikipedia.org/wiki/Real-time_clock)
1. [Wikipedia - Network Time Protocol](https://en.wikipedia.org/wiki/Network_Time_Protocol)

### GUIDES
{: .no_toc .text-delta .pt-2}

1. [ArchWiki - Installation guide - Update the system clock](https://wiki.archlinux.org/index.php/Installation_guide#Update_the_system_clock)
1. [ArchWiki - System time](https://wiki.archlinux.org/index.php/System_time)

### MANUALS
{: .no_toc .text-delta .pt-2}

1. [Man page - timedatectl](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/systemd/timedatectl.1.en)

---

## Mirrorlist

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

### INFORMATIONS
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - Mirror site](https://en.wikipedia.org/wiki/Mirror_site)

### GUIDES
{: .no_toc .text-delta .pt-2}

1. [ArchWiki - Installation guide - Select the mirrors](https://wiki.archlinux.org/index.php/Installation_guide#Select_the_mirrors)
1. [ArchWiki - Pacman - Installing packages](https://wiki.archlinux.org/index.php/Pacman#Installing_packages)
1. [ArchWiki - Pacman - Troubleshooting](https://wiki.archlinux.org/index.php/Pacman#Signature_from_%22User_%3Cemail@example.org%3E%22_is_unknown_trust,_installation_failed)
1. [ArchWiki - Mirrors - Sorting mirrors](https://wiki.archlinux.org/index.php/Mirrors#Sorting_mirrors)
1. [ArchWiki - Reflector](https://wiki.archlinux.org/index.php/Reflector)
