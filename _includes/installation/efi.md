{%- assign scenario = include.data %}

{%- assign firmwarePartitions = scenario.storage.partitions | where: "is-firmware", true %}
{%- assign firmwarePartitionLabels = scenario.storage.partitions | where: "is-firmware", true | map: "label" %}
{%- assign firmwarePartitionNumber = firmwarePartitions | size %}

## Setup the EFI partition{% if firmwarePartitionNumber > 1 %}s{% endif %}
{: .d-inline-block}

UEFI
{: .label .label-blue .ml-2}

### Format the partition{% if firmwarePartitionNumber > 1 %}s{% endif %}
{: .mt-0}

```
{%- for firmwarePartition in firmwarePartitions %}
$ mkfs.fat -F32 -n {{ firmwarePartition.label }} {{ firmwarePartition.node }}
{%- endfor %}
```

### Mount the partition{% if firmwarePartitionNumber > 1 %}s{% endif %}

```
$ mkdir /mnt/{% if firmwarePartitionNumber > 1 %}{ {{- firmwarePartitionLabels | sort_natural | join: "," | downcase -}} }{% else %}{{ firmwarePartitionLabels[0] | downcase }}{% endif %}
{%- for firmwarePartition in firmwarePartitions %}
$ mount {{ firmwarePartition.node }} /mnt/{{ firmwarePartition.label | downcase }}
{%- endfor %}
```

---
