---
layout: default
title: Transmission-cli
permalink: /iso-image/download/bittorrent/transmission-cli/
nav_exclude: true
---

<ol class="breadcrumb-nav-list" style="padding-left:0; position:relative; top:-17px;">
    <li class="breadcrumb-nav-list-item"><a href="https://chaosdynamix.github.io/Andromeda/iso-image/">ISO image</a></li>
    <li class="breadcrumb-nav-list-item"><a href="https://chaosdynamix.github.io/Andromeda/iso-image/download/">Download</a></li>
    <li class="breadcrumb-nav-list-item"><a href="https://chaosdynamix.github.io/Andromeda/iso-image/download/bittorrent/">BitTorrent</a></li>
    <li class="breadcrumb-nav-list-item"><span>Transmission-cli</span></li>
</ol>

# [BitTorrent](/Andromeda/iso-image/download/bittorrent/) / Transmission-cli
{: .mt-0 .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Launch the transmission daemon

```bash
$ transmission-daemon
```

---

## Add the torrent file in transmission

```bash
$ transmission-remote -a archlinux-2020.03.01-x86_64.iso.torrent
```

---

## Check the progress of the download

After finishing the download, please consider sparing the bytes by leaving the client open so you can seed it back.

```bash
$ watch transmission-remote -i
```

---

## Stop the transmission daemon
{: .no_toc .pt-4}

```bash
$ transmission-remote --exit
```

---

## References

### TRANSMISSION
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - Transmission](https://en.wikipedia.org/wiki/Transmission_(BitTorrent_client))
1. [ArchWiki - Transmission](https://wiki.archlinux.org/index.php/Transmission)

### MANUALS
{: .no_toc .text-delta .pt-4}

1. [Man page - transmission-daemon](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/transmission-cli/transmission-daemon.1.en)
1. [Man page - transmission-remote](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/transmission-cli/transmission-remote.1.en)
1. [Man page - watch](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/procps-ng/watch.1.en)
