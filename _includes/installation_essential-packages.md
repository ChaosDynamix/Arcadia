{% assign scenario = include.data %}

## Install the essential packages

```bash
$ pacstrap /mnt base linux linux-firmware {% for package in scenario.packages %}{{ package.name }} {% endfor %}vim man-db man-pages
```

---
