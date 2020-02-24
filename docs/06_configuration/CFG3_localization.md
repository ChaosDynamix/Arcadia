---
layout: default
title: CFG3 Localization
nav_order: 3
parent: 06 Configuration
permalink: /configuration/localization/
has_children: true
has_toc: false
---

# Configuration of the localization
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Select needed locales

Uncomment the needed locales in `locale.gen`

#### /etc/locale.gen
{: .no_toc .pt-2}

```bash
fr_FR.UTF-8 UTF-8
en_US.UTF-8 UTF-8
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Localization](https://wiki.archlinux.org/index.php/Installation_guide#Localization)

---

## Generate locales

```bash
locale-gen
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Localization](https://wiki.archlinux.org/index.php/Installation_guide#Localization)

---

## Set the system locale

#### /etc/locale.conf
{: .no_toc .pt-4}

```bash
LANG=fr_FR.UTF-8
LC_COLLATE=C
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Localization](https://wiki.archlinux.org/index.php/Installation_guide#Localization)

---

## Set the console locale

#### vconsole.conf
{: .no_toc .pt-4}

```bash
echo KEYMAP=fr-latin9 > /etc/vconsole.conf
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Localization](https://wiki.archlinux.org/index.php/Installation_guide#Localization)
- [Manual - localectl](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/systemd/localectl.1.en)
- [Manual - echo](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/echo.1.en)
