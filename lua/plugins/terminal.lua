return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup()

			vim.keymap.set("n", "<leader>tg", function()
				local Terminal = require("toggleterm.terminal").Terminal
				local lazygit = Terminal:new({
					cmd = "lazygit",
					hidden = true,
					direction = "float",
				})
				return lazygit:toggle()
			end, { desc = "Show [T]erminal with [G]it status" })
		end,
		event = "VeryLazy",
	},
}
