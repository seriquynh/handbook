# Life in the command line

```sh
[root@localhost ~] #
[seriquynh@web-01 app] $
```

- root or seriquynh is username.
- localhost or web-01 is hostname. If there are a few servers with domain web-01.domain.com, web-02.domain.com, web-01 or web-02 is hostname.
- ~ or app is current working directory, ~ means home directory of current user.
- `#` is present for the root user.
- `$` is present for regular user in bash, similar to `%` in zsh.

| Shortcut | Description |
|----------|-------------|
| Ctrl + l | Clear screen (same as "clear" command)
| Ctrl + s | Pause all command output to the screen. When an executed command produces long ouput (regularly --verbose), use this shortcut to stop scrolling down.
| Ctrl + q | After using "Ctrl + s", use this shortcut to continue default behavior.
| Ctrl + d | Exit the terminal (same as "exit" command)
| Shift + PageUp | Scroll up screen
| Shift + PageDown | Scroll down screen
| Ctrl + u | Delete from the cursor back to the begin of current line.
| Ctrl + w | Delete from the cursor back to the previous word.
| Ctrl + r | Start a reserve search, through the bash history.Simply type characters that should be unique to the command you want to find in history
| Ctrl + a | Move the cursor to the begin of current line.
| Ctrl + e | Move the cursor to the end of current line.
| Atl + f | Move the cursor to begin of the next word.
| Atl + b | Move the cursor back the begin of the previous word.
| Ctrl + f | Move the cursor to the next position (same as right arrow button).
| Ctrl + b | Move the cursor back the previous position (same as left arrow button).

### history

This command is able to keep track of command lines that is executed by user in terminal.

bash has `.bash_history`, zsh has `.zsh_history`

```bash
history # Print typed and executed lines in format "number line" such as "2035 clear"
history 5 # Print 5 previous lines
!2035 # Re-execute line that has number 2035
history -c # Delete history
HISTTIMEFORMAT="%c " history # Use $HISTTIMEFORMAT to display each history line with datetime
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

### uname - Print certain system information

| Option | Output Example | Description |
|--------|----------------|-------------|
| uname -a, --all | | Print all information.
| uname -s, --kernel-name | Linux | Print the kernel name.
| uname -n, --nodename | web-01 | Print the the network hostname.
| uname -r, --kernel-release | 4.4.0-87-generic | Print the kernel release version.
| uname -p, --processor | x86_64 | Print the processor type, or "unkown".
| uname -m, --machine | x86_64 | Print the machine hardware name.
| uname -i, --hardware-platform | x86_64 | Print the hardware platform.
| uname -o, --operating-system | GNU\Linux | Print the operating system.

### ls - List

List information about the FILEs (the current directory by default).
Sort entries alphabetically if none of -cftuvSUX nor --sort is specified.

```bash

# ls [-a|--all] - Do not ignore items that begins with "." character.
# ls -l - Print results in long list format.
# ls [-R|--recursive] - Also list sub items recursively.
# ls -Z, --context - Print any SELinux security context of each file.
# ls -s, --size - Print the allocated size of each file, in blocks.
```

### cd - Change Directory

```bash
cd other/source # Relative path with current directory.
cd /path/to/other/source # Absolute path
cd - # Navigate to the last directory you were working in.
cd ~ # or just cd Navigate to the current user's home directory.
cd .. # Go to the parent directory of current directory (mind the space between cd and .. )
```

### mkdir - Make directory

```bash
cd /var/log
mkdir LogLPI1 # Use relative path to make a directory inside an existing parent directory.
mkdir /var/log/LogLPI1 # Use absolute path to make a directory inside an existing parent directory.
mkdir -p /mydata/seriquynh/mysqldata # Make parent directories if not exist or ignore if exist.
```

### rmdir - Remove empty directory

Useful to remove an empty directory that is created by a mistake (wrong name for example).

```bash
# rmdir /var/log/LogLPI1 : Remove LogLPI1 inside /var/log.
# rmdir -p, --parents a/b/c : Remove c inside a/b, then remove b inside a and finally remove a.
```

### rm - Remove file or directory

```bash
rm -rf /path/to/file_or_directory # Force to delete file or directory (recursively).
```
