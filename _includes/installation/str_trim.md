## Enable periodic TRIM
{: .d-inline-block .mt-0}

SOLID STATE DRIVE
{: .label .label-blue}

A trim command (known as TRIM in the ATA command set, and UNMAP in the SCSI command set) allows an operating system to inform a solid-state drive (SSD) which blocks of data are no longer considered in use and can be wiped internally.
{: .mt-0}

### Check if your Solid State Drive has TRIM support

DISC-GRAN (discard granularity) and DISC-MAX (discard max bytes) columns must show non-zero values.

```
lsblk --discard
```

### Activate weekly fstrim service
```
systemctl enable fstrim.timer
```

#### References
{: .text-delta .pt-4}

1. [ArchWiki - Solid state drive / TRIM](https://wiki.archlinux.org/index.php/Solid_state_drive#TRIM)
1. [ManPage - Lsblk](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/lsblk.8.en)
1. [ManPage - Systemctl](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/systemd/systemctl.1.en)
{: .fs-3}
