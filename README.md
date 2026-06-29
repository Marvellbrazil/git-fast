# git-fast
### Just abbreviation of git commands, time saved, nothing more.


---

## How to apply it on my PC?

```bash
# Clone the repository
git clone https://github.com/Marvellbrazil/git-fast
```

### PowerShell (Windows)

```powershell
cd git-fast/powershell

# Run the installer (it will add the aliases to your PowerShell profile automatically)
.\install.ps1
```

> The script appends the aliases to your `$PROFILE` file and closes the terminal after 5 seconds.  
> If a previous installation is detected, it updates the block in-place instead of duplicating it.

---

### Bash / Zsh (Linux & macOS)

```bash
cd git-fast/unix

# Make the script executable, then run it
chmod +x install.sh
./install.sh
```

> On **macOS** the aliases are written to `~/.zshrc`.  
> On **Linux** the aliases are written to `~/.bashrc`.  
> Reload your shell after installation:
> ```bash
> source ~/.bashrc   # Linux
> source ~/.zshrc    # macOS
> ```

---

## Aliases

| Alias | Command |
|---|---|
| `gs` | `git status` |
| `ga [args]` | `git add [args]` |
| `gcom [args]` | `git commit -m [args]` |
| `gd` | `git diff` |
| `glog` | `git log -1 --stat` |
| `gpus [args]` | `git push [args]` |
| `gpul [args]` | `git pull [args]` |
| `gr [args]` | `git remote [args]` |
| `gcon [args]` | `git config [args]` |
| `gclo [args]` | `git clone [args]` |
| `gf [args]` | `git fetch [args]` |
| `gnt` | `git init` |