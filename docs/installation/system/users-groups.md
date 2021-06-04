---
title: Users and groups
---

# Users and groups
This page describes how to add a password on the root user and how to create an unprivileged user with temporary root privileges.

## Add a root password
``` bash
passwd
```

!!! warning
    Passwords must be complex enough to not be easily guessed from e.g. personal information, or cracked using methods like social engineering or brute-force attacks. The tenets of strong passwords are based on length and randomness.

---

## Create a user
``` bash
useradd -m -G wheel -s /bin/bash username
passwd username
```

!!! warning
    Passwords must be complex enough to not be easily guessed from e.g. personal information, or cracked using methods like social engineering or brute-force attacks. The tenets of strong passwords are based on length and randomness.

---

## Sudo configuration

### Edit the sudo configuration file 
``` bash
EDITOR=nano visudo
```

### Uncomment the following line
```
%wheel ALL=(ALL) ALL
```

---

??? info "References"
    - [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide#Root_password)
    - [ArchWiki - Users and group](https://wiki.archlinux.org/index.php/Users_and_groups#User_management)
    - [ManPage - Passwd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/shadow/passwd.1.en)
    - [ManPage - Useradd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/shadow/useradd.8.en)
