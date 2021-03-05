
A package manager is a tool to manage (install/upgrade/remove) packages (software) in a system.

## RPM - RedHat Package Manager

| Operating System | Format | Tools |
|------------------|--------|-------|
| Debian | .deb | apt, apt-cache, apt-get, dpkg
| Ubuntu | .deb | apt, apt-cache, apt-get, dpkg
| CentOS | .rpm | yum
| Fedora | .rpm | dnf
| FreeBSD | Ports, .txz | make, dpkg

An RPM file is an install package originally developed for RedHat Linux OS, but now used by many other Linux distributions as well. RPM files are commonly used to install programs on Linux System.

An RPM file has the following format:

[package_name]-[version]-[release].[architecture].rpm

Eg: VirtualBox-6.1-6.1.18_142142_el8-1.x86_64.rpm <br>
    package_name: VirtualBox <br>
    version: 6.1 <br>
    release: 6.1.18_142142_el8-1 <br>
    architecture: x86_64 <br>

| Option | Description |
|--------|-------------|
| -i, --install | Install a new package
| -U, --upgrade | Upgrade a currently installed package to a newer version. Same as install but automatically remove other versions after upgrading.
| -h, --hash | Print 50 hash masks as the package archive is unpackaged.
| --reinstall | Reinstall a currently installed package.
| -e, --erase | Erase/remove/unstall an installed package.
| -q, --query |
| -a |
| -l | List files of package.

## YUM - Yellowdog Updater Modified (Package Manager for CentOS)

- It is an interactive, rpm-based package manager. It can automatically perform system updates, including dependency analysis and obsolete.

- Package information is stored in /etc/yum.repos.d/ directory.

```bash
$ cat /etc/yum.repos.d/CentOS-Debuginfo.repo
[base-debuginfo]
name=CentOS-7 - Debuginfo
baseurl=https://debuginfo.centos.org/7/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-Debug-7
enabled=0
# Property meanings:
# base-debuginfo : A unique repository ID (spaces are not permitted).
# name : A human-readable string describing the repository
# baseurl : a URL to the directory where the repodata directory of a repository is located, can be an HTTP or FTP url.
# gpgcheck : GNU Privacy Guard. It basically checks the licence of your RPMs which you want to install..
# gpgkey : Path to publick gpgkey that is used for gpgcheck.
# enabled=1 : Include this repository as a package source (updates and installs)
# enabled=0 : Do not include this repository as a package source.
```

- yum command:

```bash
yum repolist
yum history list
yum install httpd -y # Install httpd (ppache2) package.
yum groupinstall "Development Tools" # Install a ton of packages belongs to "Development Tools" group.
# yum --diablerepo=repo_name_1 --enablerepo=repo_name_2 install package1 package2 -y
# yum upgrade/downgrade/erase/remove package_name
yum search httpd # Search for packages that contains "httpd" in name.
yum deplist httpd # Show dependencies of "httpd" package.
yum clean all # Clean out packages and meta data from cache.
yum whatprovides # Find rpm package which provides particular binary or library file.
```

## DNF - Dandified YUM (Package Manager for Fedora)

## APT - Advanced Package Tool (Package Manager for Debian and Ubuntu)
