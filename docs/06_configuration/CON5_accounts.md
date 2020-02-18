---
layout: default
title: CON5 Accounts
nav_order: 5
parent: 06 Configuration
permalink: /configuration/accounts/
has_children: true
has_toc: false
---

# Configuration of the accounts
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Root

```bash
passwd
```

## User

```bash
useradd -m -G wheel,realtime,users -s /bin/bash username
passwd username
```

## Sudo

```bash
EDITOR=vim visudo
--------------------
%wheel ALL=(ALL) ALL
```
