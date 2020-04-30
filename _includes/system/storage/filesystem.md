### Format the Root container

```
$ mkfs.ext4 -L ROOT /dev/mapper/root
```

### Mount the Root container

```
$ mount /dev/mapper/root /mnt
```

### Format the Volumes

```
$ mkfs.ext4 -L ROOT /dev/grp/root
$ mkfs.ext4 -L VAR /dev/grp/var
$ mkfs.ext4 -L HOME /dev/grp/home
```

### Mount the volumes

```
$ mount /dev/grp/root /mnt
$ mkdir /mnt/{var,home}
$ mount /dev/grp/var /mnt/var
$ mount /dev/grp/home /mnt/home
```

### Setup the Swap volume

```
$ mkswap -L SWAP /dev/grp/swap
$ swapon /dev/grp/swap
```

### Verify the informations about the filesystems
```
$ lsblk -f
```
