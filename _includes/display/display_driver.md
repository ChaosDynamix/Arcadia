## Install the display driver
{: .d-inline-block .mt-0}

NVIDIA
{: .label .label-blue}

### Edit the pacman configuration
{: .mt-2}

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

---

## Activate (DMS) Kernel Mode Setting

In order to run rootless Xorg, we need to manually activate Direct Rendering Manager Kernel Mode Setting.

### Early KMS start

##### /etc/mkinitcpio.conf
```
MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
```

### Late KMS start

##### /etc/default/grub
```
GRUB_CMDLINE_LINUX_DEFAULT="...nvidia-drm.modeset=1"
```

**Note**: The 3 dots represents the rest of your command, do not delete any argument.
{: .fs-3}

### Generate the images and update Grub configuration
```
$ mkinitcpio -p linux
$ grub-mkconfig -o /boot/grub/grub.cfg
```

### Create a pacman hook

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

[Action]
Description=Update Nvidia module in initcpio
Depends=mkinitcpio
When=PostTransaction
NeedsTargets
Exec=/bin/sh -c 'while read -r trg; do case $trg in linux) exit 0; esac; done; /usr/bin/mkinitcpio -P'
```

**Note**: Change `linux` value for Target above and in the Exec line if a different kernel is used
{: .fs-3}
