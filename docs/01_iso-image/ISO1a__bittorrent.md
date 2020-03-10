---
layout: default
title: BitTorrent
permalink: /iso-image/download/bittorrent/
nav_exclude: true
---

[Return to ISO image download](/Andromeda/iso-image/download/){: .btn .btn-purple }

# ISO image download with BitTorrent
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Download Arch Linux ISO image with transmission-cli

### Download the torrent file
{: .no_toc .pt-2}

1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the BitTorrent Download section, download the Torrent file.

### Launch the transmission daemon
{: .no_toc .pt-4}

```bash
$ transmission-daemon
```

### Add the torrent file in transmission
{: .no_toc .pt-4}

```bash
$ transmission-remote -a archlinux-2020.03.01-x86_64.iso.torrent
```

### Check the progress of the download
{: .no_toc .pt-4}

After finishing the download, please consider sparing the bytes by leaving the client open so you can seed it back.

```bash
$ watch transmission-remote -i
```

### Stop the transmission daemon
{: .no_toc .pt-4}

```bash
$ transmission-remote --exit
```

---

### INFORMATIONS
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - BitTorrent](https://en.wikipedia.org/wiki/BitTorrent)
1. [Wikipedia - Comparison of BitTorrent clients](https://en.wikipedia.org/wiki/Comparison_of_BitTorrent_clients)
1. [Wikipedia - Transmission](https://en.wikipedia.org/wiki/Transmission_(BitTorrent_client))

### GUIDES
{: .no_toc .text-delta .pt-2}

1. [ArchWiki - Transmission](https://wiki.archlinux.org/index.php/Transmission)

### MANUALS
{: .no_toc .text-delta .pt-2}

1. [Man page - transmission-daemon](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/transmission-cli/transmission-daemon.1.en)
1. [Man page - transmission-remote](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/transmission-cli/transmission-remote.1.en)
1. [Man page - watch](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/procps-ng/watch.1.en)
