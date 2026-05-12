hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

local suppressMaximizeRule = hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(true)

hl.window_rule({ match = { class = "kitty" }, scrolling_width = 0.5 })
hl.window_rule({ match = { title = "jcm" }, float = true })
hl.window_rule({ match = { class = "imv" }, float = true })
hl.window_rule({ match = { title = "Select what to share" }, float = true })
hl.window_rule({ match = { title = "Lotus Settings" }, float = true })
hl.window_rule({ match = { title = "Fcitx Configuration" }, float = true })
hl.window_rule({ match = { title = "Settings" }, float = true })
hl.window_rule({ match = { class = "zen" }, workspace = "2" })
hl.window_rule({ match = { class = "keypop" }, no_anim = true })
hl.window_rule({ match = { class = "org.keepassxc.KeePassXC" }, workspace = "special:keepass", no_screen_share = true })
hl.window_rule({ match = { title = "Wine System Tray" }, workspace = "special:dump silent" })

hl.window_rule({
	match = { title = "webcam-mpv" },
	float = true,
	no_initial_focus = true,
	pin = true,
	no_shadow = true,
	border_size = 0,
	size = { "window_w*0.3", "window_h*0.3" },
	move = { "monitor_w-window_w*0.3-10", "(monitor_h-window_h*0.3)/2" },
})

hl.window_rule({
	match = { class = "keypop" },
	float = true,
	opacity = 0.8,
	no_focus = true,
	pin = true,
	no_shadow = true,
	border_size = 0,
	move = { "monitor_w-window_w-10", "monitor_h-window_h-10" },
})

hl.window_rule({
	match = { title = "Blobdrop" },
	float = true,
	no_initial_focus = true,
	pin = true,
	move = { "monitor_w-window_w-10", "monitor_h-window_h-10" },
})

hl.layer_rule({ match = { namespace = "dms.*" }, no_anim = true })
