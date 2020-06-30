## Partition the device{% if scenario.devices.size > 1 %}s{% endif %}

Select the partitioning mode corresponding of the boot mode verification result in the preparation step.

### BIOS / GPT

| Partition node       | Partition type       | Partition size       |
| :------------------- | :------------------- | :------------------- |
{%- for partition in scenario.partitions %}
  {%- if partition.has_boot %}
| {{ partition.node }} | BIOS boot partition  | 1 MiB                |
  {%- else %}
| {{ partition.node }} | {{ partition.type }} | {{ partition.size }} |
  {%- endif %}
{%- endfor %}

```
{{ scenario.sgdisk | replace: "_bootpart_", "-n=1:0:+1M -t=1:ef02" -}}
```

### UEFI / GPT

| Partition node       | Partition type       | Partition size       |
| :------------------- | :------------------- | :------------------- |
{%- for partition in scenario.partitions %}
  {%- if partition.has_boot %}
    {%- if scenario.has_raid %}
| {{ partition.node }} | Linux RAID partition | 260 MiB              |
    {%- else %}
| {{ partition.node }} | EFI system partition | 260 MiB              |
    {%- endif %}
  {%- else %}
| {{ partition.node }} | {{ partition.type }} | {{ partition.size }} |
  {%- endif %}     
{%- endfor %}

```
{% if scenario.has_raid %}{{ scenario.sgdisk | replace: "_bootpart_", "-n=1:0:+260M -t=1:fd00" }}{% else %}{{ scenario.sgdisk | replace: "_bootpart_", "-n=1:0:+260M -t=1:ef00" }}{% endif -%}
```

### Check the partitioning of the device{% if scenario.devices.size > 1 %}s{% endif %}

Verify that the layout is the same as the table above. The code represent the partition type.

```
{%- for device in scenario.devices %}
$ gdisk -l {{ device.node }}
{%- endfor %}
```

### References
{: .text-delta .pt-4}

1. [Wikipedia - Disk partitioning](https://en.wikipedia.org/wiki/Disk_partitioning)
1. [Wikipedia - Partition table](https://en.wikipedia.org/wiki/Partition_table)
1. [Wikipedia - GUID partition table](https://en.wikipedia.org/wiki/GUID_Partition_Table)
1. [ArchWiki - GPT fdisk](https://wiki.archlinux.org/index.php/GPT_fdisk)
1. [ManPage - Sgdisk](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/gptfdisk/sgdisk.8.en)
{: .fs-3}
