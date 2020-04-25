{% assign scenario = include.scenario %}
{% assign modes = site.data.system.storage.partitioning.modes %}

## Partition the device{% if scenario.plural %}s{% endif %}

{% for mode in modes %}

#### {{ mode.title }}

```
{{ scenario.sgdisk | replace: "mode_sgdisk", mode.sgdisk -}}
```

| Partition name       | Partition type       | Partition size       |
| :------------------- | :------------------- | :------------------- |
{%- for partition in scenario.partitions %}
| {{ partition.node }} | {{ partition.type | replace: "mode_partition_type", mode.partition.type }} | {{ partition.size | replace: "mode_partition_size", mode.partition.size }} |      
{%- endfor %}

{% endfor %}
