return {
	{
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({
				window = {
					backdrop = 1,
					options = {
						signcolumn = "yes",
						number = true,
						relativenumber = true,
						list = true,
					},
				},
			})
			vim.keymap.set("n", "<leader>z", function()
				require("zen-mode").toggle()
			end, { desc = "[z] Toggle Zen mode" })
		end,
		event = { "BufReadPost", "BufNewFile" },
	},
}
