---
layout: default
title: Mirror site
permalink: /iso-image/download/mirror-site/
grand_parent: ISO image
parent: Download
nav_order: 2
---

# ISO image download with a Mirror site
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Identify the mirror sites for your location

1. Open your browser and go to the [Arch Linux Pacman Mirrorlist Generator](https://www.archlinux.org/mirrorlist/)
1. Filter the mirrors site with your country, HTTPS protocol and a mirror status
1. Generate the list

---

## Download the Arch Linux ISO image

1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the HTTP Direct Downloads section, select a mirror site of your generated list (HTTPS)
1. Download the Arch Linux ISO image `archlinux-year.day.month-x86_64.iso`

---

## Download the Arch Linux checksum
{: .d-inline-block}

Warning
{: .label .label-red .mx-2}

Checksum must be downloaded from the Arch Linux download page. The checksum could be manipulated if it is downloaded from a mirror site.
{: .text-red-200}

1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the HTTP Direct Downloads section, copy the checksum of your choice (MD5 or SHA-1)

---

## Create the checksum file

Replace the checksum and the filename accordingly

#### MD5
{: .no_toc .pt-2}

```bash
# archlinux-checksum.txt
00000000000000000000000000000000 archlinux-year.month.day-x86_64.iso
```

#### SHA-1
{: .no_toc .pt-2}

```bash
# archlinux-checksum.txt
0000000000000000000000000000000000000000 archlinux-year.month.day-x86_64.iso
```

---

## Verify the integrity of the ISO image

This part assume that you are in possession of this two files in the same folder.

| File                                    | Description |
| :-------------------------------------- | :---------- |
| archlinux-year.day.month-x86_64.iso     | ISO Image   |
| archlinux-checksum.txt                  | Checksum    |

#### MD5
{: .no_toc .pt-2}

```bash
$ md5sum -c archlinux-checksum.txt
```

#### SHA-1
{: .no_toc .pt-2}

```bash
$ sha1sum -c archlinux-checksum.txt
```

The success of one of these commands confirms that your ISO image was properly downloaded and that your local file is an exact copy of the file present on the mirror site. An error during the download could result in a corrupted file.

---

## References

### MIRROR SITE
{: .no_toc .text-delta .pt-2}

1. [Wikipedia - Mirror site](https://en.wikipedia.org/wiki/Mirror_site)

### CHECKSUM
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - Cryptographic hash function](https://en.wikipedia.org/wiki/Cryptographic_hash_function)
1. [Wikipedia - File verification](https://en.wikipedia.org/wiki/File_verification)
1. [Wikipedia - Checksum](https://en.wikipedia.org/wiki/Checksum)
1. [Wikipedia - Comparison of file verification software](https://en.wikipedia.org/wiki/Comparison_of_file_verification_software)
1. [Wikipedia - MD5](https://en.wikipedia.org/wiki/MD5)
1. [Wikipedia - SHA-1](https://en.wikipedia.org/wiki/SHA-1)

### MANUALS
{: .no_toc .text-delta .pt-4}

1. [Man page - md5sum](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/md5sum.1.en)
1. [Man page - sha1sum](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/sha1sum.1.en)