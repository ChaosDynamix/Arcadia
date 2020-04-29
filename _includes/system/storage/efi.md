{%- assign scenario_title = site.data.system.storage.efi.map[page.parent_uuid] %}
{%- assign scenario = site.data.system.storage.efi.scenario[scenario_title] %}

## Setup the EFI {{ scenario.context }}
{: .d-inline-block}

UEFI
{: .label .label-blue}

### Format the {{ scenario.context }}
{: .mt-0}

```
$ mkfs.fat -F32 -n EFI {{ scenario.node }}
```

### Mount the {{ scenario.context }}

```
$ mkdir /mnt/efi
$ mount {{ scenario.node }} /mnt/efi
```
