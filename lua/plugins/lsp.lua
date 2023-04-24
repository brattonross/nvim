return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"williamboman/mason.nvim",
				build = ":MasonUpdate",
				config = true,
			},
			"williamboman/mason-lspconfig.nvim",
			{
				"j-hui/fidget.nvim",
				opts = {},
			},
			{
				"folke/neodev.nvim",
				config = true,
			},
		},
		event = { "BufReadPost", "BufNewFile" },
	},
}
