# FireIsGood's Dotfiles

A mirror of my dotfiles, used through [GNU Stow](https://www.gnu.org/software/stow/).

## Configurations of interest

The files that you're probably interested are:

- [Neovim config](/.config/nvim/)
- [bash aliases](.bash_aliases)
- [Starship prompt](/.config/starship.toml)  
  ![starship prompt](/stow/starship_prompt.png)

- [Oh My Posh prompt](/.config/oh-my-posh/zen.toml)  
  ![Oh My Posh prompt](/stow/oh-my-posh_prompt.png)

## What are "dotfiles?"

Some bullet points from pseudometa's [.config repository](https://github.com/chrisgrieser/.config):

- Read this [primer what dotfiles are](https://www.freecodecamp.org/news/dotfiles-what-is-a-dot-file-and-how-to-create-it-in-mac-and-linux/).
- Here is an interesting [report on common contents of dotfiles](https://github.com/Kharacternyk/dotcommon).

## Requirements

Ensure you have Git and Stow installed on your system. You can use the following commands to check if they are
installed:

```bash
git -v
stow -V
```

Otherwise, install them with your favorite package manager.

You will also need either [Starship](https://starship.rs) or [Oh My Posh](https://ohmyposh.dev) depending on the current
prompt used.

You can check if they are installed with the corresponding commands:

```bash
oh-my-posh --version
starship -V
```

If they are not installed, you will get an error message about the corresponding prompt.

## Installation

Clone the repository into a local folder in $HOME:

```bash
git clone https://github.com/FireIsGood/dotfiles.git ~/dotfiles
```

Run `stow` in the new folder to add symlinks:

```bash
cd ~/dotfiles
stow .
```

If you encounter any file conflicts, you must delete either the conflicting file or delete the new dotfiles folder file
