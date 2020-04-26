{%- assign scenario_title = site.data.system.storage.efi.map[page.parent_uuid] %}
{%- assign scenario = site.data.system.storage.efi.scenario[scenario_title] %}

## Setup the EFI partition{% if scenario.plural %}s{% endif %}
{: .d-inline-block}

UEFI
{: .label .label-blue .ml-2}

### Format the partition{% if scenario.plural %}s{% endif %}
{: .mt-0}

```
{%- for partition in scenario.partitions %}
$ mkfs.fat -F32 -n {{ partition.label }} {{ partition.node }}
{%- endfor %}
```

### Mount the partition{% if scenario.plural %}s{% endif %}

```
$ mkdir /mnt/{ {{- scenario.mkdir -}} }
{%- for partition in scenario.partitions %}
$ mount {{ partition.node }} {{ partition.mount }}
{%- endfor %}
```
