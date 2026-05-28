local terminal = "app2unit footclient"
local browser = "app2unit zen"
local menu = "noctalia-shell ipc call launcher toggle"
local clipboardManager = "jcm"
local powerMenu =
	"ps aux | grep Zalo | grep -v grep | awk '{print $2}' | xargs kill -9 2>/dev/null; noctalia-shell ipc call sessionMenu toggle"
local webcam = "/home/hiepnh/.local/bin/webcam-mpv"
local screenshotEdit = "HQF_ACTION=edit hyprquickframe -n"
local screenshotWindowEdit = "HQF_ACTION=edit HQF_MODE=window hyprquickframe -n"
local lockScreen = "noctalia-shell ipc call lockScreen lock"
local toggleBar = "noctalia-shell ipc call bar toggle"

local raiseVolume = "noctalia-shell ipc call volume increase"
local lowerVolume = "noctalia-shell ipc call volume decrease"
local muteVolume = "noctalia-shell ipc call volume muteOutput"
local micMuteVolume = "noctalia-shell ipc call volume muteInput"
local brightnessUp = "noctalia-shell ipc call brightness increase"
local brightnessDown = "noctalia-shell ipc call brightness decrease"

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

hl.bind(winMod .. " + SHIFT + S", hl.dsp.exec_cmd(screenshotEdit))
hl.bind(winMod .. " + CTRL + S", hl.dsp.exec_cmd(screenshotWindowEdit))
hl.bind("Print", hl.dsp.exec_cmd(screenshotEdit))

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

hl.bind(mainMod .. " + M", hl.dsp.focus({ workspace = "r+1" }))
hl.bind(mainMod .. " + I", hl.dsp.focus({ workspace = "r-1" }))

hl.bind(mainMod .. " + SHIFT + M", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + I", hl.dsp.window.move({ workspace = "e-1" }))
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

hl.bind(winMod .. " + K", hl.dsp.workspace.toggle_special("keepass"))

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

local hwv = hl.plugin.hyprwinview

hl.bind(mainMod .. " + O", function()
	hwv.overview({ action = "toggle" })
end)
hl.bind(mainMod .. " + SHIFT + TAB", function()
	hwv.overview({ action = "toggle", include_current_workspace = false })
end)

local cv = hl.plugin.scrolloverview

hl.bind(mainMod .. " + Y", function()
	cv.overview({ action = "toggle" })
end)
