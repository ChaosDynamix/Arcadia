{% if scenario.has_raid %}
## Create the RAID array(s)

Redundant Array of Independent Disks (RAID) is a storage technology that combines multiple disk drive components (typically disk drives or partitions thereof) into a logical unit. Depending on the RAID implementation, this logical unit can be a file system or an additional transparent layer that can hold several partitions.

When creating an array from Arch Linux ISO image, use the option `--homehost=myhostname` (or `--homehost=any` to always have the same name regardless of the host) to set the hostname, otherwise the hostname archiso will be written in the array metadata.

### Create the EFI Raid{{ scenario.raid.level }} array
{: .d-inline-block .my-3}

UEFI
{: .label .label-blue}

Skip this step if you are currently running in BOOT / GPT mode.

```
{%- case scenario.raid.level %}
  {%- when 1 %}
$ mdadm --create --level=1 --metadata=1.0 --raid-devices=2 --homehost=myhostname {{ scenario.raid.array.efi.name }} {{ scenario.raid.array.efi.nodes }}
{%- endcase %}
```

### Create the System Raid{{ scenario.raid.level }} array
```
{%- case scenario.raid.level %}
  {%- when 1 %}
$ mdadm --create --level=1 --metadata=1.2 --raid-devices=2 --homehost=myhostname {{ scenario.raid.array.system.name }} {{ scenario.raid.array.efi.nodes }}
{%- endcase %}
```

### Check the synchronization of the Raid{{ scenario.raid.level }} array(s)
```
$ watch cat /proc/mdstat
```
{% else %}
## ERROR: No Raid in this scenario
{% endif %}
