{% assign template = include.template %}

{% assign firmwares = site.data.firmwares %}
{% assign partitions = template.firmware-partitions | concat: template.system-partitions | sort: "id" %}
{% assign device_number = template.devices | size %}

## Partition the device{% if device_number > 1 %}s{% endif %}

{% for firmware in firmwares %}

#### {{ firmware.name }}

```
{{ template.script.sgdisk | replace: "firmware_script_sgdisk", firmware.script.sgdisk -}}
```

| Partition name | Partition type | Partition size |
| :------------- | :------------- | :------------- |
  {%- for partition in partitions %}
| {{ partition.node }} | {{ partition.type | replace: "firmware_partition_type", firmware.partition.type }} | {{ partition.size | replace: "firmware_partition_size", firmware.partition.size }} |      
  {%- endfor %}

{% endfor %}

---
