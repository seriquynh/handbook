# Work with text file

## Vim editor

Vim edtior has 3 modes:
- Command Mode: move cursor, copy, paste and delete text.
- Last Line Mode: search/replace, read/insert files; save; shell commands.
- Text Input Mode: insert your text.

```bash
# vi [file] Open a file in vim
# -R : Edit files ready-only
# -r : Recover and resume editing on file after an aborted editor session or system crash. Without file, list available files for recovery.
# -v : Run in full-screen mode.
# -w [rows] : Set the window size of lines. (that are displayed at time).
# +[num] : Start editing at line number. Without num, start at the last line.
# +/[pattern] : Start editing at the first line matching [pattern].
```

### Moving

- h j k l : left down up right
- w : Move to the begin of next word.
- 5w : Move to the begin for the next fifth word counted from the current word (0).
- b : Move back to the begin of previous word.
- 5b : Move back to the begin of the previous fith word counted from the current word (0).
- e : Move to the end character of the next word.
- % : Move between open and close brackets (), [], {}.
- 0 : Move to the begin of line.
- $ : Move to the end of line.
- H : Move the cursor to the upper-left corner of the screen.
- L : Move the cursor to the lower-left corner of the screen.
- M : Move the cursor to the first character of the middle line on the screen.
- gg : goto the begin of file.
- G : goto the end of file.
- Press 3, then G: goto the line 3. (Same as :3)
- Ctrl + f : Page down
- Ctrl + b : Page Up

### Searching

- /[pattern] : Search forward for a pattern.
- ?[pattern] : Search backword for a pattern.
- :[%s/[pattern]/[replace]/[gc] : Replace a pattern.
  - :s/foo/bar/g => Find each occurrence of 'foo' (in the current line only), and replace it with 'bar'.
  - :%s/foo/bar/g => Find each occurrence of 'foo' (in all lines), and replace it with 'bar'.
  - :%s/foo/bar/gc => Same with the line above but with confirmation.

- "*" : Find next word under cursor.
- "#" : Find previous word under cursor.

### Adding

| Command | Description |
|--------|-------------|
| a | Insert to the right of the cursor position.
| A | Insert at the end of the current line.
| i | Insert to the left of the cursor position.
| I | Insert at the begin of the current line line. Verfy helpful to comment/uncomment a line.
| o | Insert a new line below the current line.
| O | Insert a new line above the current line.

### Delete, Change or Copy

| Key | Switch to input mode |Description |
|-----|---------|------------|
| x | | Delete the character under the cursor. Same as "Delete" button.
| X | | Delete the character right before the cursor. Same as "Backspace" button.
| dw |  | Delete word after the cursor.
| db | | Delete word before the cursor.
| dd | | Double "d" - Delete the current line.
| D | | Delete from the cursor to the end of line.
| c$ | yes | Change characters from the cursor to the end of line. ($ is the end of line).
| c0 | yes | Change characters from the cursor to the begin of line. (0 is the begin of line).
| cl | yes | Change the current letter (at the cursor position).
| cc | yes | Erase the current line.
| C | yes | Change characters from the cursor to the end of line. (Same as c$).
| cw | yes | Delete the word right after the cursor and start typing.
| r | | Replace the character at the cursor.
| J |
| u | | Undo the last change.
| U | | Restore the changed line.
| yy | | Copy the current line.
| y) | | Copy the current sentense, to the right of the cursor, into the buffer.
| Y} | | Copy the current paragraph, to the right of the cursor, into the buffer.


### Pasting

After using cut/copy text command, Use p/P to paste it back into the file:

- p :
  - If the copied text consists lines of text, it will be put below the current line.
  - If the copied text consists of letters or words, it will be put to the right of the cursor position.

- P :
  - If the copied text consists lines of text, it will be put above the current line.
  - If the copied text conststs of letters or words, it will be put to the left of the cursor position.
### Others

- 3igo ESC : Insert 3 "go" without repeating typeing.

### Exiting

- ZZ (doulbe upper case Z): Save and quit
- :x - Quit vi and write modifications to file.
- :wq - Same with :x
- :q - Quit vi.
- :q! - Quit vi and ignore all modifications.

## grep - Global regular expression print

Process text line by line and print lines which matches a specific pattern.

```bash
# grep [option] [pattern] [FILE]
# [command] | grep [option] [pattern]
# egrep = grep -E
```

| Option | Description |
|--------|-------------|
| -i, --ignore-case | search with case sensitive, foobar = FOObar = FOOBAR.
| -c, --count | Print count of matching cases.
| -v, --invert-match | search for non-matching cases.
| -q, --quiet, --silent | Exit immediately with 0 if any match is found, even an error is dected.
| -n, --line-number | Print line number.
| -H, --with-filename |
| -R, -r, --recursive | Read directory recursively and search for pattern.
| -w, --word-regexp | Print lines which matches the hole word.
| -E, --extended-regexp |
| --color=[WHEN], --colour=[WHEN] | WHEN = 'never', 'always' or 'auto'

## awk - Alfred Aho, Peter Weinberger, and Brian Kernighan

```bash
# awk [-F fs] [-v var=value] ['prog'|-f profile] [file]
# -F fs : Set the input field separator to the regular expression fs.
# -v var=value : Assign value for variable "var" before executing awk.
# -f file : Specify a file, profile which contains awk program to be executed.
# 'prog' : An awk program.
```

- $0 : The whole line.
- $1 : The first field.
- $2 : The second field.
- $3 : The third field.

```bash
echo "Linux is awesome. I am studing Linux" | awk '{print $1 " " $3 " " $7}' # "Linux awesome. Linux"
awk -F : '{print $1}' /etc/passwd
echo | awk -v home=$HOME '{print "My home dir is " home}' # "My home dir is /root"
echo "Linux is awesome." | awk '{$2="is very"; $3="AWESOME."; print $0}' # "Linux is very awesome."

echo '{print "The home dir of " $1 " is " $6}' > /tmp/awk_demo.awk
awk -F: -f /tmp/awk_demo.awk /etc/passwd
```

Built-in variables:
- FIELDWIDTH : The field width.
- FS : The field separator.
- RS : The record separator.
- OFS : The output field separator.
- ORS : The output record separator.

```bash
awk 'BEGIN{FS=":"; OFS="-"} {print $1,$6,$7}' /etc/passwd # Use ":" as separator to process, use "-" to join fields.
awk 'BEGIN{FS=":"; OFS="-"; ORS=""} {print $1,$6,$7}' /etc/passwd # Use ":" as separator to process, use "-" to join fields, use empty string to join lines.
```

## Hard and Symbolic links

- Hard Link:
  - is a new file entry that refers to an existing file on the filesystem.
  - each file in a filesystem has at least on hard link by default.
  - to save space, instead of copying, lot of hard links refer to a file can be created.
  - all hard links pointing to the same file have the same permissions, link count, user/group ownerships, time stamps, and file content
  - hard links pointing to the same file content need to be on the same file system

- Soft Link (Symbolic Link):
  - is not a regular file, but a special type of file that points to an existing file or directory.
  - unlike hard links, soft links can point to a directory.
  - the target of a soft link points can be on a different file system.

```bash
ln myfile.txt myfile2.txt
ln -s myfile.txt myfile3.txt
```
