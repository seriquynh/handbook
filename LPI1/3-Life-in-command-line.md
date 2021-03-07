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
| Ctrl + k | Delete from the cursor to the end of current line.
| Ctrl + w | Delete from the cursor back to the previous word.
| Ctrl + r | Start a reserve search, through the bash history.Simply type characters that should be unique to the command you want to find in history
| Ctrl + a | Move the cursor to the begin of current line.
| Ctrl + e | Move the cursor to the end of current line.
| Atl + f | Move the cursor to begin of the next word.
| Atl + b | Move the cursor back the begin of the previous word.
| Ctrl + f | Move the cursor to the next position (same as right arrow button).
| Ctrl + b | Move the cursor back the previous position (same as left arrow button).
| Ctrl + xx | Move between the beginning of the line and the current position of the cursor.
| Ctrl + p | Take the previous command, similar to Up arrow key.
| Ctrl + n | Take the next command, similar to Down arrow key.

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

Linux localhost.localdomain 3.10.0-1127.el7.x86_64  x86_64 x86_64 x86_64 GNU/Linux

| Option | Output Example | Description |
|--------|----------------|-------------|
| uname -a, --all | | Print all information in order of these options below (uname -snrvpmio)
| uname -s, --kernel-name | Linux | Print the kernel name.
| uname -n, --nodename | localhost.localdomain | Print the the network hostname.
| uname -r, --kernel-release | 3.10.0-1127.el7.x86_64 | Print the kernel release.
| uname -v, --kernel-version | #1 SMP Tue Mar 31 23:36:51 UTC 2020 | Print the kernel version.
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

### cp - Copy

| Option | Description |
|--------|-------------|
| -a | archive files
| -f | Force copy by remove desition if neccessary.
| -i | Interactive - asking before overiting
| -l | Link instead of copy.
| -L | Follow symbolic links.
| -n | No file override.
| -r, -R, --recursive | Recursive copy directory including hidden files.
| -u | Update - copy when source is newer than destiation.

```bash
# Copy a file using relative paths
cp source.txt dest.txt
# Copy a file using absolute paths
cp /path/to/source.txt /path/to/absolute.txt
# Copy all directories within contents of the source directory to the dest directory
cp /path/to/source/** /path/to/dest/
```

```bash
# /tmp/test1 and /tmp/test2 directories don't exist.
cd tmp
mkdir test1
# /tmp/test2 doesn't exist, so /tmp/test2 will be created and the same with /tmp/test1.
cp -a test1 test2
# /tmp/test2 exists, /tmp/test2/test1 will be created and the same with /tmp/test1.
cp -a test1 test2 # So we should use "cp -a test1 test2/" this means "copy test1 into test2 directory
```

### mv - Move

| Option | Description |
|--------|-------------|
| -f, --force | Always overwrite existing files without prompting. It's helpful if you need to overwrite multiple files whose permissions are ready-only; If you don't use this option, you will be prompted each file.
| -i, --interactive | Always prompt before overwriting, regardless or file permissions.
| -n, --no-clobber | Never overwrite any existing file.

### cat and tac - Show file contents

```bash
echo "1. Thanks for reading" >> /tmp/hello.txt
echo "2. Have you used Linux" >> /tmp/hello.txt
# cat <path_to_file>
cat /tmp/hello.txt # or "cd tmp && cat hello.txt"
1. Thanks for reading
2. Have you used Linux
# tac <path_to_file>
tac /tmp/hello.txt # or "cd tmp && tac hello.txt"
2. Have you used Linux
1. Thanks for reading
```

### touch - Change file timestamps

```bash
# It's more helpful to create a new empty file.
# If hello.txt doesn't exist, it will be created.
# If hello.txt exists, it's timestamps will be modified.
touch hello.txt
```

### head and tail - Display a piece of file content

```bash
head /var/log/dmesg # Display first 10 lines of /var/log/dmesg
head -n20 /var/log/dmesg # Display first 20 lines or /var/log/dmesg

tail /var/log/dmesg # Display last 10 lines of /var/log/dmesg
tail -n20 /var/log/dmesg # Display last 20 lines of /var/log/dmesg
tail -f /var/log/nginx/access.log # Listen and ouput whenever new lines was addedd to /var/log/nginx/access.log file
```

### date

```bash
# Display time by default
date
Sat Feb 27 03:34:17 UTC 2021
# Display time in format
date +"%Y-%m-%d %H:%M:%S"
2021-02-27 03:36:23
# date -s <DATE_STRING>
# DATE_STRING= "Sun, 29 Feb 2004 16:21:42 -0800" or "2004-02-29 16:21:42" or even "next Thursday"
```

### timedatectl

```bash
# Show current settings of the system clock and RTC.
timedatectl
      Local time: Sat 2021-02-27 03:42:08 UTC
  Universal time: Sat 2021-02-27 03:42:08 UTC
        RTC time: Sat 2021-02-27 03:42:48
       Time zone: UTC (UTC, +0000)
     NTP enabled: yes
NTP synchronized: no
 RTC in local TZ: no
      DST active: n/a
# Show all available timeszones.
timedatectl list-timezones
# Set timezone.
timedatectl set-timezone "Asia/Ho_Chi_Minh"
# Set time hh:mm:ss
timedatectl set-time 17:37:57
# set date yyyy-mm-dd
timedatectl set-time 2021-02-27
```

### passwd - Change user password

```bash
passwd # Change current user password.
passwd seriquynh # Change password for "seriquynh" user.
```

### echo - Output something to console
### hostname and hostnamectl

```bash
# display hostname
hostname
localhost.localdomain
# Change hostname.
nmtui hostname Your-New-Host-Name-Here
hostnamectl set-hostname Your-New-Host-Name-Here
hostnamectl set-hostname "Your New Host Name Here" --pretty
hostnamectl set-hostname Your-New-Host-Name-Here --static
hostnamectl set-homename Your-New-Host-Name-Here --transient
```

### wget

A free tool for non-interactive download of files from web. I supports HTTP, HTTPS and FTP, also via HTTP proxies.

```bash
wget https://getcomposer.org/installer # Download composer installer file.
wget https://getcomposer.org/installer -O composer-setup.php # Download composer installer file but save as "composer-setup.php" instead of default name from web.
```

### dd

Useful for creating a large file.

```bash
# dd if=[input file] of=[output file] bs=[block size] count=[count]
dd if=/dev/zero of=/tmp/testfile bs=1M count=1024 # Create a file that has size 1MB * 1024 = 1024 MB = 1G
dd if=/dev/zero of=/tmp/testfile2 bs=512M count=2 # Create a file that has size 512MB * 2 = 1024 MB = 1G
```

### find - Search for files or directories

```bash
# -type : Search by type "d" or "f".
# -name : Search by name.
# -user : Search by owner.
# -size : Search by size (MB).
# -atime, -ctime, -mtime : Search by access, creation or modification days.
# -amin, -cmin, -mmin: Search by access, creation or modification minutes.
# -newer FILE : Search for stuff that are newer than FILE. (which is created later will be newer).
find /tmp -name log # Search for stuff called "log" inside "/tmp" directory.
find /tmp -type d # Search for directories inside "/tmp" directory.
find /tmp -type f # Search for files inside "/tmp" directory.
find /tmp -user seriquynh # Search for stuff whose owner is seriquynh.
find /tmp -user seriquynh -exec echo "--- {}" \; # Foreach line for "find /tmp -user seriquynh" and pass into {}
find /var -type d -name log # Search for directory named log inside /var directory.
find /var/log -name *.log # Search for files (with .log extension) inside /var/log directory.
find /var/log -name *.log -mtime 30
find /var/log -name *.log -mtime -30 -mtime +90
find /var/log -name *.log -cmin -60
find /var/log -size -50 -size +100
```

### zip, unzip

```bash
# zip [options] [archive_file.zip] [file/directory]
cd /tmp
touch file{1..5}.txt
zip myfile.zip file{1..3}.txt # create myfile.zip and add 3 files to it.
zip mytmp.zip -r /tmp # create mytmp.zip and add recursively /tmp directory.
zip myfile2.zip file{1..5}.txt -x file3.txt # create myfile.zip and add files to it exclude file3.txt.
zip myfile3.zip -e # Ask for password encryption.

mkdir extract
mv *.zip extract/
cd extract
unzip myfile.zip # Extract myfile.zip right here.
unzip myfile.zip -d mydir # Extract myfile.zip to mydir.
unzip myfile.zip -d mydir2 -x file1.txt # Exclude file1.txt from extracting.
unzip -l myfile.zip # List all items inside myfile.zip with details.
rm -f *.txt
echo 'file1.txt exists' > file1.txt
unzip -n myfile.zip # Prevent overwiting existing files.
unzip -P[password] myfile.zip
```

A few other commands are bzip/bzip2 (bunzip/bunzip2), gzip/gunzip and xz/unxz.

[Read more](https://unix.stackexchange.com/questions/108100/why-are-tar-archive-formats-switching-to-xz-compression-to-replace-bzip2-and-wha#:~:text=Compared%20to%20bzip2%2C%20xz%20has,uses%20less%20memory%20than%20either.)

### cpio - Copy in, Copy out

```bash
mkdir /tmp/try-cpio
cd /tmp/try-cpio
touch file{1..10}.txt
# // TODO: could not try on CentOS7
```

> // TODO: tar command

### wc - Word Count

Count newlines, words, and bytes of input.

```bash
echo 'Linux is awesome' | wc
# 1 3 17 : 1 line, 3 words, 17 characters.
# wc -l, --lines [file] : Print lines count of file.
# wc -w, --words [file] : Print words count of file.
# wc -m, --chars [file] : Print chars count of file.
# wc -c, --bytes [file] : Print total bytes of file.
# wc -L, --max-line-length [file] : Print the length of the longest line of file.
```

### tr - Translate

```bash
$ echo 'linux is awesome' | tr [a-Z] [A-Z] # lower to upper case.
LINUX IS AWESOME
```

### nl

```bash
# List content of file with line number in the begin of each file.
ll / | nl
```

### sort

```bash
cd /tmp
echo 'CentOS' > oslist.txt
echo 'Ubuntu' >> oslist.txt
echo 'Fedora' >> oslist.txt
echo 'RedHat' >> oslist.txt
echo 'Debian' >> oslist.txt

sort oslist.txt
sort -r oslist.txt
```

### split

### uniq

### env, export

### which

## Manage shared Libraries

- static libraries are bound to a program statically at compile time.
- dynamic or shared libraies are loaded when a program is launched.

```bash
echo $LD_LIBRARY_PATH
ldd /bin/ls # Show shared libraries of ls command.
```

- shared libaries are located in lots of places that slows down loaded time. ldconfig read content of /etc/ld.so.conf and create symbolic links to all library files and put in /etc/ld.so.cache.

## Streams, Redirects and Pipelines

### Streams

| Number | Channel | Description | Default connection | Usage |
|--------|------|-------------|--------------------|-------|
| 0 | stdin | Standard input | Keyboard | Read only
| 1 | stdout | Standard ouput | Terminal | Write only
| 2 | stderr | Standard error | Terminal | Write only
| 3+ | filename | Other files | none | read and/or write

### Redirects

| Redirect | Description |
|----------|-------------|
| [command] > myfile.txt | Redirect nornal output of a command to "myfile.txt" (overwrite).
| [command] >> myfile.txt | Redirect nornal ouput of a command to "myfile.txt" (append to end of file).
| [command] < myfile.txt | Import "myfile.txt".

```bash
ls -l /tmp > /tmp/myfile.txt # Overite myfile.txt by output from ls command (Create /tmp/myfile if not exist).
echo "Linux is awesome" >> /tmp/myfile.txt # Append "Linux is awesome" to myfile.txt

echo "/root" > /tmp/rootdir.txt
ls -l < /tmp/rootdir.txt
```

| Syntax | Description |
|-------|-------------|
| > myfile.txt | Normal ouput to myfile.txt (overwrite), Error output to stderr.
| >> myfile.txt | Normal output to myfile.txt (append), Error output to stderr.
| 2> myfile.txt | Normal output to stdout, Error output to myfile.txt.
| 2> /dev/null | Normal output to stdout, Error output to /dev/null.
| > myfile.txt 2>&1 | Error output as Normal output to myfile.txt (overwrite).
| &> myfile.txt | Same as "> myfile.txt 2>&1".
| >> myfile.txt 2>&1 | Error output as Normal output to myfile.txt (append).
| &>> myfile.txt | Same as ">> myfile.txt 2>&1".

```bash
find /etc -name passwd > /tmp/output 2> /dev/null
# Normal output of "find /etc -name passwd" to /tmp/output file (overwrite).
# Error output of "find /etc -name passwd" to /dev/null (overwrite).
```

### Pipelines

The output of previous command will be the input of the next command.

```bash
# command1 | command2 | command3 : The output of command1 is input for command 2, the output of "command1 | command2" is input for command3.
ls -l / | grep root # Normal output of "ls -l /" will be the input of "grep root" command.
cd /tmp
echo one > filelist.txt
echo two >> filelist.txt
echo three >> filelist.txt
cat filelist.txt | xargs mkdir
cat filelist.txt | xargs -i rm -rf # Print each command to console.
cat filelist.txt | xargs -t -I % sh -c 'echo %; mkdir %' # Replace % by input from xargs
cat filelist.txt | xargs -t -I {} sh -c 'echo {}; mkdir {}' # Replace {} by input from xargs
```
