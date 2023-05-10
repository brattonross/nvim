return {
	{
		"ThePrimeagen/harpoon",
		keys = {
			{
				"<leader>1",
				"<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
				desc = "Navigate to Harpoon file [1]",
			},
			{
				"<leader>2",
				"<cmd>lua require('harpoon.ui').nav_file(2)<cr>",
				desc = "Navigate to Harpoon file [2]",
			},
			{
				"<leader>3",
				"<cmd>lua require('harpoon.ui').nav_file(3)<cr>",
				desc = "Navigate to Harpoon file [3]",
			},
			{
				"<leader>4",
				"<cmd>lua require('harpoon.ui').nav_file(4)<cr>",
				desc = "Navigate to Harpoon file [4]",
			},
			{
				"<leader>a",
				"<cmd>lua require('harpoon.mark').add_file()<cr>",
				desc = "[A]dd file to Harpoon",
			},
			{
				"<C-e>",
				"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
				desc = "[C-e] Toggle Harpoon quick menu",
			},
		},
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			"debugloop/telescope-undo.nvim",
			"nvim-telescope/telescope-project.nvim",
		},
		config = function()
			local telescope_config = require("telescope.config")

			local vimgrep_arguments = { unpack(telescope_config.values.vimgrep_arguments) }

			-- Search hidden files, but ignore .git
			table.insert(vimgrep_arguments, "--hidden")
			table.insert(vimgrep_arguments, "--glob")
			table.insert(vimgrep_arguments, "!**/.git")

			require("telescope").setup({
				defaults = {
					layout_strategy = "vertical",
					layout_config = {
						vertical = {
							width = 0.9,
							height = 0.9,
						},
					},
					mappings = {
						i = {
							["<C-u>"] = false,
							["<C-d>"] = false,
						},
					},
					vimgrep_arguments = vimgrep_arguments,
				},
				pickers = {
					find_files = {
						find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git" },
					},
				},
			})

			-- Enable telescope fzf native, if installed
			pcall(require("telescope").load_extension, "fzf")
			require("telescope").load_extension("project")
			require("telescope").load_extension("undo")
		end,
		keys = {
			{
				"<leader>?",
				"<cmd>Telescope oldfiles<cr>",
				desc = "[?] Find recently opened files",
			},
			{
				"<leader><space>",
				"<cmd>Telescope buffers<cr>",
				desc = "[ ] Find existing buffers",
			},
			{
				"<leader>sf",
				"<cmd>Telescope find_files<cr>",
				desc = "[S]earch [F]iles",
			},
			{
				"<leader>sh",
				"<cmd>Telescope help_tags<cr>",
				desc = "[S]earch [H]elp",
			},
			{
				"<leader>sw",
				"<cmd>Telescope grep_string<cr>",
				desc = "[S]earch current [W]ord",
			},
			{
				"<leader>sg",
				"<cmd>Telescope live_grep<cr>",
				desc = "[S]earch by [G]rep",
			},
			{
				"<leader>sd",
				"<cmd>Telescope diagnostics<cr>",
				desc = "[S]earch [D]iagnostics",
			},
			{
				"<leader>sc",
				"<cmd>Telescope commands<cr>",
				desc = "[S]earch [C]ommands",
			},
			{
				"<leader>fk",
				"<cmd>Telescope keymaps<cr>",
				desc = "[F]ind [K]eymaps",
			},
			{
				"<leader>u",
				"<cmd>Telescope undo<cr>",
				desc = "[u] Undo history",
			},
			{
				"<leader>gs",
				"<cmd>Telescope git_status<cr>",
				desc = "[G]it [S]tatus",
			},
			{
				"<leader>gc",
				"<cmd>Telescope git_commits<cr>",
				desc = "[G]it [C]ommits",
			},
			{
				"<leader>gb",
				"<cmd>Telescope git_branches<cr>",
				desc = "[G]it [B]ranches",
			},
			{
				"<leader>gf",
				"<cmd>Telescope git_bcommits<cr>",
				desc = "[G]it [F]ile History",
			},
			{
				"<leader>gS",
				"<cmd>Telescope git_stash<cr>",
				desc = "[G]it [S]tash",
			},
		},
		event = "VeryLazy",
	},
}
