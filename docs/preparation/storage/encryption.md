---
title: Encryption
---

# Encryption
This page describes how to setup the system partition encryption of the NVMe storage device. Encryption is made with the cryptsetup program and LUKS2.

## Create the LUKS2 container
``` bash
cryptsetup luksFormat /dev/nvme0n1p2
```

!!! warning
    Passwords must be complex enough to not be easily guessed from e.g. personal information, or cracked using methods like social engineering or brute-force attacks. The tenets of strong passwords are based on length and randomness.

---

## Open the LUKS2 container
``` bash
cryptsetup open /dev/nvme0n1p2 cryptroot
```

---

??? info "References"
    - [Wikipedia - Encryption](https://en.wikipedia.org/wiki/Encryption)
    - [Wikipedia - Dm-crypt](https://en.wikipedia.org/wiki/Dm-crypt)
    - [Wikipedia - LUKS](https://en.wikipedia.org/wiki/Linux_Unified_Key_Setup)
    - [ArchWiki - Dm-crypt/Device encryption](https://wiki.archlinux.org/index.php/Dm-crypt/Device_encryption)
    - [ArchWiki - Dm-crypt/Encrypting an entire system](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system)
    - [ManPage - Cryptsetup](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/cryptsetup/cryptsetup.8.en)
