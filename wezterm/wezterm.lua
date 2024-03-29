local wezterm = require("wezterm")

local act = wezterm.action

local config = wezterm.config_builder()

-- fonts
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 13.0

config.default_cursor_style = "SteadyBar"

-- appearance
config.color_scheme = "Catppuccin Mocha"

config.background = {
	{
		source = { File = "/home/sabovyan/.config/wezterm/image.png" },

		-- hsb = { brightness = 0.1 },

		attachment = "Fixed",
		vertical_offset = "-64px",
	},
}

config.inactive_pane_hsb = {
	saturation = 0.4,
	brightness = 0.3,
	hue = 0.88,
}

-- keymaps
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "|",
		mods = "LEADER|SHIFT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "c",
		mods = "LEADER",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "n",
		mods = "LEADER",
		action = act.ActivateTabRelative(1),
	},
	{
		key = "p",
		mods = "LEADER",
		action = act.ActivateTabRelative(-1),
	},
	{
		key = "h",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Down"),
	},
}

return config
