---
layout: default
title: ISO1a Transmission-cli
grand_parent: 01 ISO image
parent: ISO1 Download
nav_order: 1
permalink: /iso-image/download/transmission-cli/
---

# ISO image download with transmission-cli
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

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
