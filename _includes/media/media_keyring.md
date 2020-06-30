## Update the Arch Linux keyring

The arch linux keyring holds all the signatures related to the packages. During the installation, a package is verified against this keyring to ensure that the downloaded file is properly signed. This keyring need to be updated in order to delete revoked keys and add new trusted keys.

### Update the keys

```
$ pacman -Sy archlinux-keyring
```

If you are not in a live environment context, avoid refreshing the package list without upgrading the system. In practice, do not run `pacman -Sy package_name` instead of `pacman -Syu package_name`, as this could lead to dependency issues.
{: .fs-3}

### References
{: .text-delta .pt-4}

1. [Wikipedia - Keyring](https://en.wikipedia.org/wiki/Keyring_(cryptography))
1. [ArchWiki - Keyring package](https://wiki.archlinux.org/index.php/DeveloperWiki:Keyring_Package)
1. [ArchWiki - Pacman](https://wiki.archlinux.org/index.php/Pacman)
{: .fs-3}
