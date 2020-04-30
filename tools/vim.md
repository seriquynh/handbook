VIM has two mode, they are **NORMAL** and **INSERT**.

- While the mode is **NORMAL**, press "i" or "a" to switch to **INSERT**.
- While the mode is **INSERT**, press "esc" to switch to **NORMAL**.

## NORMAL

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

- 3igo ESC : Insert 3 "go" without repeating typeing.

```
:w - Save the current editing file.
:q - Quit
:wq - Save and Quit
:q! - Quit without saving

