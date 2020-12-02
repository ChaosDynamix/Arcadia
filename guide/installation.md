---
title     : !!str Installation
nav_order : !!int 2
permalink : !!str /installation
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% include installation/sys_pacstrap.md %}

---

{% include installation/str_fstab.md %}

---

{% include installation/sys_chroot.md %}

---

{% include installation/str_swapfile.md %}

---

{% include installation/sys_timezone.md %}

---

{% include installation/sys_clock.md %}

---

{% include installation/sys_language.md %}

---

{% include installation/net_configuration.md %}

---

{% include installation/net_manager.md %}

---

{% include installation/str_trim.md %}

---

{% include installation/sys_users.md %}

---

{% include installation/boo_initramfs.md %}

---

{% include installation/boo_microcode.md %}

---

{% include installation/boo_manager.md %}

---

{% include installation/sys_reboot.md %}
