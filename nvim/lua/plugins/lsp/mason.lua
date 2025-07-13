return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"mason-org/mason.nvim",
		"neovim/nvim-lspconfig",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"lua_ls", -- most common programming lang
				"tailwindcss",
				"bashls",
				"dockerls",
				"html",
				"css_ls",
				"pyright",
			},
			automatic_enable = true,
		})

		local mason_tool_installer = require("mason-tool-installer")
		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"isort",
				"black",
				"pylint", -- python linter
				"eslint_d", -- js linter
			},
		})

		vim.lsp.config("*", {
			capabilities = capabilities,
			root_markers = { ".git", ".hg" },
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
		-- lsp special config
		-- vim.lsp.config("ast_grep", {
		--   settings = {
		--     basedpyright = {
		--       analysis = {
		--         typeCheckingMode = "basic",
		--       },
		--     },
		--   },
		-- })
	end,
}
