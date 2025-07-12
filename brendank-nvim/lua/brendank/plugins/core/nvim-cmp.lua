return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		version = "0.0.2",
		dependencies = {
			-- {
			-- 	"L3MON4D3/LuaSnip",
			-- 	dependencies = "rafamadriz/friendly-snippets",
			-- 	opts = { history = true, updateevents = "TextChanged,TextChangedI" },
			-- 	config = function(_, opts)
			-- 		require("luasnip").config.set_config(opts)
			-- 	end,
			-- },
			{
				-- "saadparwaiz0/cmp_luasnip",
				"zbirenbaum/copilot-cmp",
				-- "hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
			},
		},
		opts = {
			completion = { completeopt = "menu,menuone,noinsert,noselect" },
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
		},
		config = function(_, opts)
			local cmp = require("cmp")
			cmp.setup({
				mapping = {
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Insert,
						select = true,
					}),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function()
						if vim.fn["copilot#Accept"]() ~= "" then
							vim.api.nvim_feedkeys(vim.fn["copilot#Accept"](), "n", true)
						else
							cmp.confirm({ select = true })
						end
					end, { "i", "s" }),
					-- ["<Tab>"] = cmp.mapping(function(fallback)
					-- 	if cmp.visible() then
					-- 		cmp.select_next_item()
					-- 	elseif require("luasnip").expand_or_jumpable() then
					-- 		require("luasnip").expand_or_jump()
					-- 	else
					-- 		fallback()
					-- 	end
					-- end, { "i", "s" }),
				},
				sources = cmp.config.sources({
					{ name = "copilot", priority = 1000 },
					{ name = "nvim_lsp", priority = 900 },
					{ name = "buffer", priority = 800 },
					{ name = "path", priority = 700 },
				}),
				-- sources = {
				-- 	{ name = "nvim_lsp" },
				-- 	{ name = "luasnip" },
				-- 	{ name = "buffer" },
				-- 	{ name = "nvim_lua" },
				-- 	{ name = "path" },
				-- },
			})
			require("copilot_cmp").setup()
		end,
	},
}

-- return {
-- 	{
-- 		"hrsh7th/nvim-cmp",
-- 		dependencies = {
-- 			"hrsh7th/cmp-nvim-lsp",
-- 		},
-- 		config = function() end,
-- 	},
-- }

-- return {
-- 	"hrsh7th/nvim-cmp",
-- 	dependencies = {
-- 		"neovim/nvim-lspconfig", -- Or other LSP configs
-- 		"hrsh7th/cmp-nvim-lsp",
-- 		"L3MON4D3/LuaSnip",
-- 		"hrsh7th/cmp-path",
-- 		"hrsh7th/cmp-buffer",
-- 	},
-- 	config = function()
-- 		require("cmp").setup({
-- 			completion = { completeopt = "menu,menuone,noinsert,noselect" },
-- 		})
-- 	end,
-- }

-- return {
-- 	{
-- 		"hrsh7th/nvim-cmp",
-- 		event = "InsertEnter",
-- 		dependencies = {
-- 			{
-- 				-- snippet plugin
-- 				"L3MON4D3/LuaSnip",
-- 				dependencies = "rafamadriz/friendly-snippets",
-- 				opts = { history = true, updateevents = "TextChanged,TextChangedI" },
-- 				config = function(_, opts)
-- 					require("luasnip").config.set_config(opts)
-- 				end,
-- 			},
--
-- 			-- autopairing of (){}[] etc
-- 			-- {
-- 			-- 	"windwp/nvim-autopairs",
-- 			-- 	opts = {
-- 			-- 		fast_wrap = {},
-- 			-- 		disable_filetype = { "TelescopePrompt", "vim" },
-- 			-- 	},
-- 			-- 	config = function(_, opts)
-- 			-- 		require("nvim-autopairs").setup(opts)
-- 			--
-- 			-- 		-- setup cmp for autopairs
-- 			-- 		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
-- 			-- 		require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
-- 			-- 	end,
-- 			-- },
--
-- 			-- cmp sources plugins
-- 			{
-- 				"saadparwaiz1/cmp_luasnip",
-- 				"hrsh7th/cmp-nvim-lua",
-- 				"hrsh7th/cmp-nvim-lsp",
-- 				"hrsh7th/cmp-buffer",
-- 				"hrsh7th/cmp-path",
-- 			},
-- 		},
-- 		config = function()
-- 			local cmp = require("cmp")
-- 			cmp.setup({
-- 				mapping = {
-- 					["<C-n>"] = cmp.mapping.select_next_item(),
-- 					["<C-p>"] = cmp.mapping.select_prev_item(),
-- 					["<CR>"] = cmp.mapping.confirm({ select = true }),
-- 				},
-- 				sources = {
-- 					--{ name = "nvim_lsp" },
-- 					{ name = "luasnip" },
-- 					{ name = "buffer" },
-- 					{ name = "nvim_lua" },
-- 					{ name = "path" },
-- 				},
-- 			})
-- 		end,
-- 	},
-- }
