---
title     : !!str Localization
nav_order : !!int 4
permalink : !!str /system/localization
parent    : !!str System
---

# {{ page.title }}
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Setup the localization

### Select the needed locales in `/etc/locale.gen`

Uncomment the needed locales

```
fr_FR.UTF-8 UTF-8
```

**Note**: This command select the French locale, if this is not your language, dont uncomment this line and uncomment yours.
{: .fs-3}

### Generate the locales

```
locale-gen
```

### Set the system locale in `/etc/locale.conf`

```
LANG=fr_FR.UTF-8
LC_COLLATE=C
```

**Note**: Setting `LC_COLLATE` variable to `C` make the ls command sort dotfiles first, followed by uppercase and lowercase filenames. To get around potential issues, Arch used to set `LC_COLLATE=C `in `/etc/profile`, but this method is now deprecated.
{: .fs-3}

### Set the console locale

A persistent keymap can be set in `/etc/vconsole.conf`, which is read by systemd on start-up. The `KEYMAP` variable is used for specifying the keymap. If the variable is empty or not set, the us keymap is used as default value.

```
echo KEYMAP=fr-latin9 > /etc/vconsole.conf
```

**Note**: This command set the French keyboard layout, if this is not your keyboard layout, replace `fr-latin9` with yours.
{: .fs-3}

#### References
{: .text-delta .pt-4}

1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide#Localization)
1. [ArchWiki - Locale](https://wiki.archlinux.org/index.php/Locale)
1. [ArchWiki - Linux console / Keyboard configuration](https://wiki.archlinux.org/index.php/Linux_console/Keyboard_configuration)
1. [ManPage - Echo](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/echo.1.en)
{: .fs-3}
