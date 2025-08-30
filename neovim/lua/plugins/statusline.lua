return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local function show_macro_recording()
			local recording_register = vim.fn.reg_recording()
			if recording_register == "" then
				return ""
			else
				return "recording @" .. recording_register
			end
		end
		local theme = require("lualine.themes.vscode")
		theme.normal.b.bg = "#202020"
		theme.command.b.bg = "#202020"
		theme.inactive.b.bg = "#202020"
		theme.insert.b.bg = "#202020"
		theme.replace.b.bg = "#202020"
		theme.terminal.b.bg = "#202020"
		theme.visual.b.bg = "#202020"
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = theme,
				component_separators = "|",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_x = {
					{
						show_macro_recording,
						color = { fg = "#ff9e64" },
					},
					"encoding",
					"fileformat",
					"filetype",
				},
			},
		})
	end,
}
