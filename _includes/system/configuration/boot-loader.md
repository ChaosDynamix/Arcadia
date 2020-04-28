{%- assign scenario = site.data.system.configuration.boot-loader[page.parent_uuid] %}
{%- assign firmwares = site.data.system.configuration.boot-loader.firmwares %}

## Setup the Boot loader

### Install GRUB package

Grub is choosed because it allow encrypted /boot and increase the security of your system.

{% for firmware in firmwares %}
#### {{ firmware.title }}
```
{{ firmware.pkg_list }}
```
  {% if firmware.title == "uefi" %}
Efibootmgr is a userspace application used to modify the UEFI Boot Manager. This application can create and destroy boot entries, change the boot order, change the next running boot option, and more.
  {% endif %}
{% endfor %}

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

### Install GRUB on your device

{% for firmware in firmwares %}
#### {{ firmware.title }}
```
{{ firmware.cmd }}
```
{% endfor %}

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
