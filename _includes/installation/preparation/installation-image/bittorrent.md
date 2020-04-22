## Download the Arch Linux torrent file and signature

1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the BitTorrent Download section, download the Torrent file
1. Under the HTTP Direct Downloads section, download the PGP signature

---

## Install Transmission-cli

```
$ pacman -S transmission-cli
```

---

## Launch the transmission daemon

```
$ transmission-daemon
```

---

## Add the torrent file in transmission

```
$ transmission-remote -a archlinux-2020.03.01-x86_64.iso.torrent
```

---

## Check the progress of the download

After finishing the download, please consider sparing the bytes by leaving the client open so you can seed it back.

```
$ watch transmission-remote -i
```

---

## Stop the transmission daemon

```
$ transmission-remote --exit
```

---

## Verify the authenticity of the ISO image

Replace the name of the file accordingly

```
$ gpg --keyserver-options auto-key-retrieve --verify archlinux-year.month.day-x86_64.iso.sig
```
