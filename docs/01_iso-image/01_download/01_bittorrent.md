---
layout: default
title: BitTorrent
permalink: /iso-image/download/bittorrent/
grand_parent: ISO image
parent: Download
nav_order: 1
---

# BitTorrent
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Download the Arch Linux torrent file

1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the BitTorrent Download section, download the Torrent file

---

## Install Transmission-cli

1. With the help of your package manager, install `transmission-cli`

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
{: .pt-4}

```bash
$ transmission-remote --exit
```

---

## References
{: .no_toc}

### MANUALS
{: .no_toc .text-delta}

1. [Arch manual page - Transmission-daemon](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/transmission-cli/transmission-daemon.1.en)
1. [Arch manual page - Transmission-remote](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/transmission-cli/transmission-remote.1.en)
1. [Arch manual page - Watch](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/procps-ng/watch.1.en)
