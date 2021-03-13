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

# -p : Prompt input with trailing newline
# -a : Assign words read into an array
# -e :
# -t : timeout
```

## Bash variable scope

```bash
cat bash_demo.sh
#!/bin/bash
echo "SOMEVAR=$SOMEVAR"
SOMEVAR=UNIX
echo "SOMEVAR=$SOMEVAR

./bash_demo.sh
SOMEVAR=Linux ./bash_demo.sh
export SOMEVAR=Linux; ./bash_demo.sh
./bash_demo.sh
```

### declare

// TODO

### test

Check file types and compare values.

```bash
test -f /etc/passwd && echo 'File exists'
test -f /foo/bar/baz || echo "File doesn't exist"
test 1 -gt 2 && echo 'true' || echo 'false'
test 3 -gt 2 && echo 'true' || echo 'false'
```

### expr

```bash
expr 1 + 1
```

## Control Strcuture

```bash
if [statement];
then
    command1
    command2
fi

if [statement];
then
    command1
    command2
else
    command3
    command4
fi

if [statement1];
then
    command1
elif [statement2];
    command2
else
    command3
fi

case $var in
    val1)
        statements
        ;;
    *)
        statements
        ;;
esac

while [condition];
do
    commands
done

for VAR in {1..5}
do
    echo "The current value is $VAR."
done

for VAR in {10..0..2}
do
    echo "The current value is $VAR."
done

OS_LIST="Unix Windows Linux"
for OS in $OS_LIST
do
    echo -e "$OS\n"
done

OS_LIST="Unix Windows Linux"
PS3="Choose your favourite OS:"
select OS in $OS_LIST
do
    echo "Your choice is $OS."
done

seq 1 2 10 # 1,3,5,7,9
seq -s "," 1 9 # 1,2,3,4,5,6,7,8,9
```

| Operator | Example | Description |
|----------|---------|-------------|
| -eq | [ $A -eq $B ] | Check whether $A equals to $B
| -ne | [ $A -nq $B ] | Check whether $A doesn't equal to $B
| -gt | [ $A -gt $B ] | greater than (>).
| -lt | [ $A -lt $B ] | less than (<).
| -ge | [ $A -ge $B ] | greater than or equal to (>=).
| -le | [ $A -le $B ] | less than or equal to (<=).
| ==  | [ $A == $B ] |
| !=  | [ $A != $B ] |
| -z  | [ -z $A ] | Check whether the $A is an empty string or not defined string.
| -n  | [ -n $A ] | Check whether the $A is not empty.

```bash
[ 2 -gt 1 ]; echo $? # 0
[ 2 -gt 3 ]; echo $? # 1
[ 3 -gt 2 ] && [ 3 -gt 1 ]; echo $?
[ 3 -gt 2 ] || [ 3 -gt 1 ]; echo $?
```

## Function

```bash
#!/usr/bin/env bash
hello () {
    echo "Have you seen? Hello $1 and $2."
}

hello you me
```
