## Setup the Boot loader

### Install GRUB on your device{%- if template.has_raid %}s{% endif %}

{% include tabs.html title="boot-loader" %}

### Generate GRUB configuration

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
