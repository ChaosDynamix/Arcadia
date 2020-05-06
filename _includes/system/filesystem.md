{% include /system/filesystem/{{ scenario.filesystem }}.md %}

{% if include.step == 1 %}
---

## Setup the EFI {{ txt.include.efi_ctx }}
{: .d-inline-block}

UEFI
{: .label .label-blue}

### Format the {{ txt.include.efi_ctx }}
{: .mt-0}

```
{%- if scenario.has_raid %}
$ mkfs.fat -F32 -n EFI {{ scenario.raid.array.efi }}
{%- else %}
{%- assign boot = scenario.partitions | where: "has_boot", true | first %}
$ mkfs.fat -F32 -n EFI {{ boot.node }}
{%- endif %}
```

### Mount the {{ txt.include.efi_ctx }}

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
