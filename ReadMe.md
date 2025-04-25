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
