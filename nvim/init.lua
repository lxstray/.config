-- sets
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.signcolumn = "yes"
vim.opt.shiftwidth = 2
vim.opt.winborder = "rounded"

-- pakcs
vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/Saghen/blink.cmp" },
})

require "mini.pick".setup()
require "mason".setup()
require "oil".setup()
require("blink.cmp").setup({
	signature = { enabled = true },
	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 500 },
		menu = {
			auto_show = true,
			draw = {
				treesitter = { "lsp" },
				columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
			},
		},
	},
	fuzzy = { implementation = "lua" }, -- TODO: mb switch to rust fzf, check blink docs
})

-- remaps
vim.g.mapleader = " "
local map = vim.keymap.set
map('n', '<leader>lf', vim.lsp.buf.format)
map({ 'n', 'v' }, '<leader>y', '"+y')
map({ 'n', 'v' }, '<leader>d', '"+d')
map('n', '<leader>f', ":Pick files<CR>")
map('n', '<leader>e', ":Oil<CR>")

-- colors
require "vague".setup({ transparent = true })
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")

-- lsp
vim.lsp.enable({ "lua_ls", "gopls" })
