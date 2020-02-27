---
layout: default
title: 01 Download
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

### Download the ISO image
{: .no_toc .pt-4}

1. Install a BitTorrent client
1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the BitTorrent Download section, click on the Torrent link.
1. Open the BitTorrent client of your choice
1. Add the torrent file
1. Wait until the Arch Linux ISO image is fully downloaded

After finishing the download, please consider sparing the bytes by leaving the client open so you can seed it back.

### Using Transmission
{: .no_toc .d-inline-block}

Linux
{: .label .mx-2}

This section show the Arch Linux download procedure using `transmission-cli` package.

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
{: .no_toc .text-delta .pt-4}

- [Wikipedia - BitTorrent](https://en.wikipedia.org/wiki/BitTorrent)
- [Wikipedia - Comparison of BitTorrent clients](https://en.wikipedia.org/wiki/Comparison_of_BitTorrent_clients)
- [Arch Linux - Download page](https://www.archlinux.org/download/)
- [ArchWiki - Transmission](https://wiki.archlinux.org/index.php/Transmission)
- [Manual - transmission-daemon](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/transmission-cli/transmission-daemon.1.en)
- [Manual - transmission-remote](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/transmission-cli/transmission-remote.1.en)

---

## With a Mirror site

Mirror sites or mirrors are replicas of other websites or any network node. Such sites have different URLs than the original site, but host identical or near-identical content. Mirror sites are often located in a different geographic region than the original, or upstream site.

### Download the ISO image
{: .no_toc .pt-4}

1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the HTTP Direct Downloads section, click on a mirror server located in your country
1. Download the Arch Linux ISO image `archlinux-year.day.month-x86_64.iso`


### References
{: .no_toc .text-delta .pt-4}

- [Wikipedia - Mirror site](https://en.wikipedia.org/wiki/Mirror_site)
