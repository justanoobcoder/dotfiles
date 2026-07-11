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

local no_anim_layers = {
	"noctalia-screenshot-region",
	"hyprpicker",
}
for _, name in ipairs(no_anim_layers) do
	hl.layer_rule({ match = { namespace = name }, no_anim = true })
end

local float_windows = {
	{ class = "com.gabm.satty" },
	{ class = "imv" },
	{ title = "jcm" },
	{ title = "Select what to share" },
	{ title = "Lotus Settings" },
	{ title = "Fcitx Configuration" },
	{ title = "Settings" },
}
for _, match in ipairs(float_windows) do
	hl.window_rule({ match = match, float = true })
end

hl.window_rule({ match = { focus = false }, no_blur = true })
hl.window_rule({ match = { class = "kitty" }, scrolling_width = 0.5 })
hl.window_rule({ match = { class = "footclient" }, scrolling_width = 0.5 })
hl.window_rule({ match = { class = "foot" }, scrolling_width = 0.5 })
hl.window_rule({ match = { class = "zen" }, workspace = "2" })
hl.window_rule({ match = { class = "keypop" }, no_anim = true })
hl.window_rule({ match = { class = "org.keepassxc.KeePassXC" }, workspace = "special:keepass", no_screen_share = true })
hl.window_rule({ match = { class = "antigravity" }, workspace = "special:antigravity" })
hl.window_rule({ match = { title = "Wine System Tray" }, workspace = "special:dump silent" })
hl.window_rule({
	match = { title = "Noctalia Settings" },
	float = true,
	size = { "(monitor_w*0.8)", "(monitor_h*0.8)" },
})

hl.window_rule({
	match = { title = "webcam-mpv" },
	float = true,
	no_initial_focus = true,
	pin = true,
	no_shadow = true,
	border_size = 0,
	size = { "monitor_w*0.15", "monitor_h*0.15" },
	move = { "monitor_w-monitor_w*0.15-10", "(monitor_h-monitor_h*0.15)/2" },
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

hl.layer_rule({
	name = "noctalia",
	match = {
		namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd)$",
	},
  no_anim = true,
	ignore_alpha = 0.5,
	blur = true,
	blur_popups = true,
})
