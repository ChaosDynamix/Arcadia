## Setup the Logical Volume Manager

| Node          | Label | Size recommendation |
| :------------ | :---- | :------------------ |
| /dev/grp/root | ROOT  | 15-20 GiB           |
| /dev/grp/swap | SWAP  | > 512 MiB           |
| /dev/grp/var  | VAR   | 8-12 GiB            |
| /dev/grp/home | HOME  | 100%FREE - 5 GiB    |

### Create the Physical Volume
```
$ pvcreate {{ scenario.lvm.pv }}
```

### Create the Volume Group
```
$ vgcreate grp {{ scenario.lvm.pv }}
```

### Create the Logical volumes

Before creating the `HOME` volume, use `vgdisplay` to see how many space are available. The `HOME` volume size is equal to the size of the remaining space minus 5G. The 5G of free space are used later for the snapshot volume.

```
$ lvcreate -L SIZE grp -n root
$ lvcreate -L SIZE grp -n swap
$ lvcreate -L SIZE grp -n var
$ lvcreate -L SIZE grp -n home
```

**Note**: Replace SIZE accordingly.
{: .fs-3}

---

## Setup the volumes

### Format the volumes

#### ext4
```
$ mkfs.ext4 -L ROOT /dev/grp/root
$ mkfs.ext4 -L VAR /dev/grp/var
$ mkfs.ext4 -L HOME /dev/grp/home
```

#### swap
```
$ mkswap -L SWAP /dev/grp/swap
```

### Mount the volumes

```
$ mount /dev/grp/root /mnt
$ mkdir /mnt/{var,home}
$ mount /dev/grp/var /mnt/var
$ mount /dev/grp/home /mnt/home
```

### Activate the Swap

```
$ swapon /dev/grp/swap
```
