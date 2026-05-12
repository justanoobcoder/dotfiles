hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 5,

		border_size = 2,

		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		resize_on_border = false,

		allow_tearing = false,
	},

	xwayland = {
		enabled = true,
		force_zero_scaling = true,
	},

	ecosystem = {
		no_update_news = true,
	},
})
