### Install GRUB package

Grub is choosed because it allow encrypted /boot and increase the security of your system.

```
$ pacman -S grub efibootmgr
```

Efibootmgr is a userspace application used to modify the UEFI Boot Manager. This application can create and destroy boot entries, change the boot order, change the next running boot option, and more.

### Edit the GRUB configuration
{: .d-inline-block}

Warning
{: .label .label-red .mx-2}

Before enabling TRIM on a device, make sure the device fully supports TRIM commands, or data loss can occur.
{: .text-red-200}

{% for configuration in site.data.template[scenario.template].grub_configurations %}
#### {{ configuration.title }}

##### /etc/default/grub
```
{{ configuration.cmd | replace: "_context_", page.context_abbr -}}
```
{% endfor %}

{% unless site.data.template[scenario.template].init_system == "systemd" %}
**Note**: Replace `7b38f0ff-08a5-463d-8c18-e4386b89721e` with the UUID of your device.
{: .fs-3 }
{% endunless %}

### Install GRUB in the EFI directory

```
{%- if scenario.storage.has_raid %}
$ grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB --recheck --removable
{%- else %}
$ grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB --recheck
{%- endif %}
```

{%- if scenario.storage.has_raid %}
**Note**: `--removable` flag prevent Efibootmgr to launch because he is not able to write boot entries for a Raid array.
{: .fs-3 }
{%- endif %}

{%- if scenario.storage.has_raid %}
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
{%- endif %}
