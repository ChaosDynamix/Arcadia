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

```bash
{{ scenario.configuration.mkinitcpio -}}
```

### Generate the images
{: .no_toc .mt-6}

```bash
$ mkinitcpio -p linux
```

---
