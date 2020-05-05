### Install GRUB package
```
$ pacman -S grub
```

{% unless scenario.profile.initialization == "none" %}
{% include system/initialization/configuration.md %}
{% endunless %}

### Install GRUB on the device{%- if scenario.has_raid %}s{% endif %}

```
{%- if scenario.has_raid %}
$ grub-install --target=i386-pc --recheck /dev/sda
$ grub-install --target=i386-pc --recheck /dev/sdb
{%- else %}
$ grub-install --target=i386-pc --recheck /dev/sda
{%- endif %}
```
