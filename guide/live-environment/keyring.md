---
title     : !!str Keyring
nav_order : !!int 4
permalink : !!str /live-environment/keyring
parent    : !!str Live environment
---

# {{ page.title }}
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Update the Arch Linux keyring

The arch linux keyring holds all the signatures related to the packages. During the installation, a package is verified against this keyring to ensure that the downloaded file is properly signed. This keyring need to be updated in order to delete revoked keys and add new trusted keys.

### Update the keys

```
pacman -Sy archlinux-keyring
```

**Note**: Running `pacman -Sy` instead of `pacman -Syu` is not recommended as this could lead to dependency issues. However we are not able to update the live environment due to it's immutable state.
{: .fs-3}

### References
{: .text-delta .pt-4}

1. [Wikipedia - Keyring](https://en.wikipedia.org/wiki/Keyring_(cryptography))
1. [ArchWiki - Keyring package](https://wiki.archlinux.org/index.php/DeveloperWiki:Keyring_Package)
1. [ArchWiki - Pacman](https://wiki.archlinux.org/index.php/Pacman)
{: .fs-3}
