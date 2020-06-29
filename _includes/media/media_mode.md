## Verify the boot mode

### List the EFI variables

```
$ ls /sys/firmware/efi/efivars
```

If the output is a list of variables, the system is booted in UEFI without CSM mode. If the directory does not exist, the system may be booted in BIOS or UEFI with CSM mode.

| Firmware           | Result | Partitioning mode |
| :----------------- | :----- | :---------------- |
| UEFI               | True   | UEFI / GPT        |
| UEFI with CSM mode | False  | BIOS / GPT        |
| BIOS               | False  | BIOS / GPT        |

### References

1. [Wikipedia - Firmware](https://en.wikipedia.org/wiki/Firmware)
1. [Wikipedia - BIOS](https://en.wikipedia.org/wiki/BIOS)
1. [Wikipedia - UEFI](https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface)
1. [ArchWiki - UEFI](https://wiki.archlinux.org/index.php/Unified_Extensible_Firmware_Interface)
1. [ManPage - Ls](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ls.1.en)
{: .fs-3}
