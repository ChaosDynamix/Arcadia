---
layout: default
title: Accounts
permalink: /configuration/accounts/
parent: Configuration
nav_order: 3
has_toc: false
---

# Configuration of the accounts
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

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

---

### GUIDES
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Security - Passwords](https://wiki.archlinux.org/index.php/Security#Passwords)
1. [ArchWiki - Installation guide - Root password](https://wiki.archlinux.org/index.php/Installation_guide#Root_password)
1. [ArchWiki - Users and groups - User management](https://wiki.archlinux.org/index.php/Users_and_groups#User_management)
1. [ArchWiki - Sudo](https://wiki.archlinux.org/index.php/Sudo)

### MANUALS
{: .no_toc .text-delta .pt-2}

1. [Man pages - useradd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/shadow/useradd.8.en)
1. [Man pages - passwd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/shadow/passwd.1.en)
