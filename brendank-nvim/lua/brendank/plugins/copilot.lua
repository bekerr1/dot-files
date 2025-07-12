return {
	{
		"github/copilot.vim",
		event = "InsertEnter",
		config = function()
			vim.api.nvim_create_autocmd("BufReadPre", {
				callback = function()
					local size = vim.fn.getfsize(vim.fn.expand("<afile>"))
					if size > 100000 or size == -2 then
						vim.b.copilot_enabled = false
					end
				end,
			})
			vim.keymap.set("n", "<leader>cp", "<cmd>Copilot panel<CR>", { desc = "Open Copilot panel" })
		end,
	},
}

-- return {
-- 	{
-- 		"zbirenbaum/copilot.lua",
-- 		lazy = true,
-- 		event = "InsertEnter",
-- 		enabled = true,
-- 		dependencies = {
-- 			{
-- 				"nvim-lualine/lualine.nvim",
-- 				event = "VeryLazy",
-- 				opts = function(_, opts)
-- 					local function codepilot()
-- 						local icon = require("brendank.utils.icons").icons.kinds.Copilot
-- 						return icon
-- 					end
-- 					opts.copilot = {
-- 						lualine_component = {
-- 							codepilot,
-- 							color = function()
-- 								-- online
-- 								local status = require("copilot.api").status
-- 								if status.data.message ~= "" then
-- 									-- NOTE: could potentially do something based on status.data.message too.
-- 									vim.notify("Copilot message: " .. vim.inspect(status.data.message))
-- 								end
-- 							end,
-- 						},
-- 					}
-- 				end,
-- 			},
-- 		},
-- 		cmd = "Copilot",
-- 		build = ":Copilot auth",
-- 		opts = {
-- 			panel = {
-- 				enabled = true,
-- 				auto_refresh = true,
-- 				keymap = {
-- 					accept = "<CR>",
-- 					refresh = "r",
-- 				},
-- 			},
-- 			suggestion = {
-- 				enabled = true,
-- 				keymap = {
-- 					accept = "<Tab>",
-- 				},
-- 				auto_trigger = true,
-- 				accept = false, -- disable built-in keymapping
-- 			},
-- 			filetypes = {
-- 				sh = function()
-- 					if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
-- 						-- disable for .env files
-- 						return false
-- 					end
-- 					return true
-- 				end,
-- 			},
-- 		},
-- 		config = function(_, opts)
-- 			require("copilot").setup(opts)
-- 		end,
-- 		keys = require("brendank.configs.keymaps").copilot_keymaps(),
-- 	},
-- }
