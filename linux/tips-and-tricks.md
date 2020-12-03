
### SSH

    $ ssh -i ~/.ssh/keyname username@hostname
    $ ssh -o "PubkeyAuthentication=yes" -i ~/.ssh/keyname username@hostname
    $ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

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
