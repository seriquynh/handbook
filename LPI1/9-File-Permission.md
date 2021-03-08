## Basic Permissions

There are 3 actors that can perform something on a file or directory.

- User Owner: A single person who owns this file/directory (regularly is the person created it).
- Group Owner: A single group which users belong to can do something this file/directory.
- Other Users: Any others who are not User Owner or don't belongs to Group Owner.

In Linux system, there are only 2 people who can change permissions of file or directory. They are the User Owner and the root.

Shortcuts:

- r : read
- w : write
- x : execute
- u : User Owner
- g : Group Owner
- o : Others
- a : Everyone

+ : append more permission
- : remove permission
= : assign permission(s)

> User has execute permission on a directory means he/she can "cd" to it.

### chmod - Change Mode

```bash
chmod 764 /file_or_directory
chmod a=rwx /file_or_directory
chmod u+x,g-x,o=rw /file_or_directory
chmod ug+rw,o-rw /file_or_directory
chmod –R 660 /directory_only
```

### chown - Change Owner

```bash
chown newuser /somefile # Only change user owner of /somefile.
chown :newgroup /somefile # Only change group owner of /somefile.
chown newuser:newgroup /somefile # Change both user and group owner of /somefile.
chown newuser: /somefile # Change user owner to newuser and group owner will be changed to the login group of the current user.
```

### chgrp - Change Group

```bash
chgrp newgroup /somefile # Change group owner of /somefile.
chgrp -R newgroup /somedir # change group owner of /somedir and all recursive sub items.
```

## Special Permissions

### setuid Permission

- When running, a program normally inherit permissions of the current login user. But if setuid is enabled, it will inherit permissions of the user owner.
- If User Owner doesn't have execute permission when setuid, S will be present, otherwise, s will be present.

```bash
chmod u+x /myfile
chmod 4775 /myfile
```

```bash
$ cd /tmp
$ touch dosomething.sh
$ ll dosomething.sh
-rw-r--r-- 1 seriquynh seriquynh 0 Mar  8 20:15 dosomething.sh

$ chmod u+s dosomething.sh
$ ll dosomething.sh # User Owner doesn't has execute permission on dosomething.sh, so S is present.
-rwSr--r-- 1 seriquynh seriquynh 0 Mar  8 20:15 dosomething.sh

$ chmod u+x dosomething.sh
$ ll dosomething.sh # User Owner has execute permission on dosomething.sh, so s is present.
-rwsr--r-- 1 seriquynh seriquynh 0 Mar  8 20:15 dosomething.sh
```

### setgid Permission

- If setgid of a directory is enabled, all recursive sub-items create inside it will inherit it's affiliation rather than default group of current login user. This is commonly used on
group collaborative directories to automatically change a file from the default private group to
the shared group.

```bash
chmod g+x /mydir
chmod 2775 /mydir
```

### Sticky Bit

If you set sticky bit for a directory, only the owner and the root can delete files/directories within it.

```bash
chmod o+t /mydir
chmod 1775 /mydir
```

### umask

umask is used to set default file/directory permission.

```bash
$ umask
0022 # If the current user create dir/file, it will set as 0755
$ umask 0002 # Change umask to 0002
```
