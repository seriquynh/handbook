## Git Hooks

- Git has a way to fire off custom scripts when certain important actions occur.
- There are two groups of these hooks: client-side and server-side:
  - Client-side hooks are triggered by operations such as committing and merging.
  - server-side hooks run on network operations such as receiving pushed commits
- The hooks are stored inside **.git/hooks** directory

- For example:<br>
**pre-commit** => **prepare-commit-msg** => **commit-msg** => **post-commit**<br>
**pre-commit**: Run test to verify changes.<br>
**prepare-commit-msg** (or **commit-msg**): Determine whether commit message is valid or not.
