{% assign profile = include.profile %}

## Install the essential packages

```
$ pacstrap /mnt base linux linux-firmware {{ profile.pkgs }} vim man-db man-pages
```
