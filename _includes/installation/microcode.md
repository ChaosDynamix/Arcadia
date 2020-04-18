## Install the Microcode of your CPU

Processors may have faulty behaviour, which the kernel can correct by updating the microcode on startup.

#### AMD
```
$ pacman -S amd-ucode
```

#### INTEL
```
$ pacman -S intel-ucode
```

---
