## Setup the Gnome keyring for the passwords

Gnome-keyring allow you to store passwords for the current user. Those passwords are encrypted with the password of this user. This is very usefull if you are connected to a wifi network or if you use git in your workflow.

### Install Gnome-keyring
```
$ pacman -S gnome-keyring libsecret seahorse
```

{% if page.parent == "Xfce4" %}
### Activate Gnome services at start

To achieve this step we will take advantage of Xfce4, simply tick the checkbox `Launch GNOME services on startup` in the Advanced tab of Session and Startup in Xfce's settings. This will also disable gpg-agent and ssh-agent.

The keyring will not be unlocked automatically at start but this can be an advantage if you are concerned by the security as the keyring is unlock only when you need it.
{% else %}
### Edit the login configuration for gnome-keyring

The configuration below allow gnome keyring to start at login. It also unlock the keyring automatically.

##### /etc/pam.d/login
```
#%PAM-1.0

auth       required     pam_securetty.so
auth       requisite    pam_nologin.so
auth       include      system-local-login
auth       optional     pam_gnome_keyring.so
account    include      system-local-login
session    include      system-local-login
session    optional     pam_gnome_keyring.so auto_start
```
{% endif %}
