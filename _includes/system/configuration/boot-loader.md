{%- assign scenario_title = site.data.system.configuration.boot-loader.map[page.parent_uuid] %}
{%- assign scenario = site.data.system.configuration.boot-loader.scenario[scenario_title] %}

## Setup the Boot loader

### Install GRUB on your device{%- if scenario.has_raid %}s{% endif %}

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
