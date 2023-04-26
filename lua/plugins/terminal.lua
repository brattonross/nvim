return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup()

			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
				vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
				vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
				vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
			end

			-- Use the above keymappings when in terminal mode.
			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

			vim.keymap.set("n", "<leader>tt", vim.cmd.ToggleTerm, { desc = "[T]oggle [T]erminal" })

			vim.keymap.set("n", "<leader>tg", function()
				local Terminal = require("toggleterm.terminal").Terminal
				local lazygit = Terminal:new({
					cmd = "lazygit",
					hidden = true,
					direction = "float",
				})
				return lazygit:toggle()
			end, { desc = "Toggle [T]erminal with [G]it status" })

			vim.keymap.set("n", "<leader>th", function()
				local Terminal = require("toggleterm.terminal").Terminal
				local lazygit = Terminal:new({
					direction = "horizontal",
				})
				return lazygit:toggle()
			end, { desc = "Toggle [T]erminal with [H]orizontal direction" })

			vim.keymap.set("n", "<leader>tv", function()
				local Terminal = require("toggleterm.terminal").Terminal
				local lazygit = Terminal:new({
					direction = "vertical",
				})
				return lazygit:toggle()
			end, { desc = "Toggle [T]erminal with [V]ertical direction" })
		end,
		event = "VeryLazy",
	},
}
