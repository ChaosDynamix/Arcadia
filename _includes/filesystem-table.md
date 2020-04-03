## Filesystem table

### Generate fstab
{: .no_toc .mt-4}

```bash
$ genfstab -U /mnt >> /mnt/etc/fstab
```

{% if page.has_swapfile %}
### Edit the configuration
{: .no_toc .mt-6}

/etc/fstab
{: .fs-3 .mb-0}

```bash
/.swap/swapfile       none        swap        defaults        0 0
```
{% endif %}

{% if page.has_multiple_containers %}
### Edit the configuration
{: .no_toc .mt-6}

/etc/crypttab.initramfs
{: .fs-3 .mb-0}

```bash
container1    /dev/sda2     /etc/luks-keys/container1
container2    /dev/sdb1     /etc/luks-keys/container2
```
{% endif %}

---

## Enter the system

```bash
$ arch-chroot /mnt
```

---
