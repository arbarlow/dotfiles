require("plugins")
require("colors")
require("treesitter")
require("nvim-cmp")
require("luasnip/loaders/from_vscode").load()
require("lsp")
require("nvim-tree").setup({})
require("nvim-autopairs").setup({})

require("trouble").setup({
	icons = false,
})

require("lualine").setup({
	options = {
		-- ... your lualine config
		theme = "nightfox",
	},
	sections = {
		lualine_b = { "branch", "diff" },
		lualine_x = { "diagnostics", "filetype" },
	},
})

vim.o.signcolumn = "yes"
vim.o.clipboard = "unnamed"
vim.o.mouse = "a"
vim.o.termguicolors = true

-- Set the behavior of tab
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.g.mapleader = " "
vim.o.relativenumber = true

vim.api.nvim_set_keymap("", "<Leader><Leader>", "gc", { noremap = false })
vim.api.nvim_set_keymap("n", "<C-e>", ":NvimTreeToggle<CR>", { noremap = true })

vim.o.completeopt = "menu,menuone,noselect"

vim.api.nvim_set_keymap("", "<Leader>t", "<cmd>Telescope find_files<cr>", { noremap = true })
vim.api.nvim_set_keymap("", "<Leader>fg", "<cmd>Telescope find_grep<cr>", { noremap = true })
vim.api.nvim_set_keymap("", "<Leader>ca", ":lua require'telescope.builtin'.lsp_code_actions{}<cr>", { noremap = true })

vim.api.nvim_set_keymap("", "<Leader>p", "<cmd>TroubleToggle<cr>", { noremap = true })
