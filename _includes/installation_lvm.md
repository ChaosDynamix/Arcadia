{% assign scenario = include.data %}

## Setup the Logical Volume Manager

{% if scenario.has-encrypted-volumes %}
| Volume | Size recommendation                                                                                               |
| :----- | :---------------------------------------------------------------------------------------------------------------- |
| ROOT   | 23–32 GiB                                                                                                         |
| SWAP   | [VOID Linux recommendations](https://docs.voidlinux.org/installation/live-images/partitions.html#swap-partitions) |
| HOME   | 100%FREE                                                                                                          |
{% else %}
| Volume | Size recommendation                                                                                               |
| :----- | :---------------------------------------------------------------------------------------------------------------- |
| ROOT   | 15–20 GiB                                                                                                         |
| SWAP   | [VOID Linux recommendations](https://docs.voidlinux.org/installation/live-images/partitions.html#swap-partitions) |
| VAR    | 8–12 GiB                                                                                                          |
| HOME   | 100%FREE                                                                                                          |
{% endif %}

### Create the Physical Volume
{: .no_toc}

```bash
$ pvcreate {{ scenario.pv-and-vg-create }}
```

### Create the Volume Group
{: .no_toc .mt-6}

```bash
$ vgcreate grp {{ scenario.pv-and-vg-create }}
```

### Create the Logical volumes
{: .no_toc .mt-6}

{% if scenario.has-encrypted-volumes %}
```bash
$ lvcreate -L SIZE grp -n cryptswap
$ lvcreate -L SIZE grp -n cryptroot
$ lvcreate -l 100%FREE grp -n crypthome
```

### Setup the Root volume
{: .no_toc .mt-6}

```bash
$ cryptsetup --type luks1 luksFormat /dev/grp/cryptroot
$ cryptsetup open /dev/grp/cryptroot root
$ mkfs.ext4 -L ROOT /dev/mapper/root
$ mount /dev/mapper/root /mnt
```

{% else %}
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
{% endif %}

---
