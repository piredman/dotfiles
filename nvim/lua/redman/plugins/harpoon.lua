return {
	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")

			vim.keymap.set("n", "<leader>hl", ui.toggle_quick_menu, { desc = "List harpoon files" })
			vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "Mark file with harpoon" })

			local function nav_next()
				ui.nav_next()
			end
			vim.keymap.set("n", "<leader>hn", nav_next, { desc = "Go to next harpoon mark" })
			vim.keymap.set("n", "<A-n>", nav_next)

			local function nav_prev()
				ui.nav_next()
			end
			vim.keymap.set("n", "<leader>hp", nav_prev, { desc = "Go to previous harpoon mark" })
			vim.keymap.set("n", "<A-n>", nav_prev)

			local function nav_file_1()
				ui.nav_file(1)
			end
			vim.keymap.set("n", "<leader>h1", nav_file_1, { desc = "Go to first harpoon mark" })
			vim.keymap.set("n", "<A-h>", nav_file_1)

			local function nav_file_2()
				ui.nav_file(2)
			end
			vim.keymap.set("n", "<leader>h2", nav_file_2, { desc = "Go to second harpoon mark" })
			vim.keymap.set("n", "<A-j>", nav_file_2)

			local function nav_file_3()
				ui.nav_file(3)
			end
			vim.keymap.set("n", "<leader>h3", nav_file_3, { desc = "Go to third harpoon mark" })
			vim.keymap.set("n", "<A-k>", nav_file_3)

			local function nav_file_4()
				ui.nav_file(4)
			end
			vim.keymap.set("n", "<leader>h4", nav_file_4, { desc = "Go to forth harpoon mark" })
			vim.keymap.set("n", "<A-l>", nav_file_4)
		end,
	},
}
