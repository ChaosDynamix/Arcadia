{%- assign mode = site.data.mode.bios_gpt %}

### Partition scheme

| Partition node       | Partition type       | Partition size       |
| :------------------- | :------------------- | :------------------- |
{%- for partition in scenario.partitions %}
| {{ partition.node }} | {{ partition.type | replace: "mode_partition_type", mode.partition.type }} | {{ partition.size | replace: "mode_partition_size", mode.partition.size }} |      
{%- endfor %}

### Sgdisk script

```
{{ scenario.sgdisk.script | replace: "mode_sgdisk", mode.sgdisk -}}
```

{% unless scenario.sgdisk.has_fixed_size %}
**Note**: Replace SIZE accordingly.
{% endunless %}
