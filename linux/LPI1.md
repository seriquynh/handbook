| Name | Description |
|------|-------------|
| hda | Primary master |
| hdb | Primary slave |
| hdc | Secondary master |
| hdd | Seconrary slave |
| sda | First SCSI disk |
| sdb | Second SCSI disk |
| ... | ...... SCSI disk |
| fd0 | First floppy drive |
| fd1 | Second floppy drive |
| vda | First virtualization-aware disk |
| vdb | Second virtualization-aware disk |
| ... | ...... virtualization-aware disk |

A disk can contains a lot of partitions.

- For sda:
    - sda1 is the first partition of sda disk.
    - sda2 is the second partition of sda disk.
    - sdb1 is the first partition of sdb disk.
    - sdb2 is the second partition of sdb disk.
    - ...

- For vda:
    - vda1 is the first partition of vda disk.
    - ...

Ubuntu Disk Layout:
bin => 1
boot => 2
cdrom
dev => 3
etc => 4
home => 5
initrd.img -> boot/initrd.img-5.4.0-53-generic
initrd.img.old -> boot/initrd.img-5.4.0-52-generic
lib
lib64
lost+found
media
mnt
opt
proc
root => 6
run => 7
sbin => 8
snap
srv
swapfile
sys
tmp => 9
usr => 10
var => 11
vmlinuz -> boot/vmlinuz-5.4.0-53-generic
vmlinuz.old -> boot/vmlinuz-5.4.0-52-generic

### Filesystem Permission

- r ead/write/execute
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
