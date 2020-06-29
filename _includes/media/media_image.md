## Download Arch Linux official ISO

#### BITTORRENT

BitTorrent (abbreviated to BT) is a communication protocol for peer-to-peer file sharing (P2P) which is used to distribute data and electronic files over the Internet.

Rather than downloading a file from a single source server, the BitTorrent protocol allows users to join a "swarm" of hosts to upload to/download from each other simultaneously.

BitTorrent does not, on its own, offer its users anonymity. One can usually see the IP addresses of all peers in a swarm in one's own client or firewall program. This may expose users with insecure systems to attacks.

### Download the Arch Linux torrent file and signature

1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the BitTorrent Download section, download the Torrent file
1. Under the HTTP Direct Downloads section, download the PGP signature

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
$ transmission-remote -a archlinux-year.month.day-x86_64.iso.torrent
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

### References

1. [Wikipedia - BitTorrent](https://en.wikipedia.org/wiki/BitTorrent)
1. [Wikipedia - Transmission](https://en.wikipedia.org/wiki/Transmission_(BitTorrent_client))
1. [Wikipedia - Digital signature](https://en.wikipedia.org/wiki/Digital_signature)
1. [ArchWiki - Transmission](https://wiki.archlinux.org/index.php/Transmission)
1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide#Verify_signature)
1. [ArchWiki - GnuPG](https://wiki.archlinux.org/index.php/GnuPG)
1. [ManPage - Transmission-daemon](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/transmission-cli/transmission-daemon.1.en)
1. [ManPage - Transmission-remote](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/transmission-cli/transmission-remote.1.en)
1. [ManPage - Watch](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/procps-ng/watch.1.en)
1. [ManPage - Gpg](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/gnupg/gpg.1.en)
{: .fs-3}

#### MIRROR

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

### References

1. [Wikipedia - Mirror site](https://en.wikipedia.org/wiki/Mirror_site)
1. [Wikipedia - Cheksum](https://en.wikipedia.org/wiki/Checksum)
1. [Wikipedia - Digital signature](https://en.wikipedia.org/wiki/Digital_signature)
1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide#Verify_signature)
1. [ArchWiki - GnuPG](https://wiki.archlinux.org/index.php/GnuPG)
1. [ManPage - Md5sum](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/md5sum.1.en)
1. [ManPage - Sha1sum](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/sha1sum.1.en)
1. [ManPage - Gpg](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/gnupg/gpg.1.en)
{: .fs-3}
