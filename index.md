---
title           : !!str Home
layout          : !!str default
nav_exclude     : !!bool true
---

# Personal guides for installing specific Linux distributions with UEFI mode and encryption.
{: .fs-9}

---

## Caution
This project should be used at your own risk, always check the official documentation and the provided sources when using these guides.

---

## Hardware requirements

### UEFI system
The project guides are intended for the UEFI without CSM mode. Guid partition table will be used for the storage device preparation.

### Intel processors
The project guides are intended for the Intel processors. Amd processors can run Arch Linux but are not covered in those guides.

### NVMe storage device
The project guides are intended for NVMe storage devices. If you dont have a NVMe drive, dont enable TRIM feature and replace all the occurence of the NVMe filenames (e.g. `/dev/nvme0n1p1`).

### USB storage device
USB storage devices are used as the live environment system for installing the linux distribution.

