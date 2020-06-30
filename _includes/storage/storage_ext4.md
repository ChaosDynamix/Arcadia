{% assign step_command = scenario.ext4.commands | where: "page", page.title | first %}

## Setup the filesystems

This version of the project only shows the Ext4 filesystem setup. More filesystems will be covered in the next version of the project.
{: .fs-3}

### Format the {{ txt.include.filesystem_ctx }}

```
{{ step_command.format -}}
```

### Mount the {{ txt.include.filesystem_ctx }}

```
{{ step_command.mount -}}
```

{% if step_command.has_swap %}
### Setup the Swap

```
{{ step_command.swap -}}
```
{%- endif %}

### References
{: .text-delta .pt-4}

1. [ArchWiki - Filesystems](https://wiki.archlinux.org/index.php/File_systems)
1. [ArchWiki - Dm-crypt/Encrypting an entire system](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system)
1. [ManPage - Mkfs](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mkfs.8.en)
1. [ManPage - Mount](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/man-pages/mount.2.en)
1. [ManPage - Mkswap](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mkswap.8.en)
1. [ManPage - Swapon](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/man-pages/swapon.2.en)
1. [ManPage - Mkdir](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/mkdir.1.en)
{: .fs-3}
