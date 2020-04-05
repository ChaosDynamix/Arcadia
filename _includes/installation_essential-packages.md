{% assign scenario = include.data %}

## Install the essential packages

```bash
$ pacstrap /mnt base linux linux-firmware {{ scenario.controller-package }} vim man-db man-pages
```

---
