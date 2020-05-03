## Setup the EFI {{ scenario.efi.context }}
{: .d-inline-block}

UEFI
{: .label .label-blue}

### Format the {{ scenario.efi.context }}
{: .mt-0}

```
$ mkfs.fat -F32 -n EFI {{ scenario.efi.node }}
```

### Mount the {{ scenario.efi.context }}

```
$ mkdir /mnt/efi
$ mount {{ scenario.efi.node }} /mnt/efi
```
