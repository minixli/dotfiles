# Dotfiles

Basic configuration for a JavaScript full-stack developer using Vim, tailored for macOS with Zsh, Git, and npm.

## Overview

This repository provides my `dotfiles` for a streamlined development environment, optimized for JavaScript development with Vim as the primary editor. It configures Zsh for shell productivity, Vim for editing, Git for version control, and npm for package management.

## Directory Structure

```bash
dotfiles/
├── .bash_profile   # Bash login shell configuration
├── .bashenv        # Bash environment variables
├── .gitconfig      # Git user settings and credential helper
├── .mongorc.js     # MongoDB shell configuration
├── .npmrc          # npm configuration for GitHub Packages
├── .vimrc          # Vim settings for JavaScript development
├── .zprofile       # Zsh login shell configuration
├── .zsh_dev_env/   # Modular Zsh environment settings
│   ├── aliases     # Zsh aliases for development tasks
│   ├── base        # Base Zsh environment setup
│   └── main        # Entry point for Zsh environment
├── .zshenv         # Zsh environment variables
└── .zshrc          # Zsh interactive shell configuration
```

## Files and Functionality

- **`.bash_profile`**: Configures the Bash login shell, minimal setup for compatibility.
- **`.bashenv`**: Defines Bash environment variables, used in non-Zsh environments.
- **`.gitconfig`**:
  - Sets `vim` as the default Git editor.
  - Uses `osxkeychain` for secure credential storage on macOS.
- **`.mongorc.js`**: Configures the MongoDB shell for database interactions.
- **`.npmrc`**: Enables npm to use GitHub Packages with `PACKAGES_AUTH_TOKEN`.
- **`.vimrc`**:
  - Optimizes Vim for JavaScript development with plugins (e.g., Airline, ALE disabled).
  - Stores backup, swap, and undo files in `~/.vim/tmp/` for a clean workspace.
- **`.zprofile`**:
  - Sets `PATH`, `CDPATH`, `PROJ_CFG_PATH` (`~/Projects/config`), and `CODE_CFG_PATH` (`~/code/config`).
  - Configures Zsh function paths (`fpath`) for project scripts.
- **`.zsh_dev_env/main`**:
  - Entry point for Zsh environment, sources `base` and `aliases`.
  - Defines `PACKAGES_AUTH_TOKEN` for GitHub authentication (modify with your token).
- **`.zsh_dev_env/base`**:
  - Configures `pyenv`, `rbenv`, `nvm`, and Java for development.
  - Sets `vim` as the default editor and enables Vi mode.
- **`.zsh_dev_env/aliases`**:
  - Defines aliases for file operations (`cp -i`, `mv -i`, `rm -i`), Vim editing (`v`, `vimcfg`, `zshrcfg`), and development tasks (`cppcompile`, `jsctags`).
  - Includes `cv` (interactive) and `ccv` (forceful) to clean backup files (`*~`, `.*~`) in the current directory.
- **`.zshenv`**: Sets Zsh environment variables for all shells.
- **`.zshrc`**: Configures the Zsh interactive shell, sourcing `.zsh_dev_env/main`.

## Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/minixli/dotfiles.git ~/dotfiles
   ```

2. **Create symbolic links**:
   ```bash
   ln -s ~/dotfiles/.bash_profile ~/.bash_profile
   ln -s ~/dotfiles/.bashenv ~/.bashenv
   ln -s ~/dotfiles/.gitconfig ~/.gitconfig
   ln -s ~/dotfiles/.mongorc.js ~/.mongorc.js
   ln -s ~/dotfiles/.npmrc ~/.npmrc
   ln -s ~/dotfiles/.vimrc ~/.vimrc
   ln -s ~/dotfiles/.zprofile ~/.zprofile
   ln -s ~/dotfiles/.zsh_dev_env ~/.zsh_dev_env
   ln -s ~/dotfiles/.zshenv ~/.zshenv
   ln -s ~/dotfiles/.zshrc ~/.zshrc
   ```

3. **Set up directories**:
   ```bash
   mkdir -p ~/Projects/config ~/code/config ~/.vim/tmp
   chmod u+rwx ~/Projects/config ~/code/config ~/.vim/tmp
   ```

4. **Configure GitHub token**:
   - Edit `~/dotfiles/.zsh_dev_env/main` to set `PACKAGES_AUTH_TOKEN`:
     ```bash
     export PACKAGES_AUTH_TOKEN=ghp_your_token
     ```
     Generate a Personal Access Token at [GitHub Settings](https://github.com/settings/tokens) with scopes like `read:packages`.

5. **Install dependencies**:
   - Install `pyenv`, `rbenv`, `nvm`, Java, npm, and MongoDB as needed.
   - Install Vim plugins referenced in `.vimrc` (e.g., Airline).

## Notes

- **Token management**: Set `PACKAGES_AUTH_TOKEN` in `.zsh_dev_env/main`. Avoid hardcoding sensitive data.
- **Backup cleanup**: Use `cv` (interactive) or `ccv` (forceful) to remove `*~` and `.*~` files in the current directory.
- **macOS-specific**: `.gitconfig` uses `osxkeychain` for credential storage, suitable for macOS only.
- **Vim**: Ensure `~/.vim/tmp` exists to store backup, swap, and undo files.