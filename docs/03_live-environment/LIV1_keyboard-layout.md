---
layout: default
title: Keyboard layout
permalink: /live-environment/keyboard-layout/
parent: Live environment
nav_order: 1
---

# Live environment keyboard layout

---

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

### GUIDES
{: .no_toc .text-delta .pt-2}

1. [ArchWiki - Installation guide - Set the keyboard layout](https://wiki.archlinux.org/index.php/Installation_guide#Set_the_keyboard_layout)
1. [ArchWiki - Linux console - Keyboard configuration](https://wiki.archlinux.org/index.php/Linux_console/Keyboard_configuration)
1. [ArchWiki - Installation guide - Verify the boot mode](https://wiki.archlinux.org/index.php/Installation_guide#Verify_the_boot_mode)
1. [ArchWiki - Installation guide - Connect to the internet](https://wiki.archlinux.org/index.php/Installation_guide#Connect_to_the_internet)
1. [ArchWiki - Installation guide - Update the system clock](https://wiki.archlinux.org/index.php/Installation_guide#Update_the_system_clock)
1. [ArchWiki - System time](https://wiki.archlinux.org/index.php/System_time)
1. [ArchWiki - Installation guide - Select the mirrors](https://wiki.archlinux.org/index.php/Installation_guide#Select_the_mirrors)
1. [ArchWiki - Pacman - Installing packages](https://wiki.archlinux.org/index.php/Pacman#Installing_packages)
1. [ArchWiki - Pacman - Troubleshooting](https://wiki.archlinux.org/index.php/Pacman#Signature_from_%22User_%3Cemail@example.org%3E%22_is_unknown_trust,_installation_failed)
1. [ArchWiki - Mirrors - Sorting mirrors](https://wiki.archlinux.org/index.php/Mirrors#Sorting_mirrors)
1. [ArchWiki - Reflector](https://wiki.archlinux.org/index.php/Reflector)

### MANUALS
{: .no_toc .text-delta .pt-2}

1. [Man page - localectl](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/systemd/localectl.1.en)
1. [Man page - ls](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ls.1.en)
1. [Man page - less](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/less/less.1.en)
1. [Man page - grep](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/grep/grep.1.en)
1. [Man page - loadkeys](https://jlk.fjfi.cvut.cz/arch/manpages/man/loadkeys.1)
1. [Man pages - ping](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/iputils/ping.8.en)
1. [Man page - timedatectl](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/systemd/timedatectl.1.en)
