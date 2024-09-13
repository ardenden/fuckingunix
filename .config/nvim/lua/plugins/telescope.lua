return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ -- If encountering errors, see telescope-fzf-native README for installation instructions
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},

	config = function()
		require("telescope").setup({
			defaults = {
				sorting_strategy = "ascending",
				preview = false,
				mappings = {
					i = {
						["<C-u>"] = false,
						["<C-d>"] = false,
					},
				},
			},
			pickers = {
				live_grep = {
					theme = "dropdown",
					preview = true,
					layout_config = {
						mirror = true,
					},
				},
				current_buffer_fuzzy_find = {
					theme = "dropdown",
					preview = true,
					layout_config = {
						mirror = true,
					},
				},
				buffers = {
					initial_mode = "normal",
					sort_lastused = true,
					mappings = {
						n = {
							["dd"] = require("telescope.actions").delete_buffer,
						},
					},
				},
				lsp_references = {
					theme = "dropdown",
					preview = true,
					layout_config = {
						mirror = true,
					},
				},
			},
			-- pickers = {}
			extensions = {
				["fzf"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")

		local CallTelescope = function(input)
			local theme = require("telescope.themes").get_dropdown()
			input(theme)
		end

		local builtin = require("telescope.builtin")

		-- Find
		vim.keymap.set("n", "<leader>fo", function()
			CallTelescope(builtin.oldfiles)
		end, { desc = "old files" })
		vim.keymap.set("n", "<leader>fb", function()
			CallTelescope(builtin.buffers)
		end, { desc = "buffers" })
		vim.keymap.set("n", "<leader>fs", function()
			CallTelescope(builtin.builtin)
		end, { desc = "telescope" })
		vim.keymap.set("n", "<leader>fg", function()
			CallTelescope(builtin.git_files)
		end, { desc = "git files" })
		vim.keymap.set("n", "<leader>ff", function()
			CallTelescope(builtin.find_files)
		end, { desc = "files" })
		vim.keymap.set("n", "<leader>fh", function()
			CallTelescope(builtin.help_tags)
		end, { desc = "help" })
		vim.keymap.set("n", "<leader>fw", function()
			CallTelescope(builtin.grep_string)
		end, { desc = "word" })
		vim.keymap.set("n", "<leader>fd", function()
			CallTelescope(builtin.diagnostics)
		end, { desc = "diagnostics" })
		vim.keymap.set("n", "<leader>fr", function()
			CallTelescope(builtin.resume)
		end, { desc = "resume" })

		-- Search
		vim.keymap.set("n", "<leader>ss", builtin.live_grep, { desc = "search" })
		vim.keymap.set("n", "<leader>sb", builtin.current_buffer_fuzzy_find, { desc = "buffer" })
		vim.keymap.set("n", "<leader>so", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "open" })

		-- Shortcut for searching your Neovim configuration files
		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files(require("telescope.themes").get_dropdown({
				preview = true,
				layout_config = { mirror = true },
				prompt_title = "Search Config Files",
				cwd = vim.fn.stdpath("config"),
			}))
		end, { desc = "neovim config" })
	end,
}
