return {
	{
		"ThePrimeagen/harpoon",
		config = function()
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")

			vim.keymap.set("n", "<leader>a", mark.add_file, {
				desc = "[a] Add file to Harpoon",
			})
			vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, {
				desc = "[C-e] Toggle Harpoon quick menu",
			})
			vim.keymap.set("n", "<leader>1", function()
				ui.nav_file(1)
			end, { desc = "[1] Navigate to Harpoon file 1" })
			vim.keymap.set("n", "<leader>2", function()
				ui.nav_file(2)
			end, { desc = "[2] Navigate to Harpoon file 2" })
			vim.keymap.set("n", "<leader>3", function()
				ui.nav_file(3)
			end, { desc = "[3] Navigate to Harpoon file 3" })
			vim.keymap.set("n", "<leader>4", function()
				ui.nav_file(4)
			end, { desc = "[4] Navigate to Harpoon file 4" })
		end,
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

			-- See `:help telescope.builtin`
			vim.keymap.set(
				"n",
				"<leader>?",
				require("telescope.builtin").oldfiles,
				{ desc = "[?] Find recently opened files" }
			)
			vim.keymap.set(
				"n",
				"<leader><space>",
				require("telescope.builtin").buffers,
				{ desc = "[ ] Find existing buffers" }
			)
			vim.keymap.set("n", "<leader>/", function()
				-- You can pass additional configuration to telescope to change theme, layout, etc.
				require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
			vim.keymap.set(
				"n",
				"<leader>sw",
				require("telescope.builtin").grep_string,
				{ desc = "[S]earch current [W]ord" }
			)
			vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
			vim.keymap.set(
				"n",
				"<leader>sd",
				require("telescope.builtin").diagnostics,
				{ desc = "[S]earch [D]iagnostics" }
			)
		end,
		event = "VeryLazy",
	},
}
