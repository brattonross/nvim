vim.g.netrw_alto = 1
vim.g.netrw_altv = 1
vim.g.netrw_banner = 0
vim.g.netrw_bufsettings = "noma nomod nu nobl nowrap ro"
vim.g.splitbelow = true
vim.g.splitright = true

vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "80"
vim.opt.completeopt = "menuone,noselect"
vim.opt.expandtab = true
vim.opt.guicursor = ""
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.isfname:append("@-@")
vim.opt.laststatus = 3
vim.opt.list = true
vim.opt.listchars:append({
	eol = "↵",
	space = "⋅",
	tab = "» ",
})
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 4
vim.opt.shortmess:append({ C = true })
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.splitkeep = "screen"
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.wrap = false

vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#45475a", bg = "None" })

vim.opt.winbar = " %m %f "
vim.api.nvim_set_hl(0, "winbar", {
	fg = "#a6adc8",
	bg = "#313244",
})
