---
layout: default
title: Download
nav_order: 1
parent: ISO image
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

## BitTorrent

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

## Mirror site

Mirror sites or mirrors are replicas of other websites or any network node. Such sites have different URLs than the original site, but host identical or near-identical content. Mirror sites are often located in a different geographic region than the original, or upstream site.

The purpose of mirrors is to reduce network traffic, improve access speed, ensure availability of the original site for technical or political reasons, or provide a real-time backup of the original site.

In our context, the mirror sites linked on the Arch Linux website provide packages and installation files for all the users.

### References
{: .no_toc .text-delta .pt-5}

- [Wikipedia - Mirror site](https://en.wikipedia.org/wiki/Mirror_site)
