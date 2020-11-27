## Setup the timezone

This following command create an `/etc/localtime` symlink that points to a zoneinfo file under `/usr/share/zoneinfo/`.

```
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
```

**Note**: This command set the Paris timezone, if you are living in a different area, run `ls /usr/share/zoneinfo/` to select your location and replace `Europe/Paris` in the above command.
{: .fs-3}

#### References
{: .text-delta .pt-4}

1. [Wikipedia - Timezone](https://en.wikipedia.org/wiki/Time_zone)
1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide)
1. [ManPage - Ln](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ln.1.en)
1. [ManPage - Ls](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ls.1.en)
{: .fs-3}
