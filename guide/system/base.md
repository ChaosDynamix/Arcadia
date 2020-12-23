---
title     : !!str Base
nav_order : !!int 1
permalink : !!str /system/base
parent    : !!str System
---

{% include installation/sys_pacstrap.md %}

---

{% include installation/str_fstab.md %}

---

{% include installation/sys_chroot.md %}
