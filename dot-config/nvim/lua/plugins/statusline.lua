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
		local theme = require("lualine.themes.codedark")
		local i_a_bg = theme.insert.a.bg
		local i_b_fg = theme.insert.b.fg
		local n_a_bg = theme.normal.a.bg
		local n_b_fg = theme.normal.b.fg
		theme.normal.a.bg = i_a_bg
		theme.normal.b.fg = i_b_fg
		theme.insert.a.bg = n_a_bg
		theme.insert.b.fg = n_b_fg
		theme.normal.c.bg = "None"
		theme.insert.c.bg = "None"
		theme.replace.c.bg = "None"
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
