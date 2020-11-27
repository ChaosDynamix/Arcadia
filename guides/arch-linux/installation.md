---
title     : !!str Installation
parent    : !!str Arch Linux
nav_order : !!int 2
permalink : !!str /arch-linux/installation
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% include arch-linux/installation/sys_pacstrap.md %}

---

{% include arch-linux/installation/str_fstab.md %}

---

{% include arch-linux/installation/sys_chroot.md %}

---

{% include arch-linux/installation/str_swapfile.md %}

---

{% include arch-linux/installation/sys_timezone.md %}

---

{% include arch-linux/installation/sys_clock.md %}

---

{% include arch-linux/installation/sys_language.md %}

---

{% include arch-linux/installation/net_configuration.md %}

---

{% include arch-linux/installation/net_manager.md %}

---

{% include arch-linux/installation/str_trim.md %}

---

{% include arch-linux/installation/sys_users.md %}

---

{% include arch-linux/installation/boo_initramfs.md %}

---

{% include arch-linux/installation/boo_microcode.md %}

---

{% include arch-linux/installation/boo_manager.md %}

---

{% include arch-linux/installation/sys_reboot.md %}
