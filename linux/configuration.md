## SSH Configuration

**/etc/ssh/sshd_config**
```txt
PubkeyAuthentication yes # Allow to login by public key
PasswordAuthentication no # Do not allow to login by password
PermitRootLogin no # Do not allow to login as "root" user
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
