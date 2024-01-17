return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")
		wk.register({
			["<leader>"] = {
				c = { name = "+code" },
				d = { name = "+debug" },
				e = { name = "+error" },
				f = { name = "+file" },
				g = { name = "+goto" },
				h = { name = "+harpoon" },
				r = { name = "+restart" },
				s = { name = "+show" },
				u = { name = "+ui" },
				w = { name = "+window" },
			},
		})
	end,
}
