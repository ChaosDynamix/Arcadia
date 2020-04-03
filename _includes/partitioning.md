## Partitioning

{% if page.has_multiple_containers %}
Be aware that each device must be unlock during boot time which is not the easiest solution if you have a lot of devices. Workarounds can be found to unlock multiple devices with the same passphrase but there are not covered in this guide.
{: .mb-6}
{% elsif page.has_raid %}
If you have more than 2 devices, just clone one of the device with the command `sgdisk -R=/dev/sdc /dev/sdb` and make sure to create new GUID for each of them with `sgdisk -G /dev/sdc`.

The first command create the partition table and the partitions on the devices (with the same GUID). The second command create a new partition GUID for the second device in order to identify each device properly.
{% endif %}

{% for mode in site.data.partitioning-modes %}

### {{ mode.name }}
{: .no_toc .text-delta .mt-6}

  {% if page.parent == "Logical Volume Manager" or page.parent == "B-tree filesystem" %}
    {% case page.title %}
      {% when "Luks on single partition" %}

```bash
$ sgdisk -o {{ mode.command-creation }} -n=2:0:0 {{ mode.command-partype }} -t=2:8309 /dev/sda
```

| Partition | Partition type            | Size                      |
| :-------- | :------------------------ | :------------------------ |
| /dev/sda1 | {{ mode.partition-type }} | {{ mode.partition-size }} |
| /dev/sda2 | Linux LUKS partition      | 100%FREE                  |

      {% when "Luks on device" %}

```bash
$ sgdisk -o {{ mode.command-creation }} -n=2:0:0 {{ mode.command-partype }} -t=2:8300 /dev/sdb
```

| Partition | Partition type            | Size                      |
| :-------- | :------------------------ | :------------------------ |
| /dev/sdb1 | {{ mode.partition-type }} | {{ mode.partition-size }} |
| /dev/sdb2 | Linux filesystem          | 100%FREE                  |

      {% when "Luks on multiple partitions" %}

```bash
$ sgdisk -o {{ mode.command-creation }} -n=2:0:0 {{ mode.command-partype }} -t=2:8309 /dev/sda
$ sgdisk -o -n=1:0:0 -t=1:8309 /dev/sdb
```

| Device | Partition | Partition type            | Size                      |
| :----- | :-------- | :------------------------ | :------------------------ |
| 1      | /dev/sda1 | {{ mode.partition-type }} | {{ mode.partition-size }} |
| 1      | /dev/sda2 | Linux LUKS partition      | 100%FREE                  |
| 2      | /dev/sdb1 | Linux LUKS partition      | 100%FREE                  |

      {% when "Luks on Raid1" %}

```bash
$ sgdisk -o {{ mode.command-creation }} -n=2:0:-100M {{ mode.command-partype }} -t=2:fd00 -R=/dev/sdb /dev/sda
$ sgdisk -G /dev/sdb
```

| Device | Partition | Partition type            | Size                      |
| :----- | :-------- | :------------------------ | :------------------------ |
| 1      | /dev/sda1 | {{ mode.partition-type }} | {{ mode.partition-size }} |
| 1      | /dev/sda2 | Linux RAID partition      | 100%FREE - 100M           |
| 2      | /dev/sdb1 | {{ mode.partition-type }} | {{ mode.partition-size }} |
| 2      | /dev/sdb2 | Linux RAID partition      | 100%FREE - 100M           |

      {% when "Luks on logical volumes" %}

```bash
$ sgdisk -o {{ mode.command-creation }} -n=2:0:0 {{ mode.command-partype }} -t=2:8e00 /dev/sda
$ sgdisk -o -n=1:0:0 -t=1:8e00 /dev/sdb
```

| Device | Partition | Partition type            | Size                      |
| :----- | :-------- | :------------------------ | :------------------------ |
| 1      | /dev/sda1 | {{ mode.partition-type }} | {{ mode.partition-size }} |
| 1      | /dev/sda2 | Linux LVM                 | 100%FREE                  |
| 2      | /dev/sdb1 | Linux LVM                 | 100%FREE                  |

    {% endcase %}
  {% endif %}
{% endfor %}

---
