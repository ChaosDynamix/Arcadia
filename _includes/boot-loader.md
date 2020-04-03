## Boot loader

### Install GRUB package
{: .no_toc .mt-4}

Grub is choosed because it allow encrypted /boot and increase the security of your system.

#### BIOS
{: .no_toc .mt-4}

```bash
$ pacman -S grub
```

#### UEFI
{: .no_toc .mt-6}

```bash
$ pacman -S grub efibootmgr
```

{% if page.init-system == "busybox" %}
### Identify the cryptdevice
{: .no_toc .mt-6}

```bash
$ lsblk -f
```
{% endif %}

### Edit the GRUB configuration
{: .no_toc .mt-6 .d-inline-block}

Warning
{: .label .label-red .mx-2}

Before enabling TRIM on a device, make sure the device fully supports TRIM commands, or data loss can occur.
{: .text-red-200}

/etc/default/grub
{: .fs-3 .mb-0}

{% if page.parent == "Logical Volume Manager" %}
  {% case page.init-system %}
    {% when "busybox" %}

```bash
GRUB_CMDLINE_LINUX_DEFAULT="cryptdevice=UUID=(device-UUID):container cryptkey=rootfs:/etc/luks-keys/container root=/dev/grp/root loglevel=3 quiet"
GRUB_ENABLE_CRYPTODISK=y
```

    {% when "systemd" %}
```bash
GRUB_CMDLINE_LINUX_DEFAULT="root=/dev/grp/root loglevel=3 quiet"
GRUB_ENABLE_CRYPTODISK=y
```
  {% endcase %}
{% elsif page.parent == "B-tree filesystem" %}
  {% case page.init-system %}
    {% when "busybox" %}

```bash
GRUB_CMDLINE_LINUX_DEFAULT="cryptdevice=UUID=(device-UUID):container cryptkey=rootfs:/etc/luks-keys/container loglevel=3 quiet"
GRUB_ENABLE_CRYPTODISK=y
```

    {% when "systemd" %}
```bash
GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet"
GRUB_ENABLE_CRYPTODISK=y
```
  {% endcase %}
{% endif %}

### Install GRUB on your device
{: .no_toc .mt-6}

#### BIOS
{: .no_toc .mt-4}

```bash
$ grub-install --target=i386-pc --recheck /dev/sda
```

#### UEFI
{: .no_toc .mt-6}

```bash
$ grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB --recheck
```

### Generate the configuration
{: .no_toc .mt-6}

```bash
$ grub-mkconfig -o /boot/grub/grub.cfg
```

---
