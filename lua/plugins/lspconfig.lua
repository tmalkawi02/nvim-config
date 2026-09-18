---@source https://github.com/folke/lazydev.nvim
return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufNewFile", "BufReadPre", "BufReadPost" },
		opts = {
			servers = {
				"clangd",
				"pyright",
				"lua_ls",
				"ts_ls",
				"jsonls",
				"sqls",
			},
		},
		init = function()
			vim.g.coq_settings = {
				auto_start = true,
				completion = {
					always = true,
				},
				keymap = {
					recommended = true,
					jump_to_mark = "<c-h>",
					pre_select = true,
				},
			}
		end,
		config = function(_, opts)
			opts = opts or {}
			local capabilities = require("blink-cmp").get_lsp_capabilities()

			if opts.servers == nil then
				return print("Error: No configured LSP servers")
			end

			vim.lsp.config("*", { capabilities = capabilities })
			vim.diagnostic.config({ virtual_text = true })
			vim.lsp.enable(opts.servers)

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				on_init = function(client)
					local path = client.workspace_folders[1].name
					if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
						return
					end
					client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
						runtime = {
							version = "LuaJIT",
						},
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
							},
						},
					})
				end,
				settings = {
					Lua = {},
				},
			})
			vim.lsp.config("sqls", {
				cmd = { "sqls", "-config", "~/.config/sqls/config.yaml" },
			})
		end,
	},
}
