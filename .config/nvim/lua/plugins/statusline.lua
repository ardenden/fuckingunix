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
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
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
