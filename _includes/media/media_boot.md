## Load the correct Keymap

The default console keymap is US. Skip this step if your keyboard layout match the default one.

![Representation of the US default keyboard layout for Arch Linux](https://upload.wikimedia.org/wikipedia/commons/5/51/KB_United_States-NoAltGr.svg)

### List the keymaps

#### ALL THE KEYMAPS
```
$ ls /usr/share/kbd/keymaps/**/*.map.gz | less
```

#### SPECIFIC KEYMAP
```
$ ls /usr/share/kbd/keymaps/**/*.map.gz | grep -i search_term
```

### Load the correct keymap

##### Example
```
$ loadkeys fr-latin9
```

### References

1. [Wikipedia - Keyboard layout](https://en.wikipedia.org/wiki/Keyboard_layout)
1. [ArchWiki - Keyboard configuration](https://wiki.archlinux.org/index.php/Linux_console/Keyboard_configuration)
1. [ManPage - Ls](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ls.1.en)
1. [ManPage - Less](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/less/less.1.en)
1. [ManPage - Grep](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/grep/grep.1.en)
1. [ManPage - Loadkeys](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/kbd/loadkeys.1.en)
{: .fs-3}

---

## Verify the boot mode

### List the EFI variables

```
$ ls /sys/firmware/efi/efivars
```

If the output is a list of variables, the system is booted in UEFI without CSM mode. If the directory does not exist, the system may be booted in BIOS or UEFI with CSM mode.

| Firmware           | Result | Partitioning mode |
| :----------------- | :----- | :---------------- |
| UEFI               | True   | UEFI / GPT        |
| UEFI with CSM mode | False  | BIOS / GPT        |
| BIOS               | False  | BIOS / GPT        |

### References

1. [Wikipedia - Firmware](https://en.wikipedia.org/wiki/Firmware)
1. [Wikipedia - BIOS](https://en.wikipedia.org/wiki/BIOS)
1. [Wikipedia - UEFI](https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface)
1. [ArchWiki - UEFI](https://wiki.archlinux.org/index.php/Unified_Extensible_Firmware_Interface)
1. [ManPage - Ls](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ls.1.en)
{: .fs-3}

---

## Setup the live environment network

### Ensure your network interface is listed and enabled
```
$ ip link
```

### Check connectivity
```
$ ping -c 3 archlinux.org
```

### Update the system clock
```
$ timedatectl set-ntp true
```

### References

1. [Wikipedia - Computer network](https://en.wikipedia.org/wiki/Computer_network)
1. [ArchWiki - Network configuration](https://wiki.archlinux.org/index.php/Network_configuration)
1. [ArchWiki - System time](https://wiki.archlinux.org/index.php/System_time)
1. [ManPage - Ip](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/man-pages/ip.7.en)
1. [ManPage - Ping](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/iputils/ping.8.en)
1. [ManPage - Timedatectl](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/systemd/timedatectl.1.en)
{: .fs-3}

---

## Update the Arch Linux keyring

The arch linux keyring holds all the signatures related to the packages. During the installation, a package is verified against this keyring to ensure that the downloaded file is properly signed. This keyring need to be updated in order to delete revoked keys and add new trusted keys.

```
$ pacman -Sy archlinux-keyring
```

If you are not in a live environment context, avoid refreshing the package list without upgrading the system. In practice, do not run `pacman -Sy package_name` instead of `pacman -Syu package_name`, as this could lead to dependency issues.

### References

1. [Wikipedia - Keyring](https://en.wikipedia.org/wiki/Keyring_(cryptography))
1. [ArchWiki - Keyring package](https://wiki.archlinux.org/index.php/DeveloperWiki:Keyring_Package)
1. [ArchWiki - Pacman](https://wiki.archlinux.org/index.php/Pacman)
{: .fs-3}

---

## Generate the mirrorlist

### Install the reflector package

Reflector is a script which can retrieve the latest mirror list from the MirrorStatus page, filter the most up-to-date mirrors, sort them by speed and overwrite the file `/etc/pacman.d/mirrorlist`.

```
$ pacman -S reflector
```

### Launch the reflector script with your arguments

##### Example
```
$ reflector -c FR -a 15 -p https --sort rate --save /etc/pacman.d/mirrorlist
```

| Argument | Description                                                                                                                         |
| :------- | :---------------------------------------------------------------------------------------------------------------------------------- |
| -c       | Match one of the given countries (case-sensitive). Use `reflector --list-countries` to see which are available                      |
| -a       | Only return mirrors that have synchronized in the last n hours. n may be an integer or a decimal number                             |
| -p       | March one of the given protocols, e.g "http", "https", "ftp"                                                                        |
| --sort   | Sort the mirrorlist. "rate": download rate; "country": server's location; "score": MirrorStatus score; "delay": MirrorStatus delay. |
| --save   | Save the mirrorlist to the given path.                                                                                              |

### Check the result of the script
```
$ cat /etc/pacman.d/mirrorlist
```

If the script worked as intended, the header of the file should be : **Arch Linux mirrorlist generated by Reflector**.

### References

1. [ArchWiki - Mirrors](https://wiki.archlinux.org/index.php/Mirrors)
1. [ArchWiki - Reflector](https://wiki.archlinux.org/index.php/Reflector)
1. [ArchWiki - Pacman](https://wiki.archlinux.org/index.php/Pacman)
1. [ManPage - Reflector](https://jlk.fjfi.cvut.cz/arch/manpages/man/community/reflector/reflector.1.en) 
1. [ManPage - Cat](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/cat.1.en)
{: .fs-3}
