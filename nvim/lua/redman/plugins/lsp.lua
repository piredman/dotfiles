return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"hrsh7th/cmp-nvim-lsp",
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"tsserver",
					"html",
					"cssls",
					"graphql",
					"emmet_ls",
					"lua_ls",
					"omnisharp",
					"pyright",
				},
			})
			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua",
					"prettier",
					"eslint_d",
					"isort",
					"black",
					"pylint",
					"csharpier",
				},
			})

			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			local on_attach = function(client, bufnr)
				local function buf_set_option(...)
					vim.api.nvim_buf_set_option(bufnr, ...)
				end

				buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

				vim.keymap.set("n", "<leader>sr", "<cmd>Telescope lsp_references<CR>", {
					desc = "Show LSP references",
				})

				vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {
					desc = "Go to declaration",
				})

				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {
					desc = "See available code actions",
				})

				vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {
					desc = "Smart rename",
				})

				vim.keymap.set("n", "<leader>el", "<cmd>Telescope diagnostics bufnr=0<CR>", {
					desc = "List buffer errors (diagnostics)",
				})

				vim.keymap.set("n", "<leader>ee", vim.diagnostic.open_float, {
					desc = "Show line errors (diagnostics)",
				})

				vim.keymap.set("n", "<leader>ep", vim.diagnostic.goto_prev, {
					desc = "Go to previous errors (diagnostics)",
				})

				vim.keymap.set("n", "<leader>en", vim.diagnostic.goto_next, {
					desc = "Go to next errors (diagnostics)",
				})

				vim.keymap.set("n", "<leader>sd", vim.lsp.buf.hover, {
					desc = "Show documentation for what is under cursor",
				})

				vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", {
					desc = "Restart LSP",
				})
			end

			-- used to enable autocompletion (assign to every lsp server config)
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				cmp_nvim_lsp.default_capabilities() or {}
			)

			lspconfig.html.setup({
				capabilities = vim.deepcopy(capabilities),
				on_attach = on_attach,
			})

			lspconfig.cssls.setup({
				capabilities = vim.deepcopy(capabilities),
				on_attach = on_attach,
			})

			lspconfig.tsserver.setup({
				capabilities = vim.deepcopy(capabilities),
				on_attach = on_attach,
			})

			lspconfig.omnisharp.setup({
				capabilities = vim.deepcopy(capabilities),
				on_attach = on_attach,
			})

			lspconfig.graphql.setup({
				capabilities = vim.deepcopy(capabilities),
				on_attach = on_attach,
				filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
			})

			lspconfig.emmet_ls.setup({
				capabilities = vim.deepcopy(capabilities),
				on_attach = on_attach,
				filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
			})

			lspconfig.pyright.setup({
				capabilities = vim.deepcopy(capabilities),
				on_attach = on_attach,
			})

			lspconfig.lua_ls.setup({
				capabilities = vim.deepcopy(capabilities),
				on_attach = on_attach,
				settings = { -- custom settings for lua
					Lua = {
						-- make the language server recognize "vim" global
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							-- make language server aware of runtime files
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})
		end,
	},
}
