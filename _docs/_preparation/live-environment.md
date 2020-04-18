---
title: Live environment
nav_order: 3
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Keyboard layout

### List the keymaps

Choose one of the two commands

#### LIST ALL THE KEYMAPS
```
$ ls /usr/share/kbd/keymaps/**/*.map.gz | less
```

#### SEARCH SPECIFIC KEYMAP
```
$ ls /usr/share/kbd/keymaps/**/*.map.gz | grep -i search_term
```

### Load the keymap

Replace fr-latin9 accordingly

```
$ loadkeys fr-latin9
```

---

## Boot mode

### Verify the boot mode

```
$ ls /sys/firmware/efi/efivars
```

| Firmware           | Result |
| :----------------- | :----- |
| UEFI               | Yes    |
| UEFI with CSM mode | No     |
| BIOS               | No     |

---

## Internet connection

### Ensure your network interface is listed and enabled

```
$ ip link
```

### Check connectivity

```
$ ping -c 3 archlinux.org
```

---

## System clock

### Activate the NTP service

```
$ timedatectl set-ntp true
```

### Check the current system clock time, NTP service and the RTC

```
$ timedatectl
```

---

## Arch Linux keyring

The arch linux keyring holds all the signatures related to the packages. During the installation, a package is verified against this keyring to ensure that the downloaded file is properly signed. This keyring need to be updated in order to delete revoked keys and add new trusted keys.

```
$ pacman -Sy archlinux-keyring
```

If you are not in a live environment context, avoid refreshing the package list without upgrading the system. In practice, do not run `pacman -Sy package_name` instead of `pacman -Syu package_name`, as this could lead to dependency issues.

---

## Mirrorlist

### Install reflector package

Reflector is a script which can retrieve the latest mirror list from the MirrorStatus page, filter the most up-to-date mirrors, sort them by speed and overwrite the file `/etc/pacman.d/mirrorlist`.

```
$ pacman -S reflector
```

### Launch the reflector script with your arguments

| Argument | Description                                                                                                                         |
| :------- | :---------------------------------------------------------------------------------------------------------------------------------- |
| -c       | Match one of the given countries (case-sensitive). Use `reflector --list-countries` to see which are available                                  |
| -a       | Only return mirrors that have synchronized in the last n hours. n may be an integer or a decimal number                             |
| -p       | March one of the given protocols, e.g "http", "https", "ftp"                                                                        |
| --sort   | Sort the mirrorlist. "rate": download rate; "country": server's location; "score": MirrorStatus score; "delay": MirrorStatus delay. |
| --save   | Save the mirrorlist to the given path.                                                                                              |

#### EXAMPLE

```
$ reflector -c FR -a 15 -p https --sort rate --save /etc/pacman.d/mirrorlist
```
