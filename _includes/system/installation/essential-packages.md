{% assign template = include.template %}
{% assign package = site.data.installation.lvm.package %}

## Install the essential packages

```
$ pacstrap /mnt base linux linux-firmware {{ package }} {% if template.has-raid %}mdadm {% endif -%} vim man-db man-pages
```
