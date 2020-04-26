{%- assign package_list = site.data.system.installation.essential-packages.pkgs[page.parent_uuid] %}

## Install the essential packages

```
$ pacstrap /mnt base linux linux-firmware {{ package_list }} vim man-db man-pages
```
