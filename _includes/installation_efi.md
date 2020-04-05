{% assign scenario = include.data %}

## {% if scenario.has-raid1 %}Setup the EFI partitions{% else %}Setup the EFI partition{% endif %}
{: .d-inline-block}

UEFI
{: .label .label-blue .ml-2}

### Format the partition
{: .no_toc .mt-0}

{% if scenario.has-raid1 %}
```bash
$ mkfs.fat -F32 -n EFI {{ scenario.efi-partition1 }}
$ mkfs.fat -F32 -n EFI {{ scenario.efi-partition2 }}
```
{% else %}
```bash
$ mkfs.fat -F32 -n EFI {{ scenario.efi-partition1 }}
```
{% endif %}

### Mount the partition
{: .no_toc .mt-6}

{% if scenario.has-raid1 %}
```bash
$ mkdir /mnt/{efi1,efi2}
$ mount {{ scenario.efi-partition1 }} /mnt/efi1
$ mount {{ scenario.efi-partition2 }} /mnt/efi2
```
{% else %}
```bash
$ mkdir /mnt/efi
$ mount {{ scenario.efi-partition1 }} /mnt/efi
```
{% endif %}

---
