---
layout: default
title: Download
permalink: /iso-image/download/
parent: ISO image
nav_order: 1
has_children: true
has_toc: false
---

# ISO image download
{: .mb-4}

The Arch Linux ISO download step can be achieve using one of the two solutions below.
{: .fs-5}

---

## [BitTorrent](/Andromeda/iso-image/download/bittorrent/)
{: .d-inline-block}

Recommended
{: .label .label-green .ml-2}

No anonymity
{: .label .label-red}

BitTorrent (abbreviated to BT) is a communication protocol for peer-to-peer file sharing (P2P) which is used to distribute data and electronic files over the Internet.

Rather than downloading a file from a single source server, the BitTorrent protocol allows users to join a "swarm" of hosts to upload to/download from each other simultaneously.

With BitTorrent, the file being distributed is divided into segments called pieces. Each piece is protected by a cryptographic hash (checksum) contained in the torrent descriptor. This ensures that any modification of the piece can be reliably detected, and thus prevents both accidental and malicious modifications of any of the pieces received at other nodes.

BitTorrent does not, on its own, offer its users anonymity. One can usually see the IP addresses of all peers in a swarm in one's own client or firewall program. This may expose users with insecure systems to attacks.

---

## [Mirror site](/Andromeda/iso-image/download/mirror-site/)

Mirror sites or mirrors are replicas of other websites or any network node. The concept of mirroring applies to network services accessible through any protocol, such as HTTP or FTP.

Such sites have different URLs than the original site, but host identical or near-identical content. Mirror sites are often located in a different geographic region than the original, or upstream site.

With a Mirror site using HTTP(s) direct download, no integrity verification are done, we need to manually copy the cryptographic hash (checksum) provided by Arch Linux and test it againt the file we just downloaded.

---

## References

### BITTORRENT
{: .no_toc .text-delta .pt-2}

1. [Wikipedia - BitTorrent](https://en.wikipedia.org/wiki/BitTorrent)

### MIRROR SITE
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - Mirror site](https://en.wikipedia.org/wiki/Mirror_site)

### CRYPTOGRAPHY
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - Cryptographic hash function](https://en.wikipedia.org/wiki/Cryptographic_hash_function)
1. [Wikipedia - File verification](https://en.wikipedia.org/wiki/File_verification)
1. [Wikipedia - Checksum](https://en.wikipedia.org/wiki/Checksum)
