-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local c = wezterm.config_builder()

-- This is where you actually apply your config choices

c.default_prog = { "zsh" }

c.colors = {
	background = "#020403",
	tab_bar = {
		background = "rgba(2,4,3,0.9)",
	},
}

c.window_background_opacity = 0.9
c.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
c.window_decorations = "RESIZE"
c.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.3,
}

c.tab_max_width = 32
c.use_fancy_tab_bar = false
c.hide_tab_bar_if_only_one_tab = true
c.show_new_tab_button_in_tab_bar = false

c.keys = {
	{
		key = "w",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
}

local function current_working_dir(tab)
	local current_dir = tab.active_pane and tab.active_pane.current_working_dir or { file_path = "" }
	local HOME_DIR = os.getenv("HOME")

	return current_dir.file_path == HOME_DIR and "~" or string.gsub(current_dir.file_path, "(.*[/\\])(.*)", "%2")
end

-- tmp
local function process_name(tab)
	local title = tab.tab_title
	if title and #title > 0 then
		return title
	end

	return tab.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local edge_background = "rgba(2,4,3,0.9)"
	local background = "#262626"
	local foreground = "#cdd6f4"

	if tab.is_active then
		background = "#569cd6"
		foreground = "#262626"
	elseif hover then
		background = "#c586c0"
		foreground = "#262626"
	end

	local edge_foreground = background
	local cwd = wezterm.format({ { Text = current_working_dir(tab) } })
	local process = process_name(tab)
	local index = tab.tab_index + 1
	local title = process and string.format("%s | %s | %s", index, process, cwd) or " [?] "
	title = wezterm.truncate_right(title, max_width - 2)
	local left = ""
	local right = ""
	if index <= 1 then
		left = "█"
	elseif index >= #tabs then
		right = "█"
	end
	local output = {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = left },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = right },
	}

	return output
end)

-- and finally, return the configuration to wezterm
return c
