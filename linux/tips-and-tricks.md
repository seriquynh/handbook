
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
