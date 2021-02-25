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
