# Lazy To Read

## Setup Simple Linux Server

Originally from [Servers For Hackers](https://serversforhackers.com/s/fresh-server-security-setup)

1. Create a new user for special purpose instead of using root.
2. Configure SSH connections (Eg. Prevent logging with password, deny login as root by password,...).

```bash
# Important
PermitRootLogin no
PasswordAuthentication no

# Double check these
PubkeyAuthentication yes
PermitEmptyPasswords no

# Optional
AllowUsers fideloper
AllowGroups sudo ssh
```

3. Secure network connections (Eg. Denny all but only accept a few ports,...) with iptables or firewalld.

```bash
### Setup INPUT chain rules
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT # ssh tcp port
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT # http tcp port
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT # https tcp port
sudo iptables -A INPUT -j DROP

### Append your specified ports.
sudo iptables -I INPUT 6 -p tcp --dport 8080 -j ACCEPT
sudo iptables -D INPUT 6 # Remove a rule at index 6

### Save your rules
sudo apt-get install -y netfilters-persistent # Install it (this should save your current rules)
sudo iptables-save > /etc/iptables/rules.v4 # Persist for next reboot (may be unnecessary)
```

5. Manage limit access with fail2ban.

```bash
apt install fail2ban -y
# Make sure this content exists in a file of /etc/fail2ban/jail.d directory
# [sshd]
# enabled=true
```

## Check or setup a hostname

    $ hostname # or "cat /etc/hostname" to display the host name
    $ hostnamectl # Display host details
    $ sudo hostname new-host-name
    $ sudo echo new-host-name >> /etc/hostname
    $ sudo vim /etc/hosts # and replace '127.0.1.1 old-host-name' with '127.0.1.1 new-host-name'

    $ hostnamectl set-hostname ubuntu

## Get the directory (absolute path) contains calling script

    #!/bin/bash

    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
