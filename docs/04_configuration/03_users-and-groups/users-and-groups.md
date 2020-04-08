---
layout: default
title: Users and groups
permalink: /configuration/users-and-groups/
parent: Configuration
nav_order: 3
---

# Configuration / Users and groups

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Change the root password

Passwords must be complex enough to not be easily guessed from e.g. personal information, or cracked using methods like social engineering or brute-force attacks. The tenets of strong passwords are based on length and randomness.

```
$ passwd
```

---

## Create the user and his password

| Argument       | Description                                                       |
| :------------- | :---------------------------------------------------------------- |
| -m             | Create the user's home directory if it does not exist             |
| -G             | A list of supplementary groups which the user is also a member of |
| -s             | The name of the user's login shell                                |

```
# Account
$ useradd -m -G wheel -s /bin/bash username

# Password
$ passwd username
```

---

## Allow the wheel group to use sudo

##### EDITOR=vim visudo
```
# Uncomment the line below
%wheel ALL=(ALL) ALL
```

---

## Enforcing strong passwords using pam_cracklib

##### /etc/pam.d/passwd
```
password required pam_cracklib.so retry=2 minlen=10 difok=6 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1
```

---

## Reboot

```
$ exit
$ umount -R /mnt
$ reboot
```

---

## References
{: .no_toc}

#### USERS AND GROUPS
- [ArchWiki - Users and groups - User management](https://wiki.archlinux.org/index.php/Users_and_groups#User_management)

#### PASSWORD
- [ArchWiki - Security - Passwords](https://wiki.archlinux.org/index.php/Security#Passwords)
- [ArchWiki - Installation guide - Root password](https://wiki.archlinux.org/index.php/Installation_guide#Root_password)

#### SUDO
- [ArchWiki - Sudo](https://wiki.archlinux.org/index.php/Sudo)

#### MANUALS
- [Man pages - useradd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/shadow/useradd.8.en)
- [Man pages - passwd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/shadow/passwd.1.en)
