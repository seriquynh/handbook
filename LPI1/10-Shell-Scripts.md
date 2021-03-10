## Basic knownledge

- A Shell provides an interface to the Unix system. It gathers input from us and executes programs based on that input. When a program finishes executing, it displays that program's output.

- A Shell is an environment in which we can run our commands, programs, and shell scripts.

- There are different flavors of a shell, just as there are different flavors of operating systems. Each flavor of shell has its own set of recognized commands and functions.

Bourne shell − If you are using a Bourne-type shell, the $ character is the default prompt.
o Bourne shell (sh)
o Bourne Again shell (bash)

C shell − If you are using a C-type shell, the % character is the default prompt.

```bash
$ MYNAME="Quynh"
$ echo $MYNAME
$ readonly MYNAME
$ MYNAME="QuynhNX" # Can not re-assign value for a readonly variable.

$ TIMEDATE_1=$(date +%Y---%m---%d)
$ TIMEDATE_2=`date +%Y---%m---%d`

$ echo "Hello Quynh"
$ printf "Hello %s" "QuynhNX"
```

## Special variables of an executing script.

```bash
#!/usr/bin/env bash

echo 'The script name is' $0

echo 'The process ID (PID) is' $$

echo 'The arguments count is' $#

echo 'The last command exit status is' $?

echo 'The last command process ID is' $!

echo 'All arguments are double quoted' $*

echo 'All arguments are individually double quoted' $@
```

## Read variable from standard input.

```bash
#!/usr/bin/env bash

echo "What is your name?"
read NAME
echo "My name is $NAME"

read -p "How old are you? " AGE
echo "I am $AGE years old."

# -a
# -e
# -t : timeout
```
