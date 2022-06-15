require("plugins")
require("colors")
require("treesitter")
require("nvim-cmp")
require("lsp")
require("snip")
require("dap-stuff")
require("nvim-autopairs").setup({})
require("telescope").setup({})
-- require("telescope").load_extension("luasnip")

require("nvim-tree").setup({
	renderer = { icons = { show = {
		git = true,
		folder = true,
		file = true,
		folder_arrow = true,
	} } },
})

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

require("octo").setup({})

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

-- vim.keymap.set("n", "<leader>b", require("dap").toggle_breakpoint, { noremap = false })
-- vim.keymap.set("n", "<leader>c", require("dap").continue, { noremap = false })
-- vim.keymap.set("n", "<leader>do", require("dap").step_over, { noremap = false })
-- vim.keymap.set("n", "<leader>di", require("dap").step_into, { noremap = false })
-- vim.keymap.set("n", "<leader>db", require("dap").step_out, { noremap = false })

-- vim.o.completeopt = "menu,menuone,noinsert"

vim.api.nvim_set_keymap("", "<Leader>t", "<cmd>Telescope find_files<cr>", { noremap = true })
vim.api.nvim_set_keymap("", "<Leader>fg", "<cmd>Telescope find_grep<cr>", { noremap = true })
vim.api.nvim_set_keymap("", "<Leader>ca", ":lua require'telescope.builtin'.lsp_code_actions{}<cr>", { noremap = true })
vim.api.nvim_set_keymap("", "<Leader>s", ":lua require'telescope'.extensions.luasnip.luasnip{}<cr>", { noremap = true })

vim.api.nvim_set_keymap("", "<Leader>p", "<cmd>TroubleToggle<cr>", { noremap = true })
