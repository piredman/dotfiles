return {
	"folke/zen-mode.nvim",
	config = function()
		local zen_mode = require("zen-mode")

		vim.keymap.set("n", "<leader>uz", function()
			zen_mode.toggle()
		end, { desc = "Toggle zen mode" })
	end,
}
