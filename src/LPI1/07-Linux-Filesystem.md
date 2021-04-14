# Linux Filesystem

## Partitioning Scheme

MBR vs GPT

| Property | MBR | GPT |
|----------|-----|-----|
| Stands for | Master Boot Record | GUID Partition
| Partition table size | 64 bytes <br> (4 primary partitions or 3 primary partitions + 1 extended partision) | Nearly unlimited number of partitions (16,384 bytes). <br> Depends on OS.
| Stored length of partition size | 4 bytes | 8 bytes
| Maximum partition size | 2TB | 9.4ZB <br> Depends on OS.

## Utilities

- The fdisk family (fdisk, cfdisk and sfdisk) handles MBR and a few more exotic partition tables but not for GPT.
- GNU Parted (libparted) - command-line or GUI tools handles MBR, GPT and various other partition table types.
- GPT fdisk (gdisk, cgdisk and sgdisk) is modelled after the fdisk family but for GPT.
- **Superblock** contains all of the information about how the filesystem is configured (block size, block address range and mount status).
- **i-nodes** (128 bytes) contains file attributes and a map indicating when blocks of the file are located on the disk.
- **Data-block** is where file contents are stored.

## Filesystem

### ext2 - The second extended filesystem

- Was introduced in 1993, developed by Rémy Card.
- Overcomes the limitation of the original ext filesystem.
- Does not have journaling feature.
- Recommended for flash or usb devices as it needn't to do the over head of journaling.
- Maximum individual file size can be in 16GB - 2TB (A file size it up to 2TB).
- Maximum filesystem size can be in 2TB - 32TB.

### ext3 - The third extended filesystem

- Was introduced in 2001, developed by Stephen Tweedie.
- Available for Linux Kernel from version 2.4.15.
- Allows journaling that has a dedicated area in the filesystem, where all changes are tracked. When the system crashes, the possibility of filesystem corruption is less.
- Maximum individual file size can be in 16GB - 2TB (A file size it up to 2TB).
- Maximum filesystem size can be in 2TB - 32TB.
- A directory can contain up to 32000 subdirectories.
- Three types of journaling:
  1. Journal - Metadata and content are saved in the journal.
  2. Ordered - Only metadata is saved in the journal. It is journaled (by default) only after writing the content to disk.
  3. Writeback - Only metadata is saved in the journal. It might be journaled before or after writing the content to disk.
- Can be converted from ext2 without backup or restore.

### ext4 - The fourth extended filesystem

- Was introduced in 2008.
- Available for Linux Kernel from version 2.6.19.
- Supports huge individual file size and overall filesystem size.
- Maximum individual file size can be in 16GB - 16TB (A file size it up to 16TB).
- Maximum filesystem size can be in 1EB (Exabyte). 1EB = 1024PB (Petabyte), 1PB = 2014TB (Terabyte).
- A directory can contain up to 64000 subdirectories.
- Can be mounted from an exsting ext3 without upgrading.
- Has several features such as multiblock, allocation, deplayed allocation, journal, checksum and fast fsck,...
- Can disable journal.

### xfs

- For a 64-bit implementation, XFS can handle filesystem up to 18EB with a muximum file size up to 9EB and unlimited number of files.
- XFS supports metadata journaling, which
- XFS filesystem can also be defragmented and enlarged while mouted and active.

Comparison Filesystem Table

| Property | ext2 | ext3 | ext4 | xfs |
|----------|------|------|------|-----|
| Maximum individual file size | 16GB - 2TB | 16GB - 2TB | 16GB - 16TB | 9EB
| Maximum filesystem size | 2TB - 32TB | 2TB - 32TB | 1EB | 18EB
| Jounraling | no | yes | yes (on/off) | yes
| Maximum directories | 31998 | 31998 | unlimited | -
| Journal checksum | no | no | yes | - |
| Multiblock allocation and deplayed allocation | no | no | yes | -

### Mounting

```bash
# // TODO
```
