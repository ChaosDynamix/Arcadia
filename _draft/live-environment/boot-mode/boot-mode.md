---
layout: default
title: Boot mode
permalink: /live-environment/boot-mode/
parent: Live environment
nav_order: 2
---

# Boot mode

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Boot mode

### Verify the boot mode

```
$ ls /sys/firmware/efi/efivars
```

| Firmware           | Result |
| :----------------- | :----- |
| UEFI               | Yes    |
| UEFI with CSM mode | No     |
| BIOS               | No     |

---
