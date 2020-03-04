---
layout: default
title: 06 Boot setup
nav_order: 7
has_children: true
permalink: /boot-setup/
has_toc: false
---

# Boot setup
{: .d-inline-block .mb-0}

BOO
{: .label .mx-2}

---

## [Ext4](/Andromeda/boot-setup/ext4/)
{: .d-inline-block}

UEFI
{: .label .label-purple .ml-2}

```                                  
Grub                                    Initramfs
+----------------------------------+    +----------------------------------+
| DEFAULT                          |    | DEFAULT                          |
+----------------------------------+    +----------------------------------+
```

---

## [Luks / Lvm](/Andromeda/boot-setup/luks-lvm/)
{: .d-inline-block}

UEFI
{: .label .label-purple .ml-2}

```                                     
Grub                                    Initramfs
+----------------------------------+    +----------------------------------+
| CRYPTDEVICE                      |    | FILES                            |
| /dev/sda2:lvm                    |    | /etc/luks-keys/lvm               |
+----------------------------------+    +----------------------------------+
| CRYPTKEY                         |    | HOOKS                            |
| /etc/luks-key/lvm                |    | encrypt lvm2 keymap              |
+----------------------------------+    |                                  |
| ROOT                             |    |                                  |
| /dev/grp/root                    |    |                                  |
+----------------------------------+    +----------------------------------+
```

---

## [Luks / Btrfs](/Andromeda/boot-setup/luks-btrfs/)
{: .d-inline-block}

UEFI
{: .label .label-purple .ml-2}

```                                     
Grub                                    Initramfs
+----------------------------------+    +----------------------------------+
| CRYPTDEVICE                      |    | BINARIES                         |
| /dev/sda2:btrfs                  |    | /usr/bin/btrfs                   |
+----------------------------------+    +----------------------------------+
| CRYPTKEY                         |    | FILES                            |
| /etc/luks-key/btrfs              |    | /etc/luks-keys/btrfs             |
|                                  |    +----------------------------------+
|                                  |    | HOOKS                            |
|                                  |    | encrypt keymap                   |
+----------------------------------+    +----------------------------------+
```

---

## [Raid1 / Luks / Lvm](/Andromeda/boot-setup/raid1-luks-lvm/)
{: .d-inline-block}

UEFI
{: .label .label-purple .ml-2}

WORK IN PROGRESS
{: .label .label-yellow}

```
Grub                                    Initramfs
+----------------------------------+    +----------------------------------+
| CRYPTDEVICE                      |    | FILES                            |
| /dev/md127:lvm                   |    | /etc/luks-keys/lvm               |
+----------------------------------+    +----------------------------------+
| CRYPTKEY                         |    | HOOKS                            |
| /etc/luks-key/lvm                |    | mdadm_udev encrypt lvm2 keymap   |
+----------------------------------+    |                                  |
| ROOT                             |    |                                  |
| /dev/grp/root                    |    |                                  |
+----------------------------------+    +----------------------------------+
```

---

## [Raid1 / Luks / Btrfs](/Andromeda/boot-setup/raid1-luks-btrfs/)
{: .d-inline-block}

UEFI
{: .label .label-purple .ml-2}

WORK IN PROGRESS
{: .label .label-yellow}

```                                     
Grub                                    Initramfs
+----------------------------------+    +----------------------------------+
| CRYPTDEVICE                      |    | BINARIES                         |
| /dev/md127:btrfs                 |    | /usr/bin/btrfs                   |
+----------------------------------+    +----------------------------------+
| CRYPTKEY                         |    | FILES                            |
| /etc/luks-key/btrfs              |    | /etc/luks-keys/btrfs             |
|                                  |    +----------------------------------+
|                                  |    | HOOKS                            |
|                                  |    | mdadm_udev encrypt keymap        |
+----------------------------------+    +----------------------------------+
```
