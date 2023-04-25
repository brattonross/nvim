My personal Neovim configuration.

The idea is to keep it relatively minimal for a fast startup time and snappy editing experience. Until recently I kept the config in a single `init.lua` file. This was to help me get to grips with the Lazy package manager, and keep things simple. However, my config has now expanded to the point where splitting the configuration into separate files has become beneficial.

A lot of the configuration is similar to that found in [ThePrimeagen's init.lua](https://github.com/ThePrimeagen/init.lua), and [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim). Both of these are excellent resources for someone looking to take inspiration for their own configurations.

My usual workflow is to search for a file that I want to edit using Telescope, either by searching for a file by name `<leader>sf`, or by text within a file `<leader>sg`. To switch between a few files that I am interested in for the thing that I am currently working on, I'll either navigate back and forward with `<C-o>` and `<C-i>`, or select a recent file from a list with `<leader>?`.

If I am working on something in particular that requires frequently switching back and forth between 2 or more files (say, a file and its unit tests, or a component and its stories), I'll mark the files with Harpoon `<leader>a`, and then switch between them `<leader>1`, `<leader>2`, and so on.

### Key plugins

- [lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager with lazy loading
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - File finder
- [mason.nvim](https://github.com/williamboman/mason.nvim) - LSP package manager
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Autocompletion
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting
- [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) - Used mainly for formatting but can do more
