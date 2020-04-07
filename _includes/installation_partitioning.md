{% assign scenario = include.data %}
{% assign devicenumber = scenario.storage.devices | size %}

## Partition the device{% if devicenumber > 1 %}s{% endif %}

{% for firmware in site.data.firmwares %}

### {{ firmware.name }} / {{ firmware.partition.table }}
{: .no_toc .text-delta .mt-6}

```bash
  {%- for script in scenario.script.sgdisk %}
    {%- if script.is-primary %}
$ sgdisk {{ firmware.sgdisk.args }} {{ script.args }}
    {%- else %}
$ sgdisk {{ script.args }}
    {%- endif %}
  {%- endfor %}
```

| Partition name               | Partition type                | Partition size                |
| :--------------------------- | :---------------------------- | :---------------------------- |
  {%- for partition in scenario.storage.partitions %}
    {%- if partition.is-firmware %}
| {{ partition.node }}         | {{ firmware.partition.type }} | {{ firmware.partition.size }} |
    {%- else %}
| {{ partition.node }}         | {{ partition.type }}          | {{ partition.size }}          |      
    {%- endif %}
  {%- endfor %}

{% endfor %}

---
