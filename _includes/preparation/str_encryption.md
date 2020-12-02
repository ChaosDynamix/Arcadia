## Encrypt the root partition

Replace every occurence of `/dev/nvme0n1p2` with your device name.

### Create the LUKS2 container
```
cryptsetup luksFormat /dev/nvme0n1p2
```

**Note**: Passwords must be complex enough to not be easily guessed from e.g. personal information, or cracked using methods like social engineering or brute-force attacks. The tenets of strong passwords are based on length and randomness.
{: .fs-3}

### Open the LUKS2 container
```
cryptsetup open /dev/nvme0n1p2 cryptroot
```

### References
{: .text-delta .pt-4}

1. [Wikipedia - Encryption](https://en.wikipedia.org/wiki/Encryption)
1. [Wikipedia - Dm-crypt](https://en.wikipedia.org/wiki/Dm-crypt)
1. [Wikipedia - LUKS](https://en.wikipedia.org/wiki/Linux_Unified_Key_Setup)
1. [ArchWiki - Dm-crypt/Device encryption](https://wiki.archlinux.org/index.php/Dm-crypt/Device_encryption)
1. [ArchWiki - Dm-crypt/Encrypting an entire system](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system)
1. [ManPage - Cryptsetup](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/cryptsetup/cryptsetup.8.en)
{: .fs-3}
