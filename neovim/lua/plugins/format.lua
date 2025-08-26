return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		format_on_save = function(bufnr)
			local disable_filetypes = { c = true, cpp = true }
			if disable_filetypes[vim.bo[bufnr].filetype] then
				return nil
			else
				return {
					timeout_ms = 500,
					lsp_format = "fallback",
				}
			end
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd", "prettier" },
			typescript = { "prettierd", "prettier" },
			json = { "prettierd", "prettier" },
			rust = { "rustfmt" },
			sh = { "shfmt" },
			go = { "gofmt" },
			zsh = { "beautysh" },
			yaml = { "prettierd", "prettier" },
			css = { "prettierd", "prettier" },
			svelte = { "prettierd", "prettier" },
			html = { "prettierd", "prettier" },
			htmlangular = { "prettierd", "prettier" },
		},
		default_format_opts = {
			stop_after_first = true,
			lsp_format = "fallback",
		},
		formatters = {
			beautysh = {
				inherit = true,
				append_args = { "--tab" },
			},
		},
	},
}
