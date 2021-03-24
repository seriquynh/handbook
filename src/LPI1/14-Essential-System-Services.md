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

Logs in Linux can be classified into four types:
- Application logs
- Event logs
- Service logs
- System logs

| Log file | Description |
|----------|-------------|
| /var/log/messages | Store generic system activity logs (informative and non-critical system messages).
| /var/log/auth.log | All authentication events for Debian and Ubuntu.
| /var/log/secure | For RedHat and CentOS based systems.
| /var/log/boot.log | Messages during the system startup process.

### dmesg

> Refers to "2-System-Architecture"

### journaling (journalctl)

> Refers to "2-System-Architecture"

### rsyslog - Rocket-fast system for log processing.

// TODO

## Mail Transfer Agent (MTA) basics

// TODO

## Manage printers and printing

// TODO

