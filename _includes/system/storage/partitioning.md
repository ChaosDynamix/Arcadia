{% assign profile = include.profile %}

## Partition the device{% if profile.plural %}s{% endif %}

{% for mode in profile.modes %}

#### {{ mode.title }}

```
{{ mode.sgdisk -}}
```

| Partition name       | Partition type       | Partition size       |
| :------------------- | :------------------- | :------------------- |
{%- for partition in mode.partitions %}
| {{ partition.node }} | {{ partition.type }} | {{ partition.size }} |
{%- endfor %}

{% endfor %}
