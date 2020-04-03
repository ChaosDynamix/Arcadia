## Mirrorlist

### Update Arch Linux keyring
{: .no_toc .mt-4}

The arch linux keyring holds all the signatures related to the packages. During the installation, a package is verified against this keyring to ensure that the downloaded file is properly signed. This keyring need to be updated in order to delete revoked keys and add new trusted keys.

```bash
$ pacman -Sy archlinux-keyring
```

If you are not in a live environment context, avoid refreshing the package list without upgrading the system. In practice, do not run `pacman -Sy package_name` instead of `pacman -Syu package_name`, as this could lead to dependency issues.

### Install reflector package
{: .no_toc .mt-6}

Reflector is a script which can retrieve the latest mirror list from the MirrorStatus page, filter the most up-to-date mirrors, sort them by speed and overwrite the file `/etc/pacman.d/mirrorlist`.

```bash
$ pacman -S reflector
```

### Launch the reflector script with your arguments
{: .no_toc .mt-6}

| Argument | Description                                                                                                                         |
| :------- | :---------------------------------------------------------------------------------------------------------------------------------- |
| -c       | Match one of the given countries (case-sensitive). Use `reflector --list-countries` to see which are available                                  |
| -a       | Only return mirrors that have synchronized in the last n hours. n may be an integer or a decimal number                             |
| -p       | March one of the given protocols, e.g "http", "https", "ftp"                                                                        |
| --sort   | Sort the mirrorlist. "rate": download rate; "country": server's location; "score": MirrorStatus score; "delay": MirrorStatus delay. |
| --save   | Save the mirrorlist to the given path.                                                                                              |

#### EXAMPLE
{: .no_toc .mt-5}

```bash
$ reflector -c FR -a 15 -p https --sort rate --save /etc/pacman.d/mirrorlist
```

---
