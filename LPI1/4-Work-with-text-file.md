## Vim editor

Vim edtior has 3 modes:
- Command Mode: move cursor, copy, paste and delete text.
- Last Line Mode: search/replace, read/insert files; save; shell commands.
- Text Input Mode: insert your text.

```bash
vi [file] # Open a file in vim
# -R : Edit files ready-only
# -r : Recover and resume editing on file after an aborted editor session or system crash. Without file, list available files for recovery.
# -v : Run in full-screen mode.
# -w [rows] : Set the window size of lines. (that are displayed at time).
# +[num] : Start editing at line number. Without num, start at the last line.
# +/[pattern] : Start editing at the first line matching [pattern].
```

### Save and Exit

- Command Mode: ZZ (doulbe upper case Z): Save and quit
- Last Line Mode:
  - :x - Quit vi and write modifications to file.
  - :wq - Same with :x
  - :q - Quit vi.
  - :q! - Quit vi and ignore all modifications.


### Switch to Text Input Mode

| Option | Description |
|--------|-------------|
| i | Insert at the current cursor position. A line "Linux is awesome", if cursor at position of x character, insert new characters after u.
| I | Insert at the begin for line. Verfy helpful to comment/uncomment a line.
| o | Insert a new line below the current line.
| O | Insert a new line above the current line.
| a | Insert right after the current cursor position.
| A | Insert at the end of line.
| C | Clear text form current cursor position to the end of line, and you can start typing.

### Command Mode

| Key | Description |
|-----|-------------|
| x | Same as "Delete" button.
| nx | Delete n characters by "Delete" button.
| X | Same as "Backspace" button.
| dw | Delete words after the cursor.
| xdw | Delete n words after the cursor.
| dd | Double "d" - Delete the current line.
| ndd | Delete n lines including the current line and (n-1) lines after it.
| D | Delete from the cursor to the end of line. Similar to C but don't switch to Text Input Mode.
| r | Replace the character at the cursor.
| cw | Delete the word right after the cursor and start typing
| ncw |
| J |
| nJ |
| u | Undo last change.
| U | Restore current line.

- /[pattern] : Search forward for a pattern.
- ?[pattern] : Search backword for a pattern.
- :[%s/[pattern]/[replace]/[gc] : Replace a pattern.
  - :s/foo/bar/g => Find each occurrence of 'foo' (in the current line only), and replace it with 'bar'.
  - :%s/foo/bar/g => Find each occurrence of 'foo' (in all lines), and replace it with 'bar'.
  - :%s/foo/bar/gc => Same with the line above but with confirmation.

- h j k l : left down up right
- w : Move to the beginning of next word.
- 5w : Move to the beginning for the next fifth word counted from the current word (0).
- b : Move back to the beginning of previous word.
- 5b : Move back to the beginning of the previous fith word counted from the current word (0).
- e : Move to the end character of the next word.
- f s : Find s character.

- % : Move between open and close brackets (), [], {}.
- 0 : Move to the beginning of line.
- $ : Move to the end of line.

- "*" : Find next word under cursor.
- "#" : Find previous word under cursor.

- gg : goto the beginning of file.
- G : goto the end of file.
- 3, then G: goto the line 3. (Same as :3)

- 3igo ESC : Insert 3 "go" without repeating typeing.

- Ctrl + f : Page down
- Ctrl + b : Page Up

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