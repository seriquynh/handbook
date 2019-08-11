
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
