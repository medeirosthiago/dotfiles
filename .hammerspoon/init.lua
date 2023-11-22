--[[
local clock = os.clock
local function sleep(n)
    local t0 = clock() while clock() - t0 <= n do end
end


require "string"

local function checkBluetoothResult(rc, stderr, stderr)
    if rc ~= 0 then
        print(string.format("Unexpected result executing `blueutil`: rc=%d stderr=%s stdout=%s", rc, stderr, stdout))
    end
end

local function bluetooth(power)
    print("Setting bluetooth to " .. power)
    local t = hs.task.new("/opt/homebrew/bin/blueutil", checkBluetoothResult, {"--power", power})
    t:start()
end

    pairtrackpad("off")
    bluetooth("off")
    hs.notify.new({title="Hammerspoon", informativeText="Trackpad being paired"}):send()
    sleep(7)

    bluetooth("on")
    sleep(3)
    pairtrackpad("on")
    sleep(3)
    hs.notify.new({title="Hammerspoon", informativeText="Trackpad paired!"}):send()

end)


local function f(event)
    if event == hs.caffeinate.watcher.systemWillSleep then
        bluetooth("off")
    elseif event == hs.caffeinate.watcher.screensDidWake then
        bluetooth("on")
    end
end

watcher = hs.caffeinate.watcher.new(f)
watcher:start()
 ]]


local function slack_away(status)
    print("Setting slack " .. status)
    local t = hs.task.new("~/src/clones/slack_status_updater/slack_status.sh", nil, { status })
	t:start()
end

hs.hotkey.bind(
	{"cmd", "alt", "ctrl"}, "O",
	function()
		hs.notify.new({title="Hammerspoon", informativeText="OOO"}):send()
		slack_away("ooo")
	end,
	nil,
	function()
		hs.notify.new({title="Hammerspoon", informativeText="Clean status"}):send()
		slack_away("none")
	end
)

--[[ local function f(event)
    if event == hs.caffeinate.watcher.systemWillSleep then
        slack_away("ooo")
    elseif event == hs.caffeinate.watcher.screensDidWake then
        slack_away("none")
    end
end

local watcher = hs.caffeinate.watcher.new(f)
watcher:start() ]]

