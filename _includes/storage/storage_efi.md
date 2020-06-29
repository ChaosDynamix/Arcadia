{% if page.title == "Storage" %}

### Setup the EFI {{ txt.include.efi_ctx }}
{: .d-inline-block}

UEFI
{: .label .label-blue}

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

1. [ArchWiki - Filesystems](https://wiki.archlinux.org/index.php/File_systems)
1. [ArchWiki - Dm-crypt/Encrypting an entire system](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system)
1. [ManPage - Mkfs](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mkfs.8.en)
1. [ManPage - Mount](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/man-pages/mount.2.en)
1. [ManPage - Mkswap](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mkswap.8.en)
1. [ManPage - Swapon](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/man-pages/swapon.2.en)
1. [ManPage - Mkdir](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/mkdir.1.en)
{: .fs-3}
