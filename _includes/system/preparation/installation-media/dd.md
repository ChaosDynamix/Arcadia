### List your devices

```
$ fdisk -l
```

### Flash the USB flash device

Edit path/to/archlinux.iso and sdX accordingly

```
$ dd bs=4M if=path/to/archlinux.iso of=/dev/sdX status=progress oflag=sync
```
