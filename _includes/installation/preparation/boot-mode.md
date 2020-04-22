## Verify the boot mode

### List the EFI variables

```
$ ls /sys/firmware/efi/efivars
```

| Firmware           | Result |
| :----------------- | :----- |
| UEFI               | Yes    |
| UEFI with CSM mode | No     |
| BIOS               | No     |
