## Setup the Systemd network manager

Systemd-networkd is a system daemon that manages network configurations. It detects and configures network devices as they appear (it can also create virtual network devices).

This service can be especially useful to set up complex network configurations for a container managed by systemd-nspawn or for virtual machines. It also works fine on simple connections.

### Enable the required services
```
systemctl enable systemd-networkd.service
systemctl enable systemd-resolved.service
```

### Create the configuration in `/etc/systemd/network/20-wired.network`
```
[Match]
Name=eno1

[Network]
DHCP=yes
```

**Caution**: Replace `eno1` if your network interface is different. 
{: .fs-3 .text-red-200}

#### References
{: .text-delta .pt-4}

1. [ArchWiki - Systemd-networkd](https://wiki.archlinux.org/index.php/Systemd-networkd)
1. [ArchWiki - Network configuration](https://wiki.archlinux.org/index.php/Network_configuration)
1. [ManPage - Systemctl](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/systemd/systemctl.1.en)
1. [ManPage - Networkctl](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/systemd/networkctl.1.en)
{: .fs-3}