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
