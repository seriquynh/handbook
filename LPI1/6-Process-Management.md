## Basic knownledge

- A process is a program in execution in memory (an instance of a program in memory).
- Each executed program creates a process.
- A program can be a command, a shell script, an executable binary or an other application.
- However, not all commands end up in creating process.

To get the maximum pid of the linux system, read `/proc/sys/kernel/pid_max` file:
```bash
cat /proc/sys/kernel/pid_max
```

- Each process has 2 ids: one is the Process ID (pid) and one is the Parent Process ID (ppid). System Init (systemV or systemd) always has pid = 1.

- Foreground Process: A process runs in foreground by default, receives input from keyboard and sends output the screen.
- Background Process: Many processes can run in parallelly without waiting previous process completes.

## State

| Name | Description |
|------|-------------|
| Running | The process is either running or is ready to run (are waiting to be assigned to CPU).
| Waiting | The process is waiting for an event or a resource. Interruptible process can be interuppted by signals while Uninterruptible are directly waiting on hardware conditions, can not be interrupted under any circumstances.
| Stopped | The process has ben stopped, usually by receiving a signal. A process is being debugged can has stopped state.
| Orphan | Processes are still running even though their parent process has terminated or finished. A process can be orphaned intentionally or unintentionally.
| Zombie | A dead process.

```bash
COMMAND & # End a command with & character to create a background process.
$ jobs # Show current running jobs in background.
$ fg job_id # Bring back a job from background to the foreground
```

When using the command shell, prefixing a command with nohup prevents the command from
being aborted automatically when you log out or exit the shell.

```bash
$ nohup a_long_command & # Do not stop process even pressing Ctrl + C
```

## Kill Process

Send a signal to a process to tell what it has to do.

| Name | Number | Description |
|------|--------|-------------|
| SIGHUP | 1 |
| SIGINT | 2 | Ctrl + C
| SIGQUIT | 3 | Ctrl + D
| SIGFPE | 8 |
| SIGKILL | 9 | A process must quit immediately and do not perform any futher operations.
| SIGALARM | 14 |
| SIGTERM | 15 | Quit and perform clean up operations, sent by kill command by default.

### kill

```bash
$ kill pid # ~ kill SIGTERM pid or kill -s 15 pid
$ kill SIGNKILL pid
$ kill -s 9 pid
```

### killall

```bash
killall -u seriquynh # kill all processes created by seriquynh user.
killall php-fpm # kill all processes of php-fpm service.
```

### pgrep

Print pids that matches search condition.

```bash
pgrep -u seriquynh # List all pids that are created by seriquynh user.
```

### screen

// TODO

### tmux - Terminal Multiplexer

- Ctrl + b % - Split into two panes in veritcally
- Ctrl + b " - Split into two panes in horizontally
- Ctrl + b o - Go to the next pane
- Ctrl + b c - Create a new window
- Ctrl + b n - Go to the next window
- Ctrl + b p - Go to the previous window
- Ctrl + b q - Show panes indexes, then press the number of index to switch the expected one
- Ctrl + b [ - Enable scroll mode, then press "q" to quit

### ps - Process Status (State)

### uptime - The how long the system has been running.

### free

### watch

watch runs command repeatedly, displaying its output and errors (the first screenfull). This allows you to
watch the program output change over time. By default, the program is run every 2 seconds. By default,
watch will run until interrupted.

```bash
watch date
```

## Priority of Linux processes

// TODO
