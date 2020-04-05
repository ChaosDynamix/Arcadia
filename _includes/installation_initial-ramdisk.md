{% assign scenario = include.data %}

## Setup the initial ramdisk images

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

{% if scenario.controller == "lvm"  %}

```bash
FILES={{ scenario.mkinitcpio-files }}
HOOKS={{ scenario.mkinitcpio-hooks }}
```

{% elsif scenario.controller == "btrfs"  %}

```bash
BINARIES=(/usr/bin/btrfs)
FILES={{ scenario.mkinitcpio-files }}
HOOKS={{ scenario.mkinitcpio-hooks }}
```

{% endif %}

### Generate the images
{: .no_toc .mt-6}

```bash
$ mkinitcpio -p linux
```

---
