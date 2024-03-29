require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	ignore_install = { "phpdoc" },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	highlight = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
})
