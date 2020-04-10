{%- assign template = include.template %}

{%- assign firmware_partitions = template.firmware-partitions %}
{%- assign firmware_partitions_label = firmware_partitions | map: "efi-label" %}
{%- assign firmware_partitions_number = firmware_partitions | size %}

## Setup the EFI partition{% if firmware_partitions_number > 1 %}s{% endif %}
{: .d-inline-block}

UEFI
{: .label .label-blue .ml-2}

### Format the partition{% if firmware_partitions_number > 1 %}s{% endif %}
{: .mt-0}

```
{%- for partition in firmware_partitions %}
$ mkfs.fat -F32 -n {{ partition.efi-label }} {{ partition.node }}
{%- endfor %}
```

### Mount the partition{% if firmware_partitions_number > 1 %}s{% endif %}

```
{%- if firmware_partitions_number == 1 %}
$ mkdir /mnt/{{- firmware_partitions_label[0] | downcase -}}
{%- else %}
$ mkdir /mnt/{ {{- firmware_partitions_label | sort | join: "," | downcase -}} }
{%- endif %}
{%- for partition in firmware_partitions %}
$ mount {{ partition.node }} /mnt/{{ partition.efi-label | downcase }}
{%- endfor %}
```

---
