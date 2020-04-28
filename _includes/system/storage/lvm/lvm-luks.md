{%- assign scenario = site.data.system.storage.lvm.scenario[page.parent_uuid] %}

## Setup the Logical Volume Manager

| Node            | label | Size recommendation |
| :-------------- | :---- | :------------------ |
| `/dev/grp/root` | ROOT  | 15-20 GiB           |
| `/dev/grp/swap` | SWAP  | > 512M              |
| `/dev/grp/var`  | VAR   | 8-12 GiB            |
| `/dev/grp/home` | HOME  | 100%FREE - 5G       |

### Create the Physical Volume

```
$ pvcreate {{ scenario.node_list }}
```

### Create the Volume Group

```
$ vgcreate grp {{ scenario.node_list }}
```

### Create the Logical volumes

Before creating the `HOME` volume, use `vgdisplay` to see how many space are available. The `HOME` volume size is equal to the size of the remaining space minus 5G. The 5G of free space are used later for the snapshot volume.

```
$ lvcreate -L SIZE grp -n root
$ lvcreate -L SIZE grp -n swap
$ lvcreate -L SIZE grp -n var
$ lvcreate -L SIZE grp -n home
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

##### Output
```text
{{ scenario.map -}}
```
