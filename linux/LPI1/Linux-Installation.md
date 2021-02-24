## File-System-Hierarchy

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

> A disk can contains a lot of partitions.

- For sda:
    - sda1 is the first partition of sda disk.
    - sda2 is the second partition of sda disk.
    - sdb1 is the first partition of sdb disk.
    - sdb2 is the second partition of sdb disk.
    - ...

- For vda:
    - vda1 is the first partition of vda disk.
    - ...
- Ubuntu Disk Layout

```bash
# There are only 11 standard directories
bin # 1
boot # 2
cdrom
dev # 3
etc # 4
home # 5
initrd.img -> boot/initrd.img-5.4.0-53-generic
initrd.img.old -> boot/initrd.img-5.4.0-52-generic
lib
lib64
lost+found
media
mnt
opt
proc
root # 6
run # 7
sbin # 8
snap
srv
swapfile
sys
tmp # 9
usr # 10
var # 11
vmlinuz -> boot/vmlinuz-5.4.0-53-generic
vmlinuz.old -> boot/vmlinuz-5.4.0-52-generic
```
