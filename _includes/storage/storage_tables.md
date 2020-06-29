{% case page.title %}
  {% when "Installation" %}
## Generate the fstab file

genfstab helps fill in an fstab file by autodetecting all the current mounts below a given mountpoint and printing them in fstab-compatible format to standard output.

It can be used to persist a manually mounted filesystem hierarchy and is often used during the initial install and configuration of an OS.

```
$ genfstab -U /mnt >> /mnt/etc/fstab
```

### References

1. [Wikipedia - Fstab](https://en.wikipedia.org/wiki/Fstab)
1. [ArchWiki - Fstab](https://wiki.archlinux.org/index.php/Fstab)
1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide)
1. [ManPage - Genfstab](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/arch-install-scripts/genfstab.8.en)
{: .fs-3}

---

## Enter the system

```
$ arch-chroot /mnt
```

### References

1. [ArchWiki - Chroot](https://wiki.archlinux.org/index.php/Chroot)
1. [ManPage - Arch-chroot](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/arch-install-scripts/arch-chroot.8.en)
{: .fs-3}

  {% when "Configuration" %}
    {% if scenario.device_tables.has_fstab or scenario.device_tables.has_crypttab or scenario.device_tables.has_crypttab_initramfs %}
## Edit the configuration of the device tables
    {% endif %}
    {% if scenario.device_tables.has_crypttab_initramfs %}

### Edit the initramfs crypttab

##### /etc/crypttab.initramfs
```
{{ scenario.device_tables.crypttab_initramfs -}}
```

**Note**: Replace `device_UUID` with the UUID of `/dev/sda2` and `/dev/sdb1`.
{: .fs-3 }
    {% endif %}

    {% if scenario.device_tables.has_fstab %}
### Edit the fstab

##### /etc/fstab
```
{{ scenario.device_tables.fstab -}}
```
    {% endif %}

    {% if scenario.device_tables.has_crypttab %}
### Edit the crypttab

##### /etc/crypttab
```
{{ scenario.device_tables.crypttab -}}
```
    {% endif %}
{% endcase %}
