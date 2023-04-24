return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				background = {
					dark = "mocha",
				},
				no_italic = true,
				integrations = {
					cmp = true,
					gitsigns = true,
					harpoon = true,
					mason = true,
					native_lsp = {
						enabled = true,
					},
					telescope = true,
					treesitter = true,
					treesitter_context = true,
					lsp_trouble = true,
					which_key = true,
				},
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
