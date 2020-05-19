
### Edit the pacman configuration

##### /etc/pacman.conf
```
[multilib]
Include = /etc/pacman.d/mirrorlist
```

### Update the repositories
```
$ pacman -Syu
```

### Get informations about your video card
```
$ lspci -k | grep -A 2 -E "(VGA|3D)"
```

### Install the packages

#### OpenGL
```
$ pacman -S mesa lib32-mesa
```

#### Vulkan
```
$ pacman -S vulkan-icd-loader lib32-vulkan-icd-loader
```

#### Nvidia
```
$ pacman -S nvidia lib32-nvidia-utils
```

### Activate (DMS) Kernel Mode Setting

In order to run rootless Xorg, we need to manually activate Direct Rendering Manager Kernel Mode Setting.

##### /etc/mkinitcpio.conf
```
MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
```

##### /etc/default/grub
```
GRUB_CMDLINE_LINUX_DEFAULT="nvidia-drm.modeset=1"
```

To avoid the possibility of forgetting to update initramfs after an NVIDIA driver upgrade, you may want to use a pacman hook

##### /etc/pacman.d/hooks/nvidia.hook
```
[Trigger]
Operation=Install
Operation=Upgrade
Operation=Remove
Type=Package
Target=nvidia
Target=linux
# Change the linux part above and in the Exec line if a different kernel is used

[Action]
Description=Update Nvidia module in initcpio
Depends=mkinitcpio
When=PostTransaction
NeedsTargets
Exec=/bin/sh -c 'while read -r trg; do case $trg in linux) exit 0; esac; done; /usr/bin/mkinitcpio -P'
```
