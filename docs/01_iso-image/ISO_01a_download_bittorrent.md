---
layout: default
title: ISO_BitTorrent
parent: ISO_Download
grand_parent: ISO image
nav_order: 1
permalink: /iso-image/download/bittorrent/
---

# ISO image download with BitTorrent
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Install a BitTorrent client

To send or receive files, a person uses a BitTorrent client on their Internet-connected computer. A BitTorrent client is a computer program that implements the BitTorrent protocol. A comparison of BitTorrent clients can be found in the sources section.

A web-seed capable client is recommended for download Arch Linux as it provide fastest download speeds.

### Web-seeding
{: .no_toc}

Web  "seeding" is the ability of BitTorrent clients to download torrent pieces from an HTTP source in addition to the  "swarm". The advantage of this feature is that a website may distribute a torrent for a particular file or batch of files and make those files available for download from that same web server. This can simplify  long-term seeding and load balancing through the use of existing, cheap, web hosting setups.

### References
{: .no_toc .text-delta .pt-5}

- [Wikipedia - BitTorrent](https://en.wikipedia.org/wiki/BitTorrent)
- [Wikipedia - Comparison of BitTorrent clients](https://en.wikipedia.org/wiki/Comparison_of_BitTorrent_clients)

---

## Download Arch Linux

1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the BitTorrent Download section, click on the Torrent link.
1. Open the BitTorrent client of your choice
1. Add the torrent file
1. Wait until the Arch Linux ISO image is fully downloaded

After finishing the download, please consider sparing the bytes by leaving the client open so you can seed it back.

### Using Transmission
{: .no_toc}

This section show the Arch Linux download procedure using `transmission-cli` package on Linux.

```bash
# Launch the daemon
$ transmission-daemon

# Add and start the download of Arch Linux using the torrent file
# Replace the link accordingly (years.day.month)
$ transmission-remote -a https://www.archlinux.org/releng/releases/2020.01.01/torrent/

# Check the progress of the download
$ transmission-remote -l

# Stop the daemon after the image is fully downloaded
$ transmission-remote --exit
```

### References
{: .no_toc .text-delta .pt-5}

- [Arch Linux - Download page](https://www.archlinux.org/download/)
- [ArchWiki - Transmission](https://wiki.archlinux.org/index.php/Transmission)
- [Manual - transmission-daemon](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/transmission-cli/transmission-daemon.1.en)
- [Manual - transmission-remote](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/transmission-cli/transmission-remote.1.en)
