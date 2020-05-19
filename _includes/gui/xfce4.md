## Install the packages

```
$ pacman -S xfce4 network-manager-applet numlockx
```

### Edit the Xinit configuration

##### ~/.xinitrc
```
numlockx &
setxkbmap -model pc104 -layout fr -variant latin9 &

exec startxfce4
```