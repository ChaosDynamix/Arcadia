### Partition scheme

| Partition node       | Partition type       | Partition size       |
| :------------------- | :------------------- | :------------------- |
{%- for partition in scenario.partitions %}
  {%- if partition.has_boot %}
| {{ partition.node }} | BIOS boot partition  | 1 MiB                |
  {%- else %}
| {{ partition.node }} | {{ partition.type }} | {{ partition.size }} |
  {%- endif %}
{%- endfor %}

### Sgdisk script

```
{{ scenario.sgdisk | replace: "_bootpart_", "-n=1:0:+1M -t=1:ef02" -}}
```
