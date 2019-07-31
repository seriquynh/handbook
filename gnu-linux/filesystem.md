
### / - The Root Directory

Everything on the Linux system is located under the / directory, known as the root directory.

### /bin - Essential User Binaries

This directory contains the essential user binaries (programs) that must be present when the system is mounted in single-user mode.

Applications such as Firefox are stored in /usr/bin, while important system programs and utilities such as bash shell are located in /bin because the /usr directory may be stored on another partition. Placing files in the /bin directory ensures the system will have these important utilities even if no other partition is mounted.

### /boot - Static Boot Files

This directory contains the files need to boot the system. The GRUB boot loader’s files and your Linux kernels are stored here.

### /cdrom - Historical Mount Point for CD-ROMs

This directory isn't part of the FHS standard, but you'll still find it on Ubuntu and other operating system. It's a temporary location for CD-ROMs inserted in the system. However, the standard location for temporary media is inside the /media directory.

### /dev - Device Files

This directory contains a lot of files that represent devices (hardware).

### /etc - Configuration Files

This directory contains system-wide configuration files, which can be generally edited munually in a text editor such as vim. User specific configuration files are located in each user's home directory.

### /home - User Home Directory

This directory contains users' home directories. The system contains a user called johndoe, a directory called "johndoe" is located at /home. It contains user's data and configuration files. Each user only has write access to his/her home directory and must obtain elevated permissions (root) to modify other files.

### /lib - Essential Shared Libraries

This directory contains libraries needed by the essential binaries in the /bin and /sbin directories. The same with /usr/bin and /usr/lib.

### /lost+found - Recovered Files

Each Linux file system has a lost+found directory. If the file system crashes, a file system check will be performed at next boot. Any corrupted files found will be placed in the lost+found directory, so you can attempt to recover as much data as possible.

### /media - Removable Media

