{% include /system/filesystem/{{ scenario.filesystem.name }}.md step=include.step %}

{% if include.step == 1 %}
---

## Setup the EFI {% if scenario.has_raid %}Raid array{% else %}partition{% endif %}
{: .d-inline-block}

UEFI
{: .label .label-blue}

### Format the {% if scenario.has_raid %}Raid array{% else %}partition{% endif %}
{: .mt-0}

```
{%- if scenario.has_raid %}
$ mkfs.fat -F32 -n EFI {{ scenario.raid.array.efi }}
{%- else %}
{%- assign boot = scenario.partitions | where: "has_boot", true | first %}
$ mkfs.fat -F32 -n EFI {{ boot.node }}
{%- endif %}
```

### Mount the {% if scenario.has_raid %}Raid array{% else %}partition{% endif %}

```
$ mkdir /mnt/efi
{%- if scenario.has_raid %}
$ mount {{ scenario.raid.array.efi }} /mnt/efi
{%- else %}
{%- assign boot = scenario.partitions | where: "has_boot", true | first %}
$ mount {{ boot.node }} /mnt/efi
{%- endif %}
```
{% endif %}
