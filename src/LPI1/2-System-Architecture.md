# System Architecture

## Determine and configure hardware settings

### Definition

Kernel
  - is responsible for managing hardware resources
  - is aware of all resources currenly connected

Linux Kernel is `monolithic` kernel.

### Kernel modules

Kernel modules are pieces of code that can be loaded and unloaded into the kernel upon demand. They extend the functionality of the kernel without the need to reboot the system.

Linux kernel modules are object files (.ko files or .ko.xz files) produced by the C compiler but not linked into a complete executable.

Modules are stored in a directory hierarchy under /lib/modules/{kernel-release}

> Ex: /lib/modules/4.4.0-62-generic

lsmod - List Modules - To list all currently loaded modules

    $ lsmod # read and parse content from /proc/modules file

insmod - Insert Module - To insert a module into the kernel

    $ insmod /path/to/module.ko
    $ insmod /lib/modules/2.6.35.4/kernel/drivers/cdrom/cdrom.ko

rmmod - Remove Module - To remove a loaded module from the kernel

    $ rmmod /path/to/module.ko
    $ rmmod [--verbose] /lib/modules/3.2.0-4-686-pae/kernel/sound/ac97_bus.ko

modprobe - Modules Probe - To add or remove a module by name

    $ modprobe module_name # Add a module
    $ modprobe [-r | --remove] module_name # Remove a module

### /proc - Directory
- Proc file system (procfs) is virtual file system created on fly when system boots and is dissolved at time of system shut down.
- It contains the useful information about the processes that are currently running, it is regarded as control and information centre for kernel.
- The proc file system also provides communication medium between kernel space and user space.

| Sub-Item | Type | Description |
|----------|------|-------------|
| integer | DIR | This directory contains information of process ID. The directory name is exactly process ID.
| /proc/cmdline | FILE | Store the parameters passed to the kernel at the moment it started.
| /proc/cpuinfo | FILE | Store CPU details.
| /proc/meminfo | FILE | Store memory details including swap, cache, physical memory size and available free space.
| /proc/uptime | FILE | Store uptime (seconds elapsed since boot) for individule cpus.
| /proc/version | FILE | Store linux kernel name, version and compiler that is used to build it.
| /proc/vmstat | FILE | Store virtual memory details including page faults, range,...
| /proc/swaps | FILE | Store swap information such as name, size,...
| /proc/mounts | FILE | Store all mounts in-use.
| /proc/crypto | FILE | This file lists all installed cryptographic ciphers used by the Linux kernel, including additional details for each
| /proc/loadavg | FILE | load average in regard to both the CPU and IO over time
| /proc/modules | FILE | Store all modules that are loaded into the system in runtime.
| /proc/mdstat | FILE | Store current information for multi-disk and RAID configurations.
| /proc/partitions | FILE | Store partition block allocation information.
| /proc/devices | FILE | Store various character and block devices currently configured (not including devices whose modules are not loaded).
| /proc/diskstats | FILE | Store I/O statistics of block devices.
| /proc/filesystems | FILE | Store a filesystem type list currently supported by the kernel
| /proc/interrupts | FILE | Store the number of interrupts per IRQ on the x86 architecture.

### /sys - Directory shows a representation of the physical devices in the machine

| Sub-Item | Type | Description |
|----------|------|-------------|
| /sys/block | DIR |
| /sys/bus | DIR |
| /sys/class | DIR |
| /sys/class/net | DIR |
| /sys/dev | DIR |
| /sys/devices | DIR |
| /sys/fireware | DIR |
| /sys/fs | DIR |
| /sys/kernel | DIR | Contain various files and subdirectories that provide information about the running kernel.
| /sys/module | DIR | Contain subdirectories for each module that is loaded into the kernel.

### /dev - Directory

| File | Description |
|------|-------------|
| /dev/zero |
| /dev/null | A black hole which your data sent to will be not seen again. Anything sent to /dev/null will disappear.
| /dev/htX | X is an integer.
| /dev/fd0 | First floppy drive.
| /dev/srX | The CD-ROM drive.
| /dev/cdrom | The CD-ROM linked to /dev/sr0
| /dev/psaux | The PS/2 mouse port
| /dev/sda |
| /dev/vda |

```bash
lshw # List Hardware
lspci # List PCI - Display PCI buses information and devices connected to them.
lsusb # List USB - Display USB buses information and devices attached to them.
```

## Boot the system

MBR - Master Boot Record
- is located at 1st sector of bootable disk.
- is less then 512 bytes in size:
  1. primary boot loader info in 1st 446 bytes: Code (440 bytes), Disk Signature (4 bytes), Nulls (2 bytes)
  2. partition table info in next 64 bytes: Entries (16 bytes)
  3. MBR validation check in last 2 bytes.
- contains GRUB information (or LILO in old systems)
- loads and execute GRUB boot loader (in simple terms)

### Init process

Init (Initialization) is the first process started during booting computer system. (PID = 1)
1. Mount root and other filesystems.
2. Start services.
3. Start getty and display manager.

| Init System | Description |
|-------------|-------------|
| SystemV init | Supported in Linux kernel 2.6.x and earlier releases (CentOS 6 and earlier)
| Systemd init | Support Linux kernel 3.0 and later (CentOS 7, RHEL 7 and later), Ubuntu 15.04 and later.
| Upstart | Supported in Ubuntu 14.x and earlier releases.

### dmesg - Print or control the kernel ring buffer

The kernel ring buffer is a data structure that records messages related to the operation of the kernel. A ring buffer is a special kind of buffer that is always a constant size, removing the oldest messages when new messages come in.

| Option | Example | Description |
|--------|---------|-------------|
| N/A | dmesg | Diplay all messages from the kernel ring buffer
| -C, --clear | dmesg -C | Clear the ring buffer
| -c, --read-clear | dmesg -c | Clear the ring buffer after first printing it's contents.
| -T, --ctime | dmesg -T | Print human-readable timestamps.
| -l, --level | dmesg -lerr,warn | Restrict ouput to the given (comma separated) list of levels.

Available levels:
- emerg - system is unusable
- alert - action must be taken immediately
- crit - critical conditions
- err - error conditions
- warn - warning conditions
- notice - normal but significant condition
- info - informational
- debug - debug-level messages

### journalctl

journalctl is a command to view logs collected by systemd. The systemd-journald service is responsible for systemd's log collection, and it retrieves messages from the kernel, systemd services, and other sources.

These logs are gathered in a central location, which makes them easy to review. Log records in journal are structured and indexed. A result journalctl is able to present your log information in a variety of useful formats.

Watch new records that are collected by systemd-journald

```bash
journalctl -f
```

Show logs within a Time Range.

```bash
journalctl --since "2021-02-27 13:13:13"
journalctl --until "2021-02-27 15:15:15"
journalctl --since "2021-02-27 13:13:13" --until "2021-02-27 15:15:15"
```

Show logs for specific boot.

```bash
journalctl -b # Show logs of the last boot of your server.
journalctl -b 1 # Show logs of the previous boot of your server.
journalctl -b 2 # Show logs of the boot right before the previous boot.
journalctl --list-boots # List available boots.
```

## Install a boot manager

The /boot directory holds files used in booting the operating system.

| Directory/File | Description |
|----------------|-------------|
| File: vmlinuz-* | Linux kernel image
| File: initramfs-* | The basic iniramfs is the root filesystem image used for booting the kernel (mount and use the RAM-based disk as the initial root filesystem)
| Directory: efi | UEFI boot loader
| Directory: grub | GRUB version 1 boot loader configuration
| Directory: grub2 | GRUB version 2 boot loader configuration

`/boot/grub2/grub.cfg` is default configuration file for GRUB 2.

> Do not change this file directly

All settings related to the GRUB2 will be stored in `/etc/default/grub`.

Regerate the `/boot/grub2/grub.cfg` file by the following command:

```bash
grub2-mkconfig -o /boot/grub2/grub.cfg
```

## Change runlevels / boot targets and shutdown or reboot system

### SystemV init

| ID Run Level | Name | Description |
|--------------|------|-------------|
| 0 | Halt | Shutdown the system
| 1 | Single-user mode | For administrative tasks
| 2 | Multi-user mode | Does not configure network interfaces and does not export network services. No NFS (Network File System)
| 3 | Multi-user mode with networking | Start the system normally.
| 4 | Not used/user-definable | For special purposes.
| 5 | Start the system normally with appropriate display manager (with GUI) | Same as runlevel 3 + display manager (X11)
| 6 | Reboot | Reboot the system.

The default runlevel is set in `/etc/inittab` file.

To switch to an another runlevel, use `init` or `telinit` command.

```bash
telinit 0 # or init 0
```

| Runlevel | Scripts Directory |
|----------|-------------------|
| 0 | /etc/rc.d/rc0.d
| 1 | /etc/rc.d/rc1.d
| 2 | /etc/rc.d/rc2.d
| 3 | /etc/rc.d/rc3.d
| 4 | /etc/rc.d/rc4.d
| 5 | /etc/rc.d/rc5.d
| 6 | /etc/rc.d/rc6.d

- `service` service_name action:
  - start
  - stop
  - reload
  - restart
  - force-reload
  - status

/etc/rc.d/init.d : Red Hat/Fedora/CentOS. Also /etc/init.d which linked to /etc/rc.d/init.d <br>
/etc/init.d : S.u.s.e <br>
/etc/init.d : Ubuntu / Debian <br>

```bash
# /etc/init.d/{service_script_filename} start|stop|status|restart|reload
# service {service_script_filename} start|stop|status|restart|reload

# Manage httpd service (Apache2 webserver)
/etc/init.d/httpd start
/etc/init.d/httpd reload
/etc/init.d/httpd restart
/etc/init.d/httpd stop

# Enable/Disable from starting automatically when system startup:
service {service_script_filename} on
service {service_script_filename} off

# List state and run level of all services which can be started by init:
service --status-all
chkconfig --list
```

Ctrl + Alt + Delete in /etc/init/control-alt-delete.conf

### Systemd init

1. Basic Unserstanding

| Runlevel (systemV init) | Description | Target (systemd init) |
|-------------------------|-------------|-----------------------|
| 0 | Shutdown the system | poweroff.target
| 1 | Single-user mode | rescue.target
| 2 | Multi-user mode | multi-user.target
| 3 | Multi-user mode with networking | multi-user.target
| 4 | Not used/user-definable | multi-user.target
| 5 | Start the system normally with appropriate display manager (with GUI). Same as runlevel 3 + display manager (X11) | graphical.target
| 6 | Reboot the system | reboot.target

/etc/systemd/system : Local configuration - units installed by by the system administrator <br>
/usr/lib/systemd/system : Installed packages configuration - unites provided by installed packages <br><br>

![Systemd components](../../images/systemd-components.png "Systemd components")

2. Available unit types

| Unit Type | File Extension | Description |
|-----------|----------------|-------------|
| Service unit | .service | A system service.
| Target unit | .target | A group of systemd units.
| Automount unit | .automount | A file system automount point.
| Device unit | .device | A device file recognized by the kernel.
| Mount unit | .mount | A file system mount point.
| Path unit | .path | A file or directory in a file system.
| Scope unit | .scope | An externally created process.
| Slice unit | .slice | A group of hierarchically organized units that manage system proces.
| Socket unit | .socket | An inter-process communication socket.
| Swap unit | .swap | A swap device or a swap file.
| Timer unit | .timer | A systemd timer.

3. Play with **systemctl**

```bash
# Interact with target
systemctl get-default # Display the default target
systemctl set-default [target] # Set the default target
systemctl isolate [target] # Switch to an another target

# Manage service
# systemctl status|start|stop|restart|reload [service_name].service
systemctl status httpd
systemctl start httpd
systemctl stop httpd
systemctl restart httpd
systemctl reload httpd

# Enable/Disable from starting automatically when system startup:
# systemctl enable|disable [service_name].service
systemctl disable httpd
systemctl enable httpd

# Other commands
systemctl list-units # List all available units.
systemctl is-enable httpd # Check whether httpd.service is enabled.
systemctl is-active httpd # Check whether httpd.service is active (running). Return "active", "inactive" or "unkown"
systemctl is-failed httpd # Check whether httpd.service is failed. Return "active", "failed" on error or "unknown"
# systemctl mask [service_name].service
# systemctl unmask [service_name].service
systemctl daemon-reload # Reload new configuration and scan for new or changed units.
systemctl poweroff # Shutdown the system

# shutdown or reboot command
# shutdown -H, --halt : Halt the machine (Halting involves stopping all CPUs on the system).
# shutdown -P, --poweroff : Power-off the machine (Powering off involves sending an ACPI command to signal the PSU to disconnect main power).
# shutdown -r, --reboot : Reboot the machine.
# shutdown -c : Cancel a pending shutdown.
# reboot # Reboot the machine immediately.
shutdown now # Shutdown immediately
shutdown -r 10
```

To know Ctrl + Alt + Delete, look at /etc/inittab.

"Ctrl-Alt-Delete" is handle by /usr/lib/systemd/system/ctrl-alt-del.target

### wall command

Send a message to all users on terminal.

```bash
$ wall "Hello! I am studing Linux."
```
