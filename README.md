# Zsh Configuration Setup

This repository contains the `zsh` configuration files stored inside `.config/zsh`.

## Setup Instructions

To make `zsh` read the configuration from this directory instead of your home directory, you need to create a `~/.zshenv` file in your home folder.

Run the following command in your terminal to create the file:

```bash
echo 'export ZDOTDIR="$HOME/.config/zsh"' > ~/.zshenv
```

This tells `zsh` to look for `.zshrc`, `.zprofile`, and other configuration files inside `~/.config/zsh/`.

## Dev VM Setup

To provision the development VM using the Colima `prismo-dev-vm` profile, run:

```bash
ansible-playbook -i "colima-prismo-dev-vm," --ssh-common-args="-F ~/.colima/ssh_config" ansible/dev-vm-setup.yml
```
