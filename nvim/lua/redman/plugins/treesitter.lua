return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"lua",
				"vimdoc",
				"vim",
				"bash",
				"javascript",
				"typescript",
				"tsx",
				"html",
				"css",
				"c_sharp",
				"python",
				"dockerfile",
				"graphql",
				"sql",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
