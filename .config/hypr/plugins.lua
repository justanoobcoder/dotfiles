if hl.plugin and hl.plugin.scrolloverview then
	hl.plugin.scrolloverview.configure({
		gesture_distance = 300, -- how far is the "max" for the gesture
		scale = 0.3,
		workspace_gap = 10,
		wallpaper = 2, -- 0: global only, 1: per-workspace only, 2: both
		blur = true,

		shadow = {
			enabled = false,
			range = 50,
			render_power = 3,
			color = 0xee1a1a1a,
		},
	})
end
