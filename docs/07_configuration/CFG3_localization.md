---
layout: default
title: CON3 Localization
nav_order: 3
parent: 07 Configuration
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

## Localization

#### Select needed locales

```bash
vim /etc/locale.gen
-------------------
fr_FR.UTF-8 UTF-8
en_US.UTF-8 UTF-8
```

#### Generate locales

```bash
locale-gen
```

#### Setup system locale

```bash
vim /etc/locale.conf
--------------------
LANG=fr_FR.UTF-8
LC_COLLATE=C
```

#### Setup console locale

```bash
localectl set-keymap --no-convert keymap
```

```bash
echo KEYMAP=fr-latin9 > /etc/vconsole.conf
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Localization](https://wiki.archlinux.org/index.php/Installation_guide#Localization)
- [Man - echo](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/echo.1.en)
