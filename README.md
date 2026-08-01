# my-windows-fastfetch-setup

My personal Windows terminal setup using [Fastfetch](https://github.com/fastfetch-cli/fastfetch).

Works on both **PowerShell** and **CMD**.

---

## Files

| File | Description |
|------|-------------|
| `config.jsonc` | Fastfetch configuration |
| `bb.txt` | ASCII art logo |
| `profile.ps1` | PowerShell profile (runs fastfetch on startup) |
| `cmd_profile.bat` | CMD profile (runs fastfetch on startup) |
| `JetBrainsMonoNerdFont-Regular.ttf` | JetBrains Mono Nerd Font |
| `runMe.bat` | Install script |
| `reset.bat` | Reset script / Revert back changes |

---

## Install

1. Clone the repo [or] download this repo zip and extract
```
https://github.com/Laddu-xd/my-windows-fastfetch-setup
```

2. Open the folder and double-click `runMe.bat`

That's it! Restart your terminal and it should work.

---

## What runMe.bat does

- Installs Fastfetch via winget (skips if already installed)
- Installs JetBrains Mono Nerd Font (skips if already installed)
- Copies `config.jsonc` and `bb.txt` to `%USERPROFILE%\.config\fastfetch\`
- Copies `profile.ps1` to `%USERPROFILE%\Documents\WindowsPowerShell\`
- Copies `cmd_profile.bat` to `%USERPROFILE%\.config\`
- Adds a registry entry so CMD runs `cmd_profile.bat` on startup

> **Note:** `runMe.bat` will run as Administrator, otherwise it will fail.

---

## Reset

Run `reset.bat` o revert everything. [it will prompt you to run as Administrator, ]

It will:
- Delete the fastfetch config and ASCII file
- Delete the PowerShell profile
- Delete the CMD profile
- Remove the registry entry for CMD startup
- Remove the JetBrains Mono Nerd Font

---

## Requirements

- Windows 10 or later
- winget (comes pre-installed on Windows 10/11)
- Administrator privileges to run `runMe.bat` and `reset.bat`

---

### If this helped you automate all your manual terminal setup, consider giving this repository a star — it helps me and others find it more easily!
