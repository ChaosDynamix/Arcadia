{% if page.title == "Storage" %}

## Setup the EFI {{ txt.include.efi_ctx }}
{: .d-inline-block .mt-0}

UEFI
{: .label .label-blue}

Skip this step if your boot mode is BIOS or UEFI with CSM mode.
{: .fs-3}

```
{%- if scenario.has_raid %}
$ mkfs.fat -F32 -n EFI {{ scenario.raid.array.efi.name }}
{%- else %}
{%- assign boot = scenario.partitions | where: "has_boot", true | first %}
$ mkfs.fat -F32 -n EFI {{ boot.node }}
{%- endif %}
$ mkdir /mnt/efi
{%- if scenario.has_raid %}
$ mount {{ scenario.raid.array.efi.name }} /mnt/efi
{%- else %}
{%- assign boot = scenario.partitions | where: "has_boot", true | first %}
$ mount {{ boot.node }} /mnt/efi
{%- endif %}
```
{% endif %}


### References
{: .text-delta .pt-4}

1. [ArchWiki - Filesystems](https://wiki.archlinux.org/index.php/File_systems)
1. [ArchWiki - EFI system partition](https://wiki.archlinux.org/index.php/EFI_system_partition)
1. [ManPage - Mkfs](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mkfs.8.en)
1. [ManPage - Mount](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/man-pages/mount.2.en)
1. [ManPage - Mkdir](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/mkdir.1.en)
{: .fs-3}
