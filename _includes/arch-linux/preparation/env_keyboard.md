## Live environment keyboard

The default console keymap is US. **Skip this section if your keyboard layout match the default one**.

![Representation of the US default keyboard layout for Arch Linux](https://upload.wikimedia.org/wikipedia/commons/5/51/KB_United_States-NoAltGr.svg)

### Load the correct keyboard layout

The command below load the French keyboard layout. If you need an other keyboard layout, list all the available keyboard layouts with the command `ls /usr/share/kbd/keymaps/**/*.map.gz | less` and replace `fr-latin9` in the above command.

```
loadkeys fr-latin9
```

### References
{: .text-delta .pt-4}

1. [Wikipedia - Keyboard layout](https://en.wikipedia.org/wiki/Keyboard_layout)
1. [ArchWiki - Keyboard configuration](https://wiki.archlinux.org/index.php/Linux_console/Keyboard_configuration)
1. [ManPage - Ls](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ls.1.en)
1. [ManPage - Less](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/less/less.1.en)
1. [ManPage - Grep](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/grep/grep.1.en)
1. [ManPage - Loadkeys](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/kbd/loadkeys.1.en)
{: .fs-3}
