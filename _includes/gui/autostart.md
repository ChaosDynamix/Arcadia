## Autostart {{ page.parent }} at login

### Edit the configuration of your shell

If the Bash profile does not exist, copy a skeleton version from `/etc/skel/.bash_profile`.

| Shell    | Profile         |
| :------- | :-------------- |
| Bash     | ~/.bash_profile |
| Zsh      | ~/.zprofile     |

```
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    startx
fi
```

When connecting, if xorg does not launch, you may have connected too quickly before the system was ready. To be sure everything is fine, quit and reconnect, xorg should start as expected.
