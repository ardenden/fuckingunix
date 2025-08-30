return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-telescope/telescope.nvim", -- optional
		},
		vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Neogit" }),
	},

	{
		"lewis6991/gitsigns.nvim",
		opts = {
			on_attach = function(bufnr)
				local gs = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gs.nav_hunk("next")
					end
				end, { desc = "Jump to next hunk" })

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gs.nav_hunk("prev")
					end
				end, { desc = "Jump to previous hunk" })

				-- Actions
				-- visual mode
				map("v", "<leader>gs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "stage hunk" })
				map("v", "<leader>gr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "reset hunk" })
				-- normal mode
				map("n", "<leader>gs", gs.stage_hunk, { desc = "stage hunk" })
				map("n", "<leader>gu", gs.stage_hunk, { desc = "unstage hunk" })
				map("n", "<leader>gr", gs.reset_hunk, { desc = "reset hunk" })
				map("n", "<leader>gS", gs.stage_buffer, { desc = "Stage buffer" })
				map("n", "<leader>gR", gs.reset_buffer, { desc = "Reset buffer" })
				map("n", "<leader>gp", gs.preview_hunk, { desc = "preview hunk" })
				map("n", "<leader>gb", gs.blame_line, { desc = "blame line" })
				map("n", "<leader>gC", gs.diffthis, { desc = "diff against index" })
				map("n", "<leader>gc", function()
					gs.diffthis("@")
				end, { desc = "diff against last commit" })

				-- Toggles
				map("n", "<leader>gl", gs.toggle_current_line_blame, { desc = "toggle blame line" })
				map("n", "<leader>gd", gs.preview_hunk_inline, { desc = "toggle show deleted" })
			end,
		},
	},
}
