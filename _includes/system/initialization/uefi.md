### Install GRUB package
```
$ pacman -S grub efibootmgr
```

Efibootmgr is a userspace application used to modify the UEFI Boot Manager. This application can create and destroy boot entries, change the boot order, change the next running boot option, and more.

{% unless scenario.profile.initialization == "none" %}
{% include system/initialization/configuration.md %}
{% endunless %}

### Install GRUB in the EFI directory

{%- if scenario.has_raid %}
```
$ grub-install --target=x86_64-efi --efi-directory=/efi --recheck --removable
```

**Note**: `--removable` flag prevent Efibootmgr to launch because he is not able to write boot entries for a Raid array.
{: .fs-3 }

### Add boot entries with Efibootmgr

```
$ efibootmgr --create --disk /dev/sda --part 1 --label "Arch Linux UUID" --loader "\EFI\BOOT\BOOTX64.efi"
$ efibootmgr --create --disk /dev/sdb --part 1 --label "Arch Linux UUID" --loader "\EFI\BOOT\BOOTX64.efi"
```

**Note**: Replace the label UUID with the first 4 alphanumeric characters of the devices UUID so you can identify them properly. If one device fail, GRUB will tell you witch one is it. example: `Arch Linux 7b38`.
{: .fs-3 }

### Show and modify the boot order

```
$ efibootmgr
$ efibootmgr --bootorder X,Y
```
{%- else %}
```
$ grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB --recheck
```
{%- endif %}
