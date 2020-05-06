## Setup the initial ramdisk images

{% if scenario.mkinitcpio.has_config %}
### Edit the configuration

##### /etc/mkinitcpio.conf

```
{{ scenario.mkinitcpio.config -}}
```

{% if scenario.has_raid %}
### Add a custom hook for mdadm_udev

This hook allow the system to start with a degraded raid array. [Source](https://bugs.archlinux.org/task/57860)

##### /usr/lib/initcpio/install/mdadm_udev
```
add_runscript
```

**Note**: Add this command in the build() function at the end.
{: .fs-3 }

##### /usr/lib/initcpio/hooks/mdadm_udev
```
#!/usr/bin/ash
run_hook() {
  local seconds=10
  mdadm --detail --scan | grep -q INACTIVE_ARRAY || return 0
  echo "Waiting $seconds seconds for incomplete mdadm arrays..."
  sleep $seconds
  mdadm -IRs
}
# vim: set ft=sh ts=4 sw=4 et:
```

**Note**: The script create a local variable, check the arrays for potential inactive array, break if everything is fine, display a message, wait 10 seconds and start the arrays even if they are in degraded state.
{: .fs-3 }
{% endif %}
{% endif %}

### Generate the images
```
$ mkinitcpio -p linux
```

---

## Install the Microcode of your CPU

Processors may have faulty behaviour, which the kernel can correct by updating the microcode on startup.

#### AMD
```
$ pacman -S amd-ucode
```

#### INTEL
```
$ pacman -S intel-ucode
```

---

## Setup the Boot loader

### Install GRUB on the device{% if scenario.has_raid %}s{% endif %}

{% include tabs.html title="initialization" %}

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
