local terminal = "app2unit ghostty"
local browser =
	"app2unit brave --enable-features=AcceleratedVideoDecodeLinuxGL,VaapiOnNvidiaGPUs --ignore-gpu-blocklist --use-gl=angle --use-angle=gl"
local menu = "noctalia msg panel-toggle launcher"
local clipboardManager = "jcm"
local powerMenu =
	"ps aux | grep Zalo | grep -v grep | awk '{print $2}' | xargs kill -9 2>/dev/null; noctalia msg panel-toggle session"
local webcam = "/home/hiepnh/.local/bin/webcam-mpv"
local screenshotFull = "noctalia msg screenshot-fullscreen"
local screenshotRegion = "noctalia msg screenshot-region"
local screenshotEdit = "HQF_ACTION=edit hyprquickframe -n"
local lockScreen = "noctalia msg session lock"
local toggleBar = "noctalia msg bar-toggle"

local raiseVolume = "noctalia msg volume-up 2"
local lowerVolume = "noctalia msg volume-down 2"
local muteVolume = "noctalia msg volume-mute"
local micMuteVolume = "noctalia msg mic-mute"
local brightnessUp = "noctalia msg brightness-up 2"
local brightnessDown = "noctalia msg brightness-down 2"
local settings = "noctalia msg settings-toggle"

local mainMod = "ALT"
local winMod = "SUPER"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + X", hl.dsp.window.kill())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd(powerMenu))
hl.bind(mainMod .. " + V", hl.dsp.window.float())
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind(mainMod .. " + F1", hl.dsp.exec_cmd(webcam))
hl.bind(mainMod .. " + F2", hl.dsp.exec_cmd("pkill keypop || keypop"))
hl.bind(mainMod .. " + R", hl.dsp.layout("colresize +conf"))
hl.bind(mainMod .. " + TAB", hl.dsp.focus({ workspace = "previous" }))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(toggleBar))

hl.bind(winMod .. " + TAB", hl.dsp.focus({ last = true }))

hl.bind(winMod .. " + V", hl.dsp.exec_cmd(clipboardManager))
hl.bind(winMod .. " + L", hl.dsp.exec_cmd(lockScreen))
hl.bind(winMod .. " + C", hl.dsp.exec_cmd("hyprpicker -an"))
hl.bind(winMod .. " + X", hl.dsp.exec_cmd(powerMenu))
hl.bind(winMod .. " + I", hl.dsp.exec_cmd(settings))

hl.bind(winMod .. " + SHIFT + S", hl.dsp.exec_cmd(screenshotRegion))
hl.bind("Print", hl.dsp.exec_cmd(screenshotFull))
hl.bind("CTRL + Print", hl.dsp.exec_cmd(screenshotEdit))

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + G", hl.dsp.group.toggle())

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + M", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + I", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + SHIFT + M", hl.dsp.window.move({ workspace = "r+1" }))
hl.bind(mainMod .. " + SHIFT + I", hl.dsp.window.move({ workspace = "r-1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse_left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + mouse_right", hl.dsp.focus({ direction = "right" }))

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.layout("swapcol r"))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(winMod .. " + End", hl.dsp.pass({ window = "class:^(com.obsproject.Studio)$" }))
hl.bind(winMod .. " + Home", hl.dsp.pass({ window = "class:^(com.obsproject.Studio)$" }))
hl.bind(winMod .. " + F1", hl.dsp.pass({ window = "class:^(com.obsproject.Studio)$" }))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(raiseVolume), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(lowerVolume), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(muteVolume), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(micMuteVolume), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(brightnessUp), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(brightnessDown), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind(winMod .. " + A", hl.dsp.workspace.toggle_special("antigravity"))
hl.bind(winMod .. " + K", hl.dsp.workspace.toggle_special("keepass"))

hl.gesture({ fingers = 3, direction = "vertical", action = "workspace" })
hl.gesture({ fingers = 2, direction = "pinch", action = "cursorZoom", zoom_level = 1, mode = "live" })

if hl.plugin and hl.plugin.scrolloverview then
	hl.bind(mainMod .. " + O", function()
		hl.plugin.scrolloverview.overview("toggle")
	end)
end

hl.bind("SUPER + F1", function()
	local game_mode = (hl.get_config("animations.enabled") == false)

	if game_mode then
		hl.exec_cmd("hyprctl reload")
		return
	end

	hl.config({
		general = {
			gaps_in = 0,
			gaps_out = 0,
			border_size = 0,
		},

		animations = {
			enabled = false,
		},

		decoration = {
			shadow = { enabled = false },
			blur = { enabled = false },
			rounding = 0,
		},
	})
end)
