
The Linux Directory Structure

    /bin
    /boot
    /cdrom
    /dev
    /etc
    /home
    /lib
    /lost+found
    /media
    /mnt
    /opt
    /proc
    /run
    /sbin
    /srv
    /tmp
    /usr
        /bin
        /lib
        /sbin
    /var

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

This directory contains subdirectories where removable media devices inserted into the computer are mounted. There are some common devices including: CD, HDD, USB,...

### /mnt - Temporary Mount Points

This is where system administrators mounted temporary file systems while using them. For example, if you’re mounting a Windows partition to perform some file recovery operations, you might mount it at /mnt/windows.

### /opt - Optional Packages

This directory contains subdirectories for optional software packgages that are commonly proprietary.

### /proc - Kernel & Process Files

This directory is similar to /dev directory because it doesn't contain standard files. It contains special files that represent system and process information.

### /root - Root Home Directory

The home directory for the root user is located at /root instead of /home/root.

### /run - Application State Files

The /run directory is fairly new, and gives applications a standard place to store transient files they require like sockets and process IDs. These files can't be stored in /tmp because the files inisde /tmp may be deleted.

### /sbin - System Administration Binaries

This directory is similar to /bin directory. It contains essential binaries that are generally intended to be run by the root user for system administration.

### /selinux - SELinux Virtual File System

If your Linux distribution uses SELinux for security (Fedora and Red Hat, for example), this directory contains special files used by SELinux. Ubuntu doesn't has /selinux directory.

### /srv - Service Data

This directory contains “data for services provided by the system.” If you were using the Apache HTTP server to serve a website, you’d likely store your website’s files in a directory inside the /srv directory.

### /tmp - Temporary Files

All applications store temporary files in this directory. These files are automatically deleted whenever the system is restared or any time by utilities.

### /usr - User Binaries & Read-Only Data

This directory contains applications and files used by users.

/usr/bin ~ /bin
/usr/lib ~ /lib
/usr/sbin ~ /usr/sbin

### /var - Variable Data Files

This directory is writable counterpart to the /usr directory, which must be read-only in normal operation.
