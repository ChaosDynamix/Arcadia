{%- assign mode = site.data.mode.bios_gpt %}

### Partition scheme

| Partition node       | Partition type       | Partition size       |
| :------------------- | :------------------- | :------------------- |
{%- for partition in site.data.template[scenario.template].partitions %}
| {{ partition.node }} | {{ partition.type | replace: "mode_partition_type", mode.partition.type }} | {{ partition.size | replace: "mode_partition_size", mode.partition.size }} |      
{%- endfor %}

### Sgdisk script

```
{{ site.data.template[scenario.template].sgdisk | replace: "mode_sgdisk", mode.sgdisk -}}
```
