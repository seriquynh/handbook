- Show interface and IP address

```bash
ip a
ip link show
nmcli con show
nmcli dev show
# ethtool [INTERFACE]
ethtool eth1
```

- Configuration

| File | Description |
|------|-------------|
| /etc/hosts | Define IP Addresses with network nodes.
| /etc/resolv.conf | Configure DNS server
| /etc/sysconfig/network-scripts/ifcfg-*.conf |
