### cp - Copy

Copy SOURCE to DEST, or multiple SOURCE(s) to DIRECTORY.

```bash
# Copy a file using relative paths
cp source.txt dest.txt
# Copy a file using absolute paths
cp /path/to/source.txt /path/to/absolute.txt
# Copy all directories within contents of the source directory to the dest directory
cp /path/to/source/** /path/to/dest/
```

### df

Show information about the file system on which each FILE resides, or all file systems by default.

```bash
df -h
```

### Free

Show information about memory and swap.

```bash
free -h
```

### touch

Update the access and modification times of each FILE to the current time

```bash
touch foo.txt # Create foo.txt file if not exist
touch -a foo.txt # change only the access time
touch -m foo.txt # change only the modification time
```
