{% case include.step %}
  {% when 1 %}
## Setup the Logical Volume Manager

| Node               | Label     | Size recommendation |
| :----------------- | :-------- | :------------------ |
| /dev/grp/cryptroot | CRYPTROOT | 23-32 GiB           |
| /dev/grp/cryptswap | CRYPTSWAP | > 512 MiB           |
| /dev/grp/crypthome | CRYPTHOME | 100%FREE            |

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
$ lvcreate -L SIZE grp -n cryptroot
$ lvcreate -L SIZE grp -n cryptswap
$ lvcreate -L SIZE grp -n crypthome
```

**Note**: Replace SIZE accordingly.
{: .fs-3}

---

## Setup the Root container

### Format the container

#### ext4
```
$ mkfs.ext4 -L ROOT /dev/mapper/root
```

### Mount the container

```
$ mount /dev/mapper/root /mnt
```
  {% when 2 %}
## Setup the Home container

### Format the container

#### ext4
```
$ mkfs.ext4 -L HOME /dev/mapper/home
```

### Mount the container

```
$ mount /dev/mapper/home /mnt/home
```
{% endcase %}
