A summary I have studied from IT world.

## Must-read books

- https://books.goalkicker.com/LinuxBook/

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

4. Secure network connections (Eg. Denny all but only accept a few ports,...) with iptables or firewalld.

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

## Tips and Tricks

### SSH

    $ ssh -i ~/.ssh/keyname username@hostname
    $ ssh -o "PubkeyAuthentication=yes" -i ~/.ssh/keyname username@hostname
    $ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

**/etc/ssh/sshd_config**
```txt
PermitRootLogin no # Do not allow to login as "root" user
PasswordAuthentication no # Do not allow to login by password
PermitEmptyPasswords no
PubkeyAuthentication yes # Allow to login by public key
```

**~/.ssh/config**
```txt
Host *
    IgnoreUnknown UseKeychain
    UseKeychain yes

Host hostname
    Hostname hostname-or-ip-address
    User username
    IdentityFile ~/.ssh/id_hostname
    IdentitiesOnly yes
```

### Check the current host name

    $ hostname # or "cat /etc/hostname" to display the host name
    $ hostnamectl # Display host details

### Setup a new host name

    $ sudo hostname new-host-name
    $ sudo echo new-host-name >> /etc/hostname
    $ sudo vim /etc/hosts # and replace '127.0.1.1 old-host-name' with '127.0.1.1 new-host-name'

    $ hostnamectl set-hostname ubuntu

### Get the directory (absolute path) contains calling script

    #!/bin/bash

    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

### Create a new sudo user

```bash
# Create a new user.
adduser <username>

# Add created user to sudo group.
usermod -aG sudo <username>
```

### Reset MySQL root password.

```bash
sudo service mysql stop
sudo mkdir /var/run/mysqld
sudo chown mysql: /var/run/mysqld
sudo mysqld_safe --skip-grant-tables --skip-networking &
mysql -uroot mysql

# UPDATE mysql.user SET authentication_string=PASSWORD('ENTER_YOUR_PASSWORD_HERE'), plugin='mysql_native_password' WHERE User='root';
# EXIT;

sudo mysqladmin -S /var/run/mysqld/mysqld.sock shutdown

sudo service mysql start
```

### Create a new MySQL database with a specific user

```
CREATE USER 'someone'@'localhost' IDENTIFIED BY 'secret';
CREATE DATABASE somedatabase;
GRANT ALL PRIVILEGES ON somedatabase.* TO 'someone'@'localhost';
```

### Create a new mysql container

```bash
docker run --name mysql-5.7 \
    -e MYSQL_ROOT_PASSWORD=secret \
    -e MYSQL_DATABASE=test \
    -e MYSQL_USER=seriquynh \
    -e MYSQL_PASSWORD=secret \
    --detach -p 3306:3306 \
    -v mysql-5.7:/var/lib/mysql \
    mysql:5.7
```
