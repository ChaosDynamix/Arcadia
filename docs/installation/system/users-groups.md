---
title: Users and groups
---

# Users and groups
This page describes how to add a password on the root user and how to create an unprivileged user with temporary root privileges.

## Setup the users
Passwords must be complex enough to not be easily guessed from e.g. personal information, or cracked using methods like social engineering or brute-force attacks. The tenets of strong passwords are based on length and randomness.

### Add a root password
```
passwd
```

### Create a user
```
useradd -m -G wheel -s /bin/bash username
passwd username
```

### Uncomment the following line in the Sudo configuration with `EDITOR=nvim visudo`
```
%wheel ALL=(ALL) ALL
```

#### References
1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide#Root_password)
1. [ArchWiki - Users and group](https://wiki.archlinux.org/index.php/Users_and_groups#User_management)
1. [ManPage - Passwd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/shadow/passwd.1.en)
1. [ManPage - Useradd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/shadow/useradd.8.en)
