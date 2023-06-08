return {
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
	},
	{
		"tpope/vim-rhubarb",
		event = "VeryLazy",
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
		event = { "BufReadPost", "BufNewFile" },
		keys = {
			{
				"<leader>tb",
				":lua require('gitsigns').toggle_current_line_blame()<CR>",
				desc = "[T]oggle [B]lame",
			},
		},
	},
}
