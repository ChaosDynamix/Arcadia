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
