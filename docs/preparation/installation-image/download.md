---
title: Download
---

# Download
This page describes how to download the official ISO image, the checksum and the signature of the Arch Linux latest release.

## Download the Arch Linux ISO image
Downloading the Arch Linux ISO image can be done from any mirror, but it might be better to select a mirror close to your geographic location. The proximity of a mirror maximizes your chances of downloading the ISO image with the best download speed.

### Select the best mirror
1. Open your browser and go to the [Arch Linux pacman mirrorlist generator](https://www.archlinux.org/mirrorlist/).
1. Filter the mirrors according to the closest **country** to yours and the **HTTPS** protocol.
1. Generate the list

### Download the ISO image
Now that you have a list of mirrors that match your criteria, you can go to one of those mirrors and download the Arch Linux ISO image.

1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Click on one of the **HTTPS** mirror sites of your generated list.
1. Download the Arch Linux ISO image `archlinux-year.day.month-x86_64.iso`

### References
1. [Wikipedia - Mirror site](https://en.wikipedia.org/wiki/Mirror_site)

## Download the Arch Linux ISO image checksum
In the next section (verification), The checksum will allow us to verify if the downloaded file is the same as the one provided by the Arch Linux team.

1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/).
1. Under the HTTP Direct Downloads section, copy the **SHA-1** checksum in your clipboard.

You can now create the checksum file with the following command. Dont forget to replace `<CHECKSUM>` with the SHA-1 checksum previously copied from the Arch Linux download page.

```
echo "<CHECKSUM> archlinux-year.month.day-x86_64.iso" > archlinux-year.month.day-x86_64.iso.txt
```

### References
1. [Wikipedia - File verification](https://en.wikipedia.org/wiki/File_verification)
1. [Wikipedia - Cryptographic hash function](https://en.wikipedia.org/wiki/Cryptographic_hash_function)
1. [Wikipedia - Cheksum](https://en.wikipedia.org/wiki/Checksum)
1. [Wikipedia - SHA-1](https://en.wikipedia.org/wiki/SHA-1)

## Download the Arch Linux ISO image signature
In the next section (verification), The signature will allow us to verify if the downloaded file is signed by the same person as the one provided by the Arch Linux team.

1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the HTTP Direct Downloads section, download the **PGP** signature.

### References
1. [Wikipedia - File verification](https://en.wikipedia.org/wiki/File_verification)
1. [Wikipedia - Digital signature](https://en.wikipedia.org/wiki/Digital_signature)
