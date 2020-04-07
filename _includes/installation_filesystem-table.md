{% assign scenario = include.data %}

## Generate the filesystem table

### Generate fstab
{: .no_toc}

```bash
$ genfstab -U /mnt >> /mnt/etc/fstab
```

{% if scenario.storage.has-swapfile %}
### Create the swapfile
{: .no_toc .mt-6}

### Add the swapfile in the fstab
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
