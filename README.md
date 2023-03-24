My personal Neovim configuration.

The idea is to keep it relatively minimal for a fast startup time and snappy editing experience. Configuration is kept in a single file for simplicity.

A lot of the configuration is similar to that found in [ThePrimeagen's init.lua](https://github.com/ThePrimeagen/init.lua), and [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim). Both of these are excellent resources for someone looking to take inspiration for their own configurations.

To install Neovim, I build from source. I have found that it is the most reliable way to get an up-to-date version of Neovim across MacOS, Linux, and WSL.

My usual workflow is to search for a file that I want to edit using Telescope, either by searching for a file by name `<leader>sf`, or by text within a file `<leader>sg`. To switch between a few files that I am interested in for the thing that I am currently working on, I'll either navigate back and forward with `<C-o>` and `<C-i>`, or select a recent file from a list with `<leader>?`. I'm currently experimenting with using [harpoon](https://github.com/ThePrimeagen/harpoon) to improve this part of my workflow.

### Key plugins

- [lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager with lazy loading
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - File finder
- [mason.nvim](https://github.com/williamboman/mason.nvim) - LSP package manager
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Autocompletion
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting
- [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) - Used mainly for formatting but can do more

### Terminal

Alacritty is my terminal emulator of choice. It keeps things fast and simple, which makes for a better experience. In combination with tmux, this makes for a nice way to have multiple terminals that I can easily switch between.

To keep navigation consistent between tmux and Neovim, I use [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator). This means that I can not have to try to remember which context I am in, and can rely on muscle memory to get me to where I want to be.

### TODO

- [ ] Improve startup time
- [ ] Find a consistent way to format on save
