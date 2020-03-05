---
layout: default
title: 05 Configuration
nav_order: 6
permalink: /configuration/
---

# Configuration
{: .no_toc .d-inline-block .mb-0}

CFG
{: .label .mx-2}

---

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Time zone

### Create symbolic link
{: .no_toc .pt-2}

```bash
$ ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
```

### Synchronize the hardware clock with the system clock
{: .no_toc .pt-4}

```bash
$ hwclock --systohc --utc
```

### References
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - Time zone](https://en.wikipedia.org/wiki/Time_zone)
1. [Wikipedia - System time](https://en.wikipedia.org/wiki/System_time)
1. [Wikipedia - Real time clock](https://en.wikipedia.org/wiki/Real-time_clock)
1. [ArchWiki - Installation guide - Time zone](https://wiki.archlinux.org/index.php/Installation_guide#Time_zone)
1. [ArchWiki - System time - Time zone](https://wiki.archlinux.org/index.php/System_time#Time_zone)
1. [ArchWiki - System time - Hardware clock](https://wiki.archlinux.org/index.php/System_time#Hardware_clock)
1. [Man pages - ln](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ln.1.en)
1. [Man pages - hwclock](https://jlk.fjfi.cvut.cz/arch/manpages/man/hwclock.8)

---

## Localization

### Select needed locales
{: .no_toc .pt-2}

/etc/locale.gen
{: .fs-3 .mb-0}

```bash
# Uncomment the needed locales
fr_FR.UTF-8 UTF-8
en_US.UTF-8 UTF-8
```

### Generate locales
{: .no_toc .pt-4}

```bash
$ locale-gen
```

### Set the system locale
{: .no_toc .pt-4}

/etc/locale.conf
{: .fs-3 .mb-0}

```bash
LANG=fr_FR.UTF-8
LC_COLLATE=C
```

### Set the console locale
{: .no_toc .pt-4}

/etc/vconsole.conf
{: .fs-3 .mb-0}

```bash
KEYMAP=fr-latin9
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Installation guide - Localization](https://wiki.archlinux.org/index.php/Installation_guide#Localization)
1. [ArchWiki - Locale](https://wiki.archlinux.org/index.php/Locale)
1. [ArchWiki - Linux console - Keyboard configuration](https://wiki.archlinux.org/index.php/Linux_console/Keyboard_configuration)

---

## Network

### Set the hostname
{: .no_toc .pt-2}

/etc/hostname
{: .fs-3 .mb-0}

```bash
myhostname
```

### Set the hosts
{: .no_toc .pt-4}

/etc/hosts
{: .fs-3 .mb-0}

```bash
127.0.0.1   localhost
::1         localhost
127.0.1.1   myhostname.localdomain	myhostname
```

### Install a manager
{: .no_toc .pt-4}

```bash
$ pacman -S networkmanager
$ systemctl enable NetworkManager
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Installation guide - Network configuration](https://wiki.archlinux.org/index.php/Installation_guide#Network_configuration)
1. [ArchWiki - Network configuration - Set the hostname](https://wiki.archlinux.org/index.php/Network_configuration#Set_the_hostname)
1. [ArchWiki - Network configuration - Network managers](https://wiki.archlinux.org/index.php/Network_configuration#Network_managers)
1. [ArchWiki - NetworkManager](https://wiki.archlinux.org/index.php/NetworkManager)
1. [ArchWiki - Systemctl - Basic systemctl usage](https://wiki.archlinux.org/index.php/Systemd#Basic_systemctl_usage)
1. [Man pages - systemctl](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/systemd/systemctl.1.en)

---

## Accounts

### About passwords stength
{: .no_toc .pt-2}

Passwords must be complex enough to not be easily guessed from e.g. personal information, or cracked using methods like social engineering or brute-force attacks. The tenets of strong passwords are based on length and randomness.

### Change the root password
{: .no_toc .pt-4}

```bash
$ passwd
```

### Create the user and his password
{: .no_toc .pt-4}

```bash
# Account
$ useradd -m -G wheel -s /bin/bash username

# Password
$ passwd username
```

### Allow the wheel group to use sudo
{: .no_toc .pt-4}

visudo
{: .fs-3 .mb-0}

```bash
# Uncomment the line below
%wheel ALL=(ALL) ALL
```

### Enforcing strong passwords using pam_cracklib
{: .no_toc .pt-4}

/etc/pam.d/passwd
{: .fs-3 .mb-0}

```bash
password required pam_cracklib.so retry=2 minlen=10 difok=6 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Security - Passwords](https://wiki.archlinux.org/index.php/Security#Passwords)
1. [ArchWiki - Installation guide - Root password](https://wiki.archlinux.org/index.php/Installation_guide#Root_password)
1. [ArchWiki - Users and groups - User management](https://wiki.archlinux.org/index.php/Users_and_groups#User_management)
1. [ArchWiki - Sudo](https://wiki.archlinux.org/index.php/Sudo)
1. [Man pages - useradd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/shadow/useradd.8.en)
1. [Man pages - passwd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/shadow/passwd.1.en)
