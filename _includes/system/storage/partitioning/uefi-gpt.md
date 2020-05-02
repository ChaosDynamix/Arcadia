{%- assign mode = site.data.mode.uefi_gpt %}

### Partition scheme

| Partition node       | Partition type       | Partition size       |
| :------------------- | :------------------- | :------------------- |
{%- for partition in template.partitions %}
| {{ partition.node }} | {{ partition.type | replace: "mode_partition_type", mode.partition.type }} | {{ partition.size | replace: "mode_partition_size", mode.partition.size }} |      
{%- endfor %}

### Sgdisk script

```
{{ template.sgdisk.script | replace: "mode_sgdisk", mode.sgdisk -}}
```

{% unless template.sgdisk.has_fixed_size %}
**Note**: Replace SIZE accordingly.
{% endunless %}
