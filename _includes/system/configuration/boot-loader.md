{%- assign scenario = site.data.system.configuration.boot-loader[page.parent_uuid] %}
{%- assign firmware = site.data.system.configuration.boot-loader.firmware %}

## Setup the Boot loader

### Install GRUB package

Grub is choosed because it allow encrypted /boot and increase the security of your system.

#### {{ firmware.uefi.title }}
```
{{ firmware.uefi.pkg_list }}
```

Efibootmgr is a userspace application used to modify the UEFI Boot Manager. This application can create and destroy boot entries, change the boot order, change the next running boot option, and more.

#### {{ firmware.bios.title }}
```
{{ firmware.bios.pkg_list }}
```

### Edit the GRUB configuration
{: .d-inline-block}

Warning
{: .label .label-red .mx-2}

Before enabling TRIM on a device, make sure the device fully supports TRIM commands, or data loss can occur.
{: .text-red-200}

##### /etc/default/grub
{% for configuration in scenario.configurations %}
#### {{ configuration.title }}
```
{{ configuration.cmd -}}
```
{% endfor %}

{% unless scenario.systemd %}
### Recommendation

It is highly recommended to replace the content of `cryptdevice=` with the UUID of the device, however during the installation, it is easier to use `/dev/sdXY`. **Consider replacing this value after the installation**.

##### Example
```
cryptdevice=UUID=7b38f0ff-08a5-463d-8c18-e4386b89721e:cryptlvm
```
{% endunless %}

### Install GRUB on your device{%- if scenario.has_raid %}s{% endif %}

{%- if scenario.has_raid %}
Note: If the Raid array is degraded, the system will not be able to boot properly.
{: .fs-3 }
{%- endif %}

#### {{ firmware.uefi.title }}
```
{%- unless scenario.has_raid %}
$ grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB --recheck
{%- else %}
# Install GRUB in the directory without calling efibootmgr
$ grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB --recheck --removable

# Create one boot entry for each drive
$ efibootmgr --create --disk /dev/sda --part 1 --label "Arch Linux a" --loader "\EFI\BOOT\BOOTX64.efi"
$ efibootmgr --create --disk /dev/sdb --part 1 --label "Arch Linux b" --loader "\EFI\BOOT\BOOTX64.efi"

# Check and change the boot order
$ efibootmgr
$ efibootmgr --bootorder X,Y
{%- endunless %}
```

#### {{ firmware.bios.title }}
```
{%- unless scenario.has_raid %}
$ grub-install --target=i386-pc --recheck /dev/sda
{%- else %}
$ grub-install --target=i386-pc --recheck /dev/sda
$ grub-install --target=i386-pc --recheck /dev/sdb
{%- endunless %}
```

### Generate the configuration
```
$ grub-mkconfig -o /boot/grub/grub.cfg
```

---

## Reboot the computer
```
$ exit
$ umount -R /mnt
$ reboot
```
