---
layout: default
title: Internet connection
permalink: /live-environment/internet-connection/
parent: Live environment
nav_order: 3
---

# Live environment / Internet connection
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Ensure your network interface is listed and enabled

```bash
$ ip link
```

---

## Check connectivity

```bash
$ ping -c 3 archlinux.org
```

---

## References
{: .no_toc}

### INTERNET
{: .no_toc .text-delta .pt-2}

1. [ArchWiki - Installation guide - Connect to the internet](https://wiki.archlinux.org/index.php/Installation_guide#Connect_to_the_internet)

### MANUALS
{: .no_toc .text-delta .pt-4}

1. [Man pages - ping](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/iputils/ping.8.en)
