DD copies a file (from standard input to standard output, by default) with a changeable I/O block size, while optionally performing conversions on it.

### List your devices

Identify your USB flash device node.

```
$ fdisk -l
```

### Flash the USB flash device

Edit `path/to/archlinux.iso` and `sdX` accordingly

```
$ dd bs=4M if=path/to/archlinux.iso of=/dev/sdX status=progress oflag=sync
```
