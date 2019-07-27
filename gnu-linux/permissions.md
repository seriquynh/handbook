
chmod
chown
chgrp
adduser
usermod

    $ sudo adduser username
    $ sudo su username
    $ sudo group add admin
    $ sudo usermod --append --groups admin username # Append "username" user to "admin" group
    $ sudo usermod -aG admin username


## Directories

- The read bit (r) - Allow the user to list files within the directory
- The write bit (w) - Allow the user to create/update/delete or rename files within the directory
- The execute bit (x) - Allow the user to enter the directory, and access files or directories inside
- The sticky bit (T or t) - Only allow the owner and root rename or delete files and directories within that directory
