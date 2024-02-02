# FireIsGood's Dotfiles

A mirror of my dotfiles, used through
[GNU Stow](https://www.gnu.org/software/stow/).

## Configurations of interest

The files that you're probably interested are:

- [Neovim config](/.config/nvim/)
- [bash aliases](.bash_aliases)
- [Starship prompt](/.config/starship.toml)

## What are "dotfiles?"

Some bullet points from pseudometa's [.config repository](https://github.com/chrisgrieser/.config):

- Read this [primer what dotfiles are](https://www.freecodecamp.org/news/dotfiles-what-is-a-dot-file-and-how-to-create-it-in-mac-and-linux/).
- Here is an interesting [report on common contents of dotfiles](https://github.com/Kharacternyk/dotcommon).

## Requirements

Ensure you have Git and Stow installed on your system. You can use the following
commands to check if they are installed:

```bash
git -v
stow -V
```

Otherwise, install them with your favorite package manager.

## Installation

Clone the repository into a local folder in $HOME:

```bash
git clone git@github.com:FireIsGood/dotfiles.git ~/dotfiles
```

Run `stow` to add symlinks:

```bash
cd ~/dotfiles
stow .
```
