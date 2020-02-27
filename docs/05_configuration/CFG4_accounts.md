---
layout: default
title: 04 Accounts
nav_order: 4
parent: 05 Configuration
permalink: /configuration/accounts/
has_children: true
has_toc: false
---

# Configuration of the accounts
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Change the root password

```bash
passwd
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Root password](https://wiki.archlinux.org/index.php/Installation_guide#Root_password)
- [Manual - passwd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/shadow/passwd.1.en)

---

## Create the user

```bash
useradd -m -G wheel,realtime,users -s /bin/bash username
```

### Add a password for the user
{: .no_toc .pt-4}

```bash
passwd username
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Users and groups - User management](https://wiki.archlinux.org/index.php/Users_and_groups#User_management)
- [Manual - useradd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/shadow/useradd.8.en)
- [Manual - passwd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/shadow/passwd.1.en)

---

## Allow the wheel group to use sudo

#### visudo
{: .no_toc .pt-2}

```bash
%wheel ALL=(ALL) ALL
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Sudo](https://wiki.archlinux.org/index.php/Sudo)
