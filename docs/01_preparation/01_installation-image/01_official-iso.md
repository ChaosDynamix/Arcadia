---
layout: default
title: Official ISO
permalink: /preparation/installation-image/official-iso/
grand_parent: Preparation
parent: Installation image
nav_order: 1
---

# Official ISO
{: .mb-4}

Choose one of the two solutions below.
{: .fs-5}

## SOLUTIONS
{: .no_toc .text-delta}

1. TOC
{:toc}

---

Checksum and signature must be downloaded from the Arch Linux download page. The checksum and signature could be manipulated if it is downloaded from a mirror site.
{: .text-red-200}

## BitTorrent
{: .d-inline-block .mt-0}

Recommended
{: .label .label-green .ml-2}

No anonymity
{: .label .label-red}

BitTorrent (abbreviated to BT) is a communication protocol for peer-to-peer file sharing (P2P) which is used to distribute data and electronic files over the Internet.

Rather than downloading a file from a single source server, the BitTorrent protocol allows users to join a "swarm" of hosts to upload to/download from each other simultaneously.

BitTorrent does not, on its own, offer its users anonymity. One can usually see the IP addresses of all peers in a swarm in one's own client or firewall program. This may expose users with insecure systems to attacks.

### Download the Arch Linux torrent file and signature
1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the BitTorrent Download section, download the Torrent file
1. Under the HTTP Direct Downloads section, download the PGP signature.

### Install Transmission-cli
```
$ pacman -S transmission-cli
```

### Launch the transmission daemon
```
$ transmission-daemon
```

### Add the torrent file in transmission
```
$ transmission-remote -a archlinux-2020.03.01-x86_64.iso.torrent
```

### Check the progress of the download
After finishing the download, please consider sparing the bytes by leaving the client open so you can seed it back.

```
$ watch transmission-remote -i
```

### Stop the transmission daemon
```
$ transmission-remote --exit
```

### Verify the authenticity of the ISO image

Replace the name of the file accordingly

```
$ gpg --keyserver-options auto-key-retrieve --verify archlinux-year.month.day-x86_64.iso.sig
```

---

## Mirror site

Mirror sites or mirrors are replicas of other websites or any network node. The concept of mirroring applies to network services accessible through any protocol, such as HTTP or FTP.

Such sites have different URLs than the original site, but host identical or near-identical content. Mirror sites are often located in a different geographic region than the original, or upstream site.

### Identify the mirror sites for your location
1. Open your browser and go to the [Arch Linux Pacman Mirrorlist Generator](https://www.archlinux.org/mirrorlist/)
1. Filter the mirrors site with your country, HTTPS protocol and a mirror status
1. Generate the list

### Download the Arch Linux ISO image
1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the HTTP Direct Downloads section, select a mirror site of your generated list (HTTPS)
1. Download the Arch Linux ISO image `archlinux-year.day.month-x86_64.iso`

### Download the Arch Linux checksum and signature
1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the HTTP Direct Downloads section, copy the checksum of your choice (MD5 or SHA-1)
1. Under the HTTP Direct Downloads section, download the PGP signature.

### Create the checksum file

Replace the checksum and the filename accordingly

```
$ echo "00000000000000000000000000000000 archlinux-year.month.day-x86_64.iso" > archlinux-checksum.txt
```

### Verify the integrity of the ISO image

Make sure that the ISO image and the checksum file are in the same folder.

#### MD5
```
$ md5sum -c archlinux-checksum.txt
```

#### SHA-1
```
$ sha1sum -c archlinux-checksum.txt
```

The success of one of these commands confirms that your ISO image was properly downloaded and that your local file is an exact copy of the file present on the mirror site. An error during the download could result in a corrupted file.

### Verify the authenticity of the ISO image

Replace the name of the file accordingly

```
$ gpg --keyserver-options auto-key-retrieve --verify archlinux-year.month.day-x86_64.iso.sig
```

---
