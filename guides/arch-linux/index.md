---
title        : !!str Arch Linux
nav_order    : !!int 1
has_children : !!bool true
permalink    : !!str /arch-linux
has_toc       : !!bool false
---

# {{ page.title }}

Arch Linux is an independently developed, x86-64 general-purpose GNU/Linux distribution that strives to provide the latest stable versions of most software by following a rolling-release model. The default installation is a minimal base system, configured by the user to only add what is purposely required. 
{: .fs-5 .fw-300}

## Storage device scheme
{: .text-delta .pt-4}

``` text
+------------------------+------------------------+
| EFI partition          | LUKS type partition    |
+------------------------+------------------------+
                         | LUKS1 container        |
                         +------------------------+
                         | EXT4 filesystem        |
                         +------------------------+
```

## System components
{: .text-delta .pt-4}

| Component              | Name             |
| :--------------------- | :--------------- |
| Kernel                 | Linux-lts        |
| Initialization manager | Systemd          |
| Network manager        | Systemd-networkd |
| Boot manager           | Systemd-boot     |
| Privilege elevation    | Sudo             |
