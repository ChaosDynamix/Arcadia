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

---

## Enter the system

```bash
$ arch-chroot /mnt
```

---
