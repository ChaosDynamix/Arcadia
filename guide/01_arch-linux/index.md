---
title        : !!str Arch Linux
nav_order    : !!int 1
has_children : !!bool true
permalink    : !!str /arch-linux
---

# {{ page.title }}

Arch Linux is an independently developed, x86-64 general-purpose GNU/Linux distribution that strives to provide the latest stable versions of most software by following a rolling-release model. The default installation is a minimal base system, configured by the user to only add what is purposely required. 
{: .fs-5 .fw-300}

``` text
Device
+------------------------+----------------------------------+
| EFI partition          | LUKS type partition              |
+------------------------+----------------------------------+
                         | Dm-crypt / LUKS1 container       |
                         +----------------------------------+
                         | EXT4 filesystem                  |
                         +----------------------------------+
```

#### References
{: .text-delta .pt-4}

1. [ArchWiki - Arch Linux](https://wiki.archlinux.org/index.php/Arch_Linux)
{: .fs-3}
