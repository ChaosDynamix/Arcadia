## Logical volume Manager

| Volume | Size recommendation                                                                                               |
| :----- | :---------------------------------------------------------------------------------------------------------------- |
| ROOT   | 15–20 GiB                                                                                                         |
| SWAP   | [VOID Linux recommendations](https://docs.voidlinux.org/installation/live-images/partitions.html#swap-partitions) |
| VAR    | 8–12 GiB                                                                                                          |
| HOME   | 100%FREE                                                                                                          |

### Create the Physical Volume
{: .no_toc}

{% if page.has_multiple_containers %}
```bash
$ pvcreate /dev/mapper/container1 /dev/mapper/container2
```
{% else %}
```bash
$ pvcreate /dev/mapper/container
```
{% endif %}

### Create the Volume Group
{: .no_toc .mt-6}

{% if page.has_multiple_containers %}
```bash
$ vgcreate grp /dev/mapper/container1 /dev/mapper/container2
```
{% else %}
```bash
$ vgcreate grp /dev/mapper/container
```
{% endif %}

### Create the Logical volumes
{: .no_toc .mt-6}

```bash
$ lvcreate -L SIZE grp -n root
$ lvcreate -L SIZE grp -n swap
$ lvcreate -L SIZE grp -n var
$ lvcreate -l 100%FREE grp -n home
```

### Reduce the Home Logical volume size
{: .no_toc .mt-6}

The goal here is to free the space needed by the snapshots volume for the Root volume. You remove 20% of the Home volume size which should be sufficient for the snapshots volume created later.

#### EXAMPLE FOR 20G
{: .no_toc .mt-5}

```bash
$ echo "20*0.2" | bc
$ lvreduce -L -4G /dev/grp/home
```

### Format the Volumes
{: .no_toc .mt-6}

```bash
$ mkfs.ext4 -L ROOT /dev/grp/root
$ mkswap -L SWAP /dev/grp/swap
$ mkfs.ext4 -L VAR /dev/grp/var
$ mkfs.ext4 -L HOME /dev/grp/home
```

### Mount the volumes
{: .no_toc .mt-6}

```bash
$ mount /dev/grp/root /mnt
$ mkdir /mnt/{var,home}
$ mount /dev/grp/var /mnt/var
$ mount /dev/grp/home /mnt/home
```

### Activate the Swap
{: .no_toc .mt-6}

```bash
$ swapon /dev/grp/swap
```

---
