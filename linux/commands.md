
### cd - Change Directory

Change the shell working directory.

```bash
cd other/source # Relative paths
cd /path/to/other/source # Absolute paths
cd - # Navigate to the last directory you were working in.
cd ~ # or just cd Navigate to the current user's home directory.
cd .. # Go to the parent directory of current directory (mind the space between cd and .. )
```

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

### history

Display or manipulate the history list.

```bash
# 2021  vim .bashrc
# 2022  clear
# 2023  ls --help
# 2024  ls -lA
!2024 # Execute the command "ls -lA" from history
```

### ls - List

List information about the FILEs (the current directory by default).
Sort entries alphabetically if none of -cftuvSUX nor --sort is specified.

```bash
# -a --all                     do not ignore entries starting with .
# -A --almost-all              do not list implied . and ..
# -l                           use a long list format
#    --group-directories-first group directories before files;
ls -la
ls -lA
```

### pwd - Print Working Directory

Print the name of the current working directory.

```bash
cd /tmp
pwd # Print the value of $PWD variable
mkdir test # Make "test" directory
ln -s /tmp/test /tmp/test2 # Create a symbolic link
cd test2
pwd # -L is used by default
pwd -P # Print the physical directory without any symbolic links
```

### touch

Update the access and modification times of each FILE to the current time

```bash
touch foo.txt # Create foo.txt file if not exist
touch -a foo.txt # change only the access time
touch -m foo.txt # change only the modification time
```
