{%- assign scenario = site.data.system.storage.lvm.scenario[page.parent_uuid] %}

## Setup the Logical Volume Manager

| Node                 | label     | Size recommendation |
| :------------------- | :-------- | :------------------ |
| `/dev/grp/cryptroot` | CRYPTROOT | 23-32 GiB           |
| `/dev/grp/cryptswap` | CRYPTSWAP | > 512M              |
| `/dev/grp/crypthome` | CRYPTHOME | 100%FREE            |

### Create the Physical Volume

```
$ pvcreate {{ scenario.node_list }}
```

### Create the Volume Group

```
$ vgcreate grp {{ scenario.node_list }}
```

### Create the Logical volumes

```
$ lvcreate -L SIZE grp -n cryptroot
$ lvcreate -L SIZE grp -n cryptswap
$ lvcreate -l 100%FREE grp -n crypthome
```

{% include system/storage/encryption.md %}

### Format the Root container

```
$ mkfs.ext4 -L ROOT /dev/mapper/root
```

### Mount the Root container

```
$ mount /dev/mapper/root /mnt
```
