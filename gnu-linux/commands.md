
### cp

Copy SOURCE to DEST, or multiple SOURCE(s) to DIRECTORY.

```bash
$ # Copy a file using relative paths
$ cp source.txt dest.txt
$ # Copy a file using absolute paths
$ cp /path/to/source.txt /path/to/absolute.txt
$ # Copy all directories within contents of the source directory to the dest directory
$ cp /path/to/source/** /path/to/dest/
```

### pwd

Print Working Directory - Print the name of the current working directory.

```bash
$ cd /tmp
$ pwd # Print the value of $PWD variable
$ mkdir test # Make "test" directory
$ ln -s /tmp/test /tmp/test2 # Create a symbolic link
$ cd test2
$ pwd # -L is used by default
$ pwd -P # Print the physical directory without any symbolic links
```
