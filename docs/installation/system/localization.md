---
title: Localization
---

# Localization
This page describes how to generate the locales, set the language of the system and set a keymap for the console.

## Select the needed locales in `/etc/locale.gen`
Uncomment the needed locales

```
fr_FR.UTF-8 UTF-8
```

**Note**: This command select the French locale, if this is not your language, dont uncomment this line and uncomment yours.

---
 
## Generate the locales
``` bash
locale-gen
```

---

## Set the system locale in `/etc/locale.conf`
``` conf
LANG=fr_FR.UTF-8
LC_COLLATE=C
```

!!! note
    Setting `LC_COLLATE` variable to `C` make the ls command sort dotfiles first, followed by uppercase and lowercase filenames. To get around potential issues, Arch used to set `LC_COLLATE=C `in `/etc/profile`, but this method is now deprecated.

---

## Set the console locale
A persistent keymap can be set in `/etc/vconsole.conf`, which is read by systemd on start-up. The `KEYMAP` variable is used for specifying the keymap. If the variable is empty or not set, the us keymap is used as default value.

``` bash
echo KEYMAP=fr-latin9 > /etc/vconsole.conf
```

!!! note
    This command set the French keyboard layout, if this is not your keyboard layout, replace `fr-latin9` with yours.

---

??? info "References"
    - [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide#Localization)
    - [ArchWiki - Locale](https://wiki.archlinux.org/index.php/Locale)
    - [ArchWiki - Linux console / Keyboard configuration](https://wiki.archlinux.org/index.php/Linux_console/Keyboard_configuration)
    - [ManPage - Echo](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/echo.1.en)
