{% assign profile = include.profile %}

## Setup the Boot loader

### Install GRUB package

Grub is choosed because it allow encrypted /boot and increase the security of your system.

{% for firmware in profile.grub_pacman %}
#### {{ firmware.title }}
```
{{ firmware.cmd }}
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
{{ profile.grub_cfg -}}
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
