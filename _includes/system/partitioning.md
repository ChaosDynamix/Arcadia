## Partition the device{% if scenario.devices.size > 1 %}s{% endif %}

Select the partitioning mode corresponding of the boot mode verification in the preparation step.

### Check the partitioning of the device{% if scenario.devices.size > 1 %}s{% endif %}

Verify that the layout is the same as the table above. The code represent the partition type.

```
{%- for device in scenario.devices %}
$ gdisk -l {{ device.node }}
{%- endfor %}
```

### References

1. [Wikipedia - Disk partitioning](https://en.wikipedia.org/wiki/Disk_partitioning)
1. [Wikipedia - Partition table](https://en.wikipedia.org/wiki/Partition_table)
1. [Wikipedia - GUID partition table](https://en.wikipedia.org/wiki/GUID_Partition_Table)
1. [ArchWiki - GPT fdisk](https://wiki.archlinux.org/index.php/GPT_fdisk)
1. [ManPage - Sgdisk](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/gptfdisk/sgdisk.8.en)
{: .fs-3}
