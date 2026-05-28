hl.config({
	decoration = {
		rounding = 10,
		rounding_power = 2,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 6,
			passes = 3,
			noise = 0.02,
			contrast = 0.9,
			brightness = 0.85,
			vibrancy = 0.2,
			vibrancy_darkness = 0.0,
			new_optimizations = true,
			xray = false,
			popups = true,
			ignore_opacity = true,
		},
	},
})
