---
layout: default
title: 03 Preparation
nav_order: 4
permalink: /preparation/
---

# Preparation
{: .no_toc .d-inline-block}

PRE
{: .label .mx-2}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Keyboard layout

### List the keymaps
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

### References
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - US keyboard layout image](https://en.wikipedia.org/wiki/File:KB_United_States-NoAltGr.svg)
1. [Wikipedia - Keyboard layout](https://en.wikipedia.org/wiki/Keyboard_layout)
1. [ArchWiki - Installation guide - Set the keyboard layout](https://wiki.archlinux.org/index.php/Installation_guide#Set_the_keyboard_layout)
1. [ArchWiki - Linux console - Keyboard configuration](https://wiki.archlinux.org/index.php/Linux_console/Keyboard_configuration)
1. [Man pages - localectl](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/systemd/localectl.1.en)
1. [Man pages - ls](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ls.1.en)
1. [Man pages - less](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/less/less.1.en)
1. [Man pages - grep](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/grep/grep.1.en)
1. [Man pages - loadkeys](https://jlk.fjfi.cvut.cz/arch/manpages/man/loadkeys.1)

---

## Boot mode

### Verify the boot mode
{: .no_toc .pt-2}

```bash
$ ls /sys/firmware/efi/efivars
```

### References
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - BIOS](https://en.wikipedia.org/wiki/BIOS)
1. [Wikipedia - Boot sector](https://en.wikipedia.org/wiki/Boot_sector)
1. [Wikipedia - UEFI](https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface)
1. [Wikipedia - EFI system partition](https://en.wikipedia.org/wiki/EFI_system_partition)
1. [ArchWiki - Installation guide - Verify the boot mode](https://wiki.archlinux.org/index.php/Installation_guide#Verify_the_boot_mode)

---

## Internet connection

### Ensure your network interface is listed and enabled
{: .no_toc .pt-2}

```bash
ip link
```

{: .fs-3 .mt-0}
The UP in <BROADCAST,MULTICAST,UP,LOWER_UP> is what indicates the interface is up.

### Check connectivity
{: .no_toc .pt-4}

```bash
ping -c 3 archlinux.org
```

{: .fs-3 .mt-0}
-c option limit the ping attempts to the number append to it

### References
{: .no_toc .text-delta .pt-5}

1. [ArchWiki - Installation guide - Connect to the internet](https://wiki.archlinux.org/index.php/Installation_guide#Connect_to_the_internet)
1. [Man pages - ping](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/iputils/ping.8.en)

---

## System clock

### Update the system clock
{: .no_toc .pt-2}

```bash
## Activate the NTP service
timedatectl set-ntp true

## Check the current system clock time, NTP service and the RTC
timedatectl
```

### References
{: .no_toc .text-delta .pt-4}

- [Wikipedia - System time](https://en.wikipedia.org/wiki/System_time)
- [Wikipedia - Real time clock](https://en.wikipedia.org/wiki/Real-time_clock)
- [Wikipedia - Network Time Protocol](https://en.wikipedia.org/wiki/Network_Time_Protocol)
- [ArchWiki - Installation guide - Update the system clock](https://wiki.archlinux.org/index.php/Installation_guide#Update_the_system_clock)
- [ArchWiki - System time](https://wiki.archlinux.org/index.php/System_time)

---

## Mirrorlist

### Update Arch Linux keyring
{: .no_toc .pt-2}

```bash
pacman -Sy archlinux-keyring
```

### Generate a mirrorlist
{: .no_toc .pt-4}

```bash
# Install reflector package
$ pacman -S reflector

# Launch the reflector script with your parameters
$ reflector --country France --age 15 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Select the mirrors](https://wiki.archlinux.org/index.php/Installation_guide#Select_the_mirrors)
- [ArchWiki - Pacman - Installing packages](https://wiki.archlinux.org/index.php/Pacman#Installing_packages)
- [ArchWiki - Pacman - Troubleshooting](https://wiki.archlinux.org/index.php/Pacman#Signature_from_%22User_%3Cemail@example.org%3E%22_is_unknown_trust,_installation_failed)
- [ArchWiki - Mirrors - Sorting mirrors](https://wiki.archlinux.org/index.php/Mirrors#Sorting_mirrors)
- [ArchWiki - Reflector](https://wiki.archlinux.org/index.php/Reflector)
