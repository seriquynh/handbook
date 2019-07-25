
### Check the current host name

```bash
$ hostname # or "cat /etc/hostname" to display the host name
$ hostnamectl # Display host details
```

### Setup a new host name

```bash
$ sudo hostname new-host-name
$ sudo echo new-host-name >> /etc/hostname
$ sudo vim /etc/hosts # and replace '127.0.1.1 old-host-name' with '127.0.1.1 new-host-name'
```

```bash
$ hostnamectl set-hostname ubuntu
```
