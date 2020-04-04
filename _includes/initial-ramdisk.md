## Initial ramdisk

### Set the console locale
{: .no_toc .mt-4}

#### EXAMPLE
{: .no_toc .mt-4}

```bash
$ echo KEYMAP=fr-latin9 > /etc/vconsole.conf
```

### Edit the configuration
{: .no_toc .mt-6}

/etc/mkinitcpio.conf
{: .fs-3 .mb-0}

{% capture busybox-luks-lvm %}
```bash
FILES=({% if page.title == "Luks on logical volumes" %}/etc/luks-keys/root{% else %}/etc/luks-keys/container{% endif %})
HOOKS=(base udev autodetect modconf block encrypt lvm2 filesystems keyboard keymap fsck)
```
{% endcapture %}

{% capture systemd-luks-lvm-header %}
```bash
FILES=(/etc/luks-keys/container /boot/header.img)
HOOKS=(base systemd autodetect modconf block sd-encrypt sd-lvm2 filesystems keyboard sd-vconsole fsck)
```
{% endcapture %}

{% capture systemd-luks-lvm %}
```bash
FILES=(/etc/luks-keys/container1 /etc/luks-keys/container2)
HOOKS=(base systemd autodetect modconf block sd-encrypt sd-lvm2 filesystems keyboard sd-vconsole fsck)
```
{% endcapture %}

{% capture busybox-luks-raid-lvm %}
```bash
FILES=(/etc/luks-keys/container)
HOOKS=(base udev autodetect modconf block mdadm_udev encrypt lvm2 filesystems keyboard keymap fsck)
```
{% endcapture %}

{% capture busybox-luks-btrfs %}
```bash
BINARIES=(/usr/bin/btrfs)
FILES=(/etc/luks-keys/container)
HOOKS=(base udev autodetect modconf block encrypt filesystems keyboard keymap fsck)
```
{% endcapture %}

{% capture systemd-luks-btrfs %}
```bash
BINARIES=(/usr/bin/btrfs)
FILES=(/etc/luks-keys/container1 /etc/luks-keys/container2)
HOOKS=(base systemd autodetect modconf block sd-encrypt filesystems keyboard sd-vconsole fsck)
```
{% endcapture %}

{% capture busybox-luks-raid-btrfs %}
```bash
BINARIES=(/usr/bin/btrfs)
FILES=(/etc/luks-keys/container)
HOOKS=(base udev autodetect modconf block mdadm_udev encrypt filesystems keyboard keymap fsck)
```
{% endcapture %}

{% if page.parent == "Logical Volume Manager" %}
  {% case page.title %}
    {% when "Luks on single partition" %}
      {{ busybox-luks-lvm }}
    {% when "Luks on device" %}
      {{ systemd-luks-lvm }}
    {% when "Luks on multiple partitions" %}
      {{ systemd-luks-lvm }}
    {% when "Luks on Raid1" %}
      {{ busybox-luks-raid-lvm }}
    {% when "Luks on logical volumes" %}
      {{ busybox-luks-lvm }}
  {% endcase %}
{% elsif page.parent == "B-tree filesystem" %}
  {% case page.title %}
    {% when "Luks on single partition" %}
      {{ busybox-luks-lvm }}
    {% when "Luks on device" %}
      {{ busybox-luks-lvm }}
    {% when "Luks on multiple partitions" %}
      {{ systemd-luks-lvm }}
    {% when "Luks on Raid1" %}
      {{ busybox-luks-raid-lvm }}
    {% when "Luks on logical volumes" %}
      {{ busybox-luks-lvm }}
  {% endcase %}
{% endif %}

### Generate the images
{: .no_toc .mt-6}

```bash
$ mkinitcpio -p linux
```

---
