## Just a random guy config

Hi there. My name Vova, Your are in my `.config` folder. I keep here nerd things configuration for wezterm, nvim, bla bla bla.

## Installation

Your cannot just close the repo into your `.config` directory, because it contains a lot of files that are not needed for the project. 
So here an alternative way to install getting all configs. 

Navigate to your `.config` directory and run the following command:

```bash
git init
git remote add origin git@github.com:VovaStelmashchuk/.config.git
git fetch
git checkout -b main origin/main
```

## Symlink Cursor Settings

To use the version-controlled settings and keybindings with Cursor, run the following commands in your terminal:

```sh
# Create the target directory if it doesn't exist
mkdir -p ~/.cursor

# Symlink settings.json
ln -sf ~/.config/cursor/settings.json ~/.cursor/settings.json

# Symlink keybindings.json
ln -sf ~/.config/cursor/keybindings.json ~/.cursor/keybindings.json
```

This will ensure that Cursor uses the settings and keybindings you keep in your `.config` repo.

## Vova's NeoVim configuration
Minimal and developer-centric Neovim config for crud development (JS + Vue).

The config created for my personal use. I develop the applicaion using Nuxt.

### Feature

- Native LSP & auto-completion 
- Supper fast search & file navigation 
- Git (Gitsigns)
- Keymaps for dvorak layout
- The configuration provides AI capabilities with avante and copilot

### VueJs support
The config make posible to do jumd to definition inside vue file.
You can use `gd` to jump to function or variable from template block to script block

## Syncing Cursor IDEA Settings Across Computers

To keep your Cursor IDEA settings (including keybindings and preferences) synced across multiple computers, store them in your `.config/cursor` directory and use symlinks to point Cursor to these files.

### Steps to Sync Settings

1. **Store your settings in version control:**
   - Make sure your `settings.json` and `keybindings.json` are in `.config/cursor` and committed to your dotfiles repo.

2. **On a new computer:**
   - Clone your `.config` repo to `~/.config`.
   - Create the `~/.cursor` directory if it doesn't exist:
     ```sh
     mkdir -p ~/.cursor
     ```
   - Symlink the settings files:
     ```sh
     ln -sf ~/.config/cursor/settings.json ~/.cursor/settings.json
     ln -sf ~/.config/cursor/keybindings.json ~/.cursor/keybindings.json
     ```

3. **Restart Cursor IDEA** to apply the settings.

This setup ensures your Cursor settings are always in sync across all your machines.

## Syncing Cursor Extensions Across Computers

To keep your list of installed Cursor extensions in sync, you can export them to a file and install them on any other machine:

### Export your extensions

This has already been done for you:
```sh
cursor --list-extensions > ~/.config/cursor/extensions.txt
```

### Install the same extensions on another MacBook

1. Make sure you have your `.config` repo (with the `cursor/extensions.txt` file) cloned to your new machine.
2. Run the following command to install all extensions from the list:
   ```sh
   cat ~/.config/cursor/extensions.txt | xargs -L 1 cursor --install-extension
   ```

This will install all the extensions listed in `extensions.txt` for Cursor on your new computer.
