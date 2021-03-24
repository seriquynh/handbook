A User in Linux system has a unique ID.

- A User ID is a unique positive integer assigned by a Unix-like OS to a specific user. User name is only used for humans.
- In the Linux kernel 2.4 and older, UIDs are unsigned 32-bit integers that can be from 0 to 4,294,967,296.
- User root has UID is 0 (zero).
- UID and sone other information of a user is stored in `/etc/passwd` file.
- Normal users: Some Linux distributions use UIDs for non-privileged users starts at 100. Others, such as Red Hat, starts at 500, and still others, such Debian/CentOS, starts at 1000.

- UID and GID details can be found at `/etc/login.defs`. Here are id range of user, system user, group and system group.

```bash
UID_MIN 1000
UID_MAX 60000

SYS_UID_MIN 100
SYS_UID_MAX 999

GID_MIN 1000
GID_MAX 60000

SYS_GID_MIN 100
SYS_GID_MAX 999
```

- The default information of a local user when it's created stored in `/etc/default/useradd`:

```bash
useradd -D
cat /etc/default/useradd
```

- To know the supported shells in the system:

```bash
cat /etc/shells
```

- `/etc/skel` contains files and directories that is copied to user home directory when it's created.cat

| File | Description |
|------|-------------|
| /etc/profile | Startup file for all users, exec with login shell (run automatically when login).
| ~/.bash_profile | Startup file for specific user, exec with login shell.
| ~/.bash_login |
| ~/.profile |
| ~/.bash_logout | Run when user logout shell session.
| /etc/bash.bashrc |
| ~/.bashrc |

/etc/profile is always loaded.

When a user login:

- ~/.bash_profile is loaded if it exists.
- ~/.bash_login is loaded if it exists and ~/.bash_profile doesn't exist.
- ~/.profile is loaded if it exists and ~/.bash_login doesn't exist.
- [Login Shell Session]
- ~/.bash_logout is loaded if it exists.

## User Management

**/etc/passwd**

```bash
seriquynh:x:1001:1001:Quynh Nguyen,,,:/home/seriquynh:/bin/bash
# User info components are separated by : character.
# 1. Username: seriquynh
# 2. Password: x character indicates that an encrypted password of user is stored in /etc/shadow
# 3. UID: 1001 is the user id.
# 4. GID: 1001 is the primary group id.
# 5. Description (GECOS field): Free text that describes something about user.
# 6. Home directory: /home/seriquynh
# 7. Command/shell: The absolute path of command or shell.
```

**/etc/shadow**

```bash
seriquynh:$6$sKeX.ZMv$JeklLgcC3TLYiyQhNU9rTShhYsHOTdl5QUxAN0JHPmjBXHTvy53liE2ucZjtMiPKr9MudAEQ4xhS0LnnM1p0Y0:18691:0:99999:7:::
# Password info components are separated by : character.
# 1. Username: seriquynh
# 2. Encrypted Password.
# 3. Last password change: Days since Jan 1st, 1970 when the password is last changed.
# 4. Minimum: 0 days required between two password change moments. If it's 3, the next password change must be 3 days after the last password change.
# 5. Maximum: 99999 days after last chage day that password is valid. After that, user has to change his/her password.
# 6. Warning: 7 days before password expires, system will warn user to change his/her password.
# 7. Inactive: After n password expires days, user will be disabled.
# 8. Disabled: until days since Jan 1st, 1970, user is disabled.
```
Encrypted password has format $id$salt$hashed
$id$ = $1$ means MD5
$id$ = $2a$ means Blowfish
$id$ = $2y$ means Blowfish
$id$ = $5$ means SHA-256
$id$ = $6$ means SHA-512

### adduser process
1. A new line is added to /etc/passwd.
2. A new line is added to /etc/shadow.
3. A new line is added to /etc/group.
4. A new line is added to /etc/gshadow
5. A new user home directory is created inside /home directory, items are copied from /etc/skel

### useradd - User Add

```bash
$ useradd [--option] <username>
```

| Option | Description |
|--------|-------------|
| -u, --uid **UID** | The user id (positive integer >= UID_MIN)
| -g, --gid **GROUP** | The primary group name or id.
| -c, --comment **COMMENT** | The data for description field in /etc/password file.
| -d, --home-dir **HOME_DIR** | The path to home directory (regularly under /home).
| -s, --shell **SHELL** |
| -G, --groups **G1,G2** | The group list that user belongs to.
| -m, --create-home | Create user home directory.
| -M, --no-create-home | Create user without home directory.
| -k, --skel **SKEL_DIR** | User home directory will be copied from **SKEL_DIR** instead of /etc/skel directory.

### usermod - User Modify

```bash
$ usermod [option] username
```

| Option | Description |
|--------|-------------|
| -u, --uid **UID** |
| -g, --gid **GROUP** |
| -c, --comment **COMMENT** |
| -d, --home-dir **HOME_DIR** |
| -s, --shell **SHELL** |
| -G, --groups **G1,G2** |
| -k, --skel **SKEL_DIR** |
| -L, --lock | Lock user password, can not use with -p or -U option
| -p, --password **PASSWORD** |
| -e, --expiredate **EXPIREDATE** | Set the date or number of days since Jan 1st 1970 when the user is disabled.
| -f, --inactive **INACTIVE** | Set the number of days of inactivity after a password has expired before the account is locked.
| -m, --move-home |
| -U, --unlock |

### userdel - User Delete

```bash
$ userdel [option] username
# -r, --remove : Home and email spool directory will be deleted. Other files has to be searched and deleted manually.
# -f, --force : Force to delete a user even it's in a login shell session.
```

### chage - Change Age

```bash
$ chage [option] username
```

### su - Substitude user

```bash
# su [option] [username]
# -, -l, --login :
# -c, --command : The command to run
# -s, --shell :  The specific shell instead of default shell (defined in /etc/passwd).
```

### id

Find user and group names and ids.

```bash
$ id seriquynh
uid=1001(seriquynh) gid=1001(seriquynh) groups=1001(seriquynh)
$ id someoneelse
id: someoneelse: no such user
```

### lid

```bash
$ lid seriquynh # List groups which seriquynh belongs to.

$ lid -g stuff
 jessica(uid=1003)
 steven(uid=1004)
 putin(uid=1005)
```

### lslogins

Display information about known users in the system.

## Group Management

Group information is kept in `/etc/group` file:

```bash
stuff:x:1006:jessica,steven,putin
# 1. Group name : stuff
# 2. Password : x means /etc/gshadow exists
# 3. Group ID: 1006
# 4. Member list.

groupadd linux # Add a new group
groupdel linux # Delete a new group
```

```text
username/group servername = (usernames to run as) command

%wheel ALL = (ALL) ALL # Allow users in whell group to run all commands on all servers.
seriquynh ALL = (ALL) ALL # On all servers, allow user seriquynh to run all commands as any other.
seriquynh ALL = (ALL) NOPASSWD: ALL
```

- sudo command allows permitted users to execute a command as the superuser (root) or any other.

```bash
sudo -u jessica -g stuff mkdir /tmp/newdir
```

Command Alias, User Alias and Host alias
