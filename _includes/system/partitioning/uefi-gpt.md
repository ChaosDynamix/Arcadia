### Partition scheme

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

### Sgdisk script

```
{% if scenario.has_raid %}{{ scenario.sgdisk | replace: "_bootpart_", "-n=1:0:+260M -t=1:fd00" }}{% else %}{{ scenario.sgdisk | replace: "_bootpart_", "-n=1:0:+260M -t=1:ef00" }}{% endif -%}
```
