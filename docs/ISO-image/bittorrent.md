---
layout: default
title: BitTorrent
parent: Download
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

## About
 
BitTorrent  is a communication protocol for peer-to-peer file sharing (P2P). Rather than downloading a file from a single source server, the  BitTorrent protocol allows users to join a "swarm" of hosts to upload  to/download from each other simultaneously.

**Warning !** BitTorrent does not, on its own, offer its users anonymity.  One can usually see the IP addresses of all peers in a swarm in one's own client or firewall program.

### Why this is recommended ?
{: .no_toc}

The file being distributed is divided into segments called "pieces".  Each piece is protected by a cryptographic hash contained in the torrent descriptor. This ensures that any modification of the piece can be reliably detected, and thus prevents both accidental and malicious modifications of any of the pieces received at other nodes.

The BitTorrent protocol also can be used to reduce the server and network impact of distributing large files. Arch Linux mirrors servers can benefit from that solution as there are less solicited.
 
### References
{: .no_toc .text-delta .pt-5}

- [Wikipedia - BitTorrent](https://en.wikipedia.org/wiki/BitTorrent)

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
