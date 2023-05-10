local function augroup(name)
	return vim.api.nvim_create_augroup("brattonross_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = augroup("highlight_on_yank"),
	pattern = "*",
})

-- Resize splits on VimResized
vim.api.nvim_create_autocmd("VimResized", {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
	group = augroup("resize_splits"),
})

-- Set wrap and spellcheck for certain filetypes
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
	group = augroup("filetype_settings"),
})
