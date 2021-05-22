---
title           : !!str Home
layout          : !!str default
nav_exclude     : !!bool true
---

# Personal guide for installing Arch Linux on LUKS and UEFI.
{: .fs-9}

Arch Linux is an independently developed, x86-64 general-purpose GNU/Linux distribution that strives to provide the latest stable versions of most software by following a rolling-release model. The default installation is a minimal base system, configured by the user to only add what is purposely required. 
{: .fs-5 .fw-300}

---

## Caution
This project should be used at your own risk, always check the official documentation and the provided sources when using thise guide.

---

## Hardware requirements
{: .text-delta .pt-4}

| Hardware            | Requirement      |
| :------------------ | :--------------- |
| Firmware            | UEFI             |
| CPU                 | Intel            |
| GPU                 | Nvidia           |
| Storage device      | NVMe             |
| Installation medium | USB flash device |
| Network type        | Ethernet         |

---

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

---

## System components
{: .text-delta .pt-4}

| Component              | Name            |
| :--------------------- | :-------------- |
| Kernel                 | Linux-lts       |
| Initialization manager | Busybox         |
| Network manager        | Network Manager |
| Boot manager           | Systemd-boot    |
| Privilege elevation    | Sudo            |
