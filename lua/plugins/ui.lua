local colors = {
	fg = "#a6adc8",
	bg = "#313244",
}

return {
	{
		"nvim-lualine/lualine.nvim",
		enabled = true,
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = false,
					theme = {
						normal = {
							a = { fg = colors.fg, bg = colors.bg },
							b = { fg = colors.fg, bg = colors.bg },
							c = { fg = colors.fg, bg = colors.bg },
						},
						insert = {
							a = { fg = colors.fg, bg = colors.bg },
							b = { fg = colors.fg, bg = colors.bg },
							c = { fg = colors.fg, bg = colors.bg },
						},
						visual = {
							a = { fg = colors.fg, bg = colors.bg },
							b = { fg = colors.fg, bg = colors.bg },
							c = { fg = colors.fg, bg = colors.bg },
						},
						replace = {
							a = { fg = colors.fg, bg = colors.bg },
							b = { fg = colors.fg, bg = colors.bg },
							c = { fg = colors.fg, bg = colors.bg },
						},
						command = {
							a = { fg = colors.fg, bg = colors.bg },
							b = { fg = colors.fg, bg = colors.bg },
							c = { fg = colors.fg, bg = colors.bg },
						},
						inactive = {
							a = { fg = colors.fg, bg = colors.bg },
							b = { fg = colors.fg, bg = colors.bg },
							c = { fg = colors.fg, bg = colors.bg },
						},
					},
					component_separators = "|",
					section_separators = "",
				},
				sections = {
					lualine_c = {
						{
							-- "filename",
							-- path = 1, -- 1: Relative path
						},
					},
				},
			})
		end,
		event = "VeryLazy",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = false,
		opts = {
			show_end_of_line = true,
			space_char_blankline = " ",
		},
		-- event = { "BufReadPost", "BufNewFile" },
		lazy = false,
	},
	{
		"folke/trouble.nvim",
		enabled = false,
		options = {
			icons = false,
		},
		cmd = { "TroubleToggle", "Trouble" },
		keys = {
			{ "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
			{ "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
			{ "<leader>xL", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
			{ "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
			{
				"[q",
				function()
					if require("trouble").is_open() then
						require("trouble").previous({ skip_groups = true, jump = true })
					else
						vim.cmd.cprev()
					end
				end,
				desc = "Previous trouble/quickfix item",
			},
			{
				"]q",
				function()
					if require("trouble").is_open() then
						require("trouble").next({ skip_groups = true, jump = true })
					else
						vim.cmd.cnext()
					end
				end,
				desc = "Next trouble/quickfix item",
			},
		},
		event = { "BufReadPost", "BufNewFile" },
	},
}
