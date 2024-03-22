return {
	-- Run git commands inside nvim
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", function()
			vim.cmd("Git")
		end, { desc = "Open Git status" })

		vim.keymap.set("n", "<leader>gd", function()
			vim.cmd("Gvdiff")
		end, { desc = "Git diff current file" })
	end,
}
