## Setup the EFI {{ template.efi.context }}
{: .d-inline-block}

UEFI
{: .label .label-blue}

### Format the {{ template.efi.context }}
{: .mt-0}

```
$ mkfs.fat -F32 -n EFI {{ template.efi.node }}
```

### Mount the {{ template.efi.context }}

```
$ mkdir /mnt/efi
$ mount {{ template.efi.node }} /mnt/efi
```
