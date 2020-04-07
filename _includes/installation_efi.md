{%- assign scenario = include.data %}
{%- assign firmwarepartitions = scenario.storage.partitions | where: "is-firmware", true %}
{%- assign firmwarepartitionnumber = firmwarepartitions | size %}

## Setup the EFI partition{% if firmwarepartitionnumber > 1 %}s{% endif %}
{: .d-inline-block}

UEFI
{: .label .label-blue .ml-2}

### Format the partition{% if firmwarepartitionnumber > 1 %}s{% endif %}
{: .no_toc .mt-0}

```bash
{%- for firmwarepartition in firmwarepartitions %}
$ mkfs.fat -F32 -n EFI {{ firmwarepartition.node }}
{%- endfor %}
```

### Mount the partition{% if firmwarepartitionnumber > 1 %}s{% endif %}
{: .no_toc .mt-6}

```bash
{%- for firmwarepartition in firmwarepartitions %}
$ mount {{ firmwarepartition.node }} /mnt/efi
{%- endfor %}
```

---
