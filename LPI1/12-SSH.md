SSH stands for Secure Socket Shell
- is a network protocol
- A SSH server (by default) listens on the standard TCP port 22.
- is a method for secure remote login from on computer to an another.
- has the advantages below:
  - Secure remote access to SSH-enabled network systems or devices, for users or automated processes.
  - Secure and interactive/automated file transfer session.
  - Secure issuance of commands on remote.
  - Secure management of network infrastructure components.

```bash
# SSH Server configration : /etc/ssh/sshd_config
# Port 22
# ListenAddress [address] : Local adress that ssh should listen to.
# AddressFamily any|inet|inet6
# PasswordAuthentication yes/no : Enable/disable authentication with password.
# PermitRootLogin yes/no/prohibit-password : Enable/disable authentication as root user or do not allow authentication with password.
# HostKey
# PubkeyAuthentication yes/no : Enable/disable authentication with public key.
# X11Forwarding yes/no : Enable/disable X11 forwarding.

# SSH Client configration : /etc/ssh/ssh_config
# systemctl [command] sshd

# Connect to a remove via SSH
ssh -p 22 user@hostname

# Generate a keys pair
ssh-keygen -b 4096 -t rsa -C "seriquynh@gmail.com"

# Copy a public key from client to remote
ssh-copy-id user@hostname
```
