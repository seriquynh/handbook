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
