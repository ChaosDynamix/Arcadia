## Connect another system into the live environment with SSH
{: .d-inline-block .mt-0}

OPTIONAL
{: .label .label-blue}

Secure Shell (SSH) is a cryptographic network protocol for operating network services securely over an unsecured network. Typical applications include remote command-line login and remote command execution, but any network service can be secured with SSH.

In this context, SSH daemon can be started to allow other systems to connect into the current live environment. It can be useful if you want to display this website and copy and paste commands.

### Get the ip address of your network interface
```
ip address show dev eno1
```

**Caution**: Replace `eno1` if your network interface name is different.
{: .fs-3 .text-red-200}

### Set the root password
```
passwd
```

### Start the SSH daemon
```
systemctl start sshd.service
```

### Start the SSH connection as root

This command must be running from another system than the current computer you want to install Arch Linux on.

```
ssh root@192.168.1.10
```

**Caution**: Replace `192.168.1.10` if your ip address is different.
{: .fs-3 .text-red-200}

### References
{: .text-delta .pt-4}

1. [Wikipedia - Computer network](https://en.wikipedia.org/wiki/Computer_network)
1. [ArchWiki - Network configuration](https://wiki.archlinux.org/index.php/Network_configuration#IP_addresses)
1. [ArchWiki - Secure shell](https://wiki.archlinux.org/index.php/Secure_Shell)
1. [ArchWiki - OpenSSH](https://wiki.archlinux.org/index.php/OpenSSH#Server_usage)
1. [ManPage - Ip-address](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/iproute2/ip-address.8.en)
{: .fs-3}
