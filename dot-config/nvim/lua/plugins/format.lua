return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd", "prettier" },
				typescript = { "prettierd", "prettier" },
				json = { "prettierd", "prettier" },
				rust = { "rustfmt" },
				sh = { "shfmt" },
				go = { "gofmt" },
				zsh = { "beautysh" },
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
		})
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
