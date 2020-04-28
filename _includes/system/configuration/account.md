## Setup the account

### Change the root password

Passwords must be complex enough to not be easily guessed from e.g. personal information, or cracked using methods like social engineering or brute-force attacks. The tenets of strong passwords are based on length and randomness.

```
$ passwd
```

### Create the user and his password

| Argument       | Description                                                       |
| :------------- | :---------------------------------------------------------------- |
| -m             | Create the user's home directory if it does not exist             |
| -G             | A list of supplementary groups which the user is also a member of |
| -s             | The name of the user's login shell                                |

##### Account
```
$ useradd -m -G wheel -s /bin/bash username
```

##### Password
```
$ passwd username
```

### Allow the wheel group to use sudo

##### EDITOR=vim visudo
```
# Uncomment the line below
%wheel ALL=(ALL) ALL
```

### Enforcing strong passwords using pam_cracklib

##### /etc/pam.d/passwd
```
password required pam_cracklib.so retry=2 minlen=10 difok=6 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1
```
