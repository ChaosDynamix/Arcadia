---
layout: default
title: ISO1 Download
nav_order: 1
parent: 01 ISO image
permalink: /iso-image/download/
has_toc: false
---

# ISO image download
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

Downloading The Arch Linux ISO image can be done with ether BitTorrent protocol or HTTP(S) direct downloads on a mirror site.
{: .fs-5}

---

## With BitTorrent
{: .d-inline-block}

Recommended
{: .label .label-green .mx-2}

No anonymity
{: .label .label-red .mx-0}

BitTorrent  is a communication protocol for peer-to-peer file sharing (P2P). Rather than downloading a file from a single source server, the  BitTorrent protocol allows users to join a "swarm" of hosts to upload  to/download from each other simultaneously.

The file being distributed is divided into segments called "pieces".  Each piece is protected by a cryptographic hash contained in the torrent descriptor. This ensures that any modification of the piece can be reliably detected, and thus prevents both accidental and malicious modifications of any of the pieces received at other nodes.

The BitTorrent protocol also can be used to reduce the server and network impact of distributing large files. Arch Linux mirrors servers can benefit from that solution as there are less solicited.

BitTorrent does not, on its own, offer its users anonymity.  One can usually see the IP addresses of all peers in a swarm in one's own client or firewall program.

### Web-seeding
{: .no_toc .pt-4}

Web  "seeding" is the ability of BitTorrent clients to download torrent pieces from an HTTP source in addition to the  "swarm". The advantage of this feature is that a website may distribute a torrent for a particular file or batch of files and make those files available for download from that same web server. This can simplify  long-term seeding and load balancing through the use of existing, cheap, web hosting setups.

### Install a BitTorrent client
{: .no_toc .pt-4}

To send or receive files, a person uses a BitTorrent client on their Internet-connected computer. A BitTorrent client is a computer program that implements the BitTorrent protocol. A comparison of BitTorrent clients can be found in the References section.

A web-seed capable client is recommended for download Arch Linux as it provide fastest download speeds.

### Download the ISO image
{: .no_toc .pt-4}

1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the BitTorrent Download section, click on the Torrent link.
1. Open the BitTorrent client of your choice
1. Add the torrent file
1. Wait until the Arch Linux ISO image is fully downloaded

After finishing the download, please consider sparing the bytes by leaving the client open so you can seed it back.

### References
{: .no_toc .text-delta .pt-4}

- [Wikipedia - BitTorrent](https://en.wikipedia.org/wiki/BitTorrent)
- [Wikipedia - Comparison of BitTorrent clients](https://en.wikipedia.org/wiki/Comparison_of_BitTorrent_clients)

---

## With a Mirror site

Mirror sites or mirrors are replicas of other websites or any network node. Such sites have different URLs than the original site, but host identical or near-identical content. Mirror sites are often located in a different geographic region than the original, or upstream site.

The purpose of mirrors is to reduce network traffic, improve access speed, ensure availability of the original site for technical or political reasons, or provide a real-time backup of the original site.

In our context, the mirror sites linked on the Arch Linux website provide packages and installation files for all the users.

### Download the ISO image
{: .no_toc .pt-4}

1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the HTTP Direct Downloads section, click on a mirror server located in your country
1. Download the Arch Linux ISO image `archlinux-year.day.month-x86_64.iso`


### References
{: .no_toc .text-delta .pt-4}

- [Wikipedia - Mirror site](https://en.wikipedia.org/wiki/Mirror_site)
