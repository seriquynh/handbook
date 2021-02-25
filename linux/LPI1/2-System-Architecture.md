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

## Know the hardware

### /proc
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

/sys
- Shows a representation of the physical devices in the machine
