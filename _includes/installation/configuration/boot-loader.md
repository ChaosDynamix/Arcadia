{% assign template = include.template %}
{% assign firmwares = site.data.docs.firmwares %}
{% assign firmwares_partitions = template.firmware-partitions %}
{% assign devices = template.devices %}

## Setup the Boot loader

### Install GRUB package

Grub is choosed because it allow encrypted /boot and increase the security of your system.

{% for firmware in firmwares %}
#### {{ firmware.name }}

```
$ pacman -S {{ firmware.grub.package-list }}
```
{% endfor %}

### Edit the GRUB configuration
{: .d-inline-block}

Warning
{: .label .label-red .mx-2}

Before enabling TRIM on a device, make sure the device fully supports TRIM commands, or data loss can occur.
{: .text-red-200}

##### /etc/default/grub
```
{{ template.configuration.grub -}}
```

### Install GRUB on your device

```
TODO
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
