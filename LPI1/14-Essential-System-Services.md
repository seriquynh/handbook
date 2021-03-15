# Essential System Services

## Maintain System Time

### timedatectl

> Refers to "03-Life-in-command-line"

### hwclock

- Hardware Clock refers to Real Time Clock, is an independent clock from the operarating system, always run even the machine is shut down.
- Configuration file is `/etc/adjtime`.

```bash
$ hwclock
$ hwclock --set --date "dd mm yyyy HH:MM"
```

### ntpd or chronyd

- Both keep the local host's time synchronized with the server time. So Use only one of them.
- ntpd stands for Network Time Protocol Daemon.
- Example for `/etc/ntpd.conf`

```conf
# Change servers for synchronization.
server 0.asia.pool.ntp.org iburst
# Add the network range you allow to receive requests
restrict 172.16.0.0 mask 255.255.255.0 nomodify notrap
```

- Example for `/etc/chrony.conf`
```conf
# Change servers for synchronization.
server 0.asia.pool.ntp.org iburst
# Add the network range you allow to receive requests
allow 172.16.0.0/24
```

## System Logging


