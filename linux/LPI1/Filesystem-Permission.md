### Filesystem Permission

- read/write/execute
- access control list

u=user owner
g=group owner
o=other users
a=everyone

+ -> append more permission
- -> remove permission
= -> assign permission(s)

`chmod` command
```bash
chmod u+x /somefile # append execute permission for user owner on /somefile.
chmod u-x /somefile # remove execute permission for user owner on /somefile.
chmod u=rwx /somefile # set all permissions for user owner on /somefile.
```

`chown` command
```bash
chown newuser /somefile # Only change user owner of /somefile.
chown :newgroup /somefile # Only change group user of /somefile.
chown newuser:newgroup /somefile # Change both user and group owner of /somefile.
```

`chgrp` command
```bash
chgrp newgroup /somefile # Change group owner of /somefile.
```

setuid permission
setgid permission
sticky bit

umask is used to set default file/directory permission.
