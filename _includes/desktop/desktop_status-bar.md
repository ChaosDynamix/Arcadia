## Install the status bar
{: .d-inline-block .mt-0}

POLYBAR
{: .label .label-blue}

### Install the Arch User Repository needed dependencies
{: .mt-2}

```
$ pacman -S base-devel git
```

### Clone the Polybar repository with git
```
$ git clone https://aur.archlinux.org/polybar.git
```

### Install Polybar
```
$ cd polybar
$ makepkg -si
```
