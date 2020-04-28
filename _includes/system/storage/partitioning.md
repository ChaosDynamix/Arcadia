{%- assign scenario_title = site.data.system.storage.partitioning.map[page.parent_uuid] %}
{%- assign scenario = site.data.system.storage.partitioning.scenario[scenario_title] %}
{%- assign modes = site.data.system.storage.partitioning.modes %}

## Partition the device{% if scenario.plural %}s{% endif %}

Select the partitioning mode corresponding of the boot mode verification in the preparation step.

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

### Check the partitioning of your device{% if scenario.plural %}s{% endif %}

Verify that the layout is the same as the table above. The code represent the partition type, check the [Arch Linux Wiki Gdisk page](https://wiki.archlinux.org/index.php/GPT_fdisk#Partition_type) for more infos.

```
{%- for device in scenario.devices %}
$ gdisk -l {{ device }}    
{%- endfor %}
```
