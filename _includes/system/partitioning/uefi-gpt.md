{% assign mode = site.data.mode.uefi_gpt %}

### Partition scheme

| Partition node       | Partition type       | Partition size       |
| :------------------- | :------------------- | :------------------- |
{%- for partition in scenario.partitions %}
  {%- if partition.has_boot %}
| {{ partition.node }} | EFI system partition | 260 MiB              |
  {%- else %}
| {{ partition.node }} | {{ partition.type }} | {{ partition.size }} |
  {%- endif %}     
{%- endfor %}

### Sgdisk script

{% case scenario.profile.partitioning %}
  {% when "luks_single_partition" %}
```
$ sgdisk -o -n=1:0:+260M -t=1:ef00 -n=2:0:0 -t=2:8309 /dev/sda
```
  {% when "luks_multiple_partitions" %}
```
$ sgdisk -o -n=1:0:+260M -t=1:ef00 -n=2:0:0 -t=2:8309 /dev/sda
$ sgdisk -o -n=1:0:0 -t=1:8309 /dev/sdb
```
  {% when "luks_mirroring_raid" %}
```
$ sgdisk -o -n=1:0:+260M -t=1:ef00 -n=2:0:-100M -t=2:fd00 -R=/dev/sdb /dev/sda
$ sgdisk -G /dev/sdb
```
  {% when "luks_logical_volumes" %}
```
$ sgdisk -o -n=1:0:+260M -t=1:ef00 -n=2:0:0 -t=2:8e00 /dev/sda
$ sgdisk -o -n=1:0:0 -t=1:8e00 /dev/sdb
```
  {% when "ext4_multiple_partitions" %}
```
$ sgdisk -o -n=1:0:+260M -t=1:ef00 -n=2:0:SIZE -t=2:8304 -n=3:0:SIZE -t=3:8200 -n=4:0:0 -t=4:8302 /dev/sda
```
**Note**: Replace SIZE accordingly.
{: .fs-3}
{% endcase %}
