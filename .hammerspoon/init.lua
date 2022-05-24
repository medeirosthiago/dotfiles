
local clock = os.clock
local function sleep(n)
    local t0 = clock()
    while clock() - t0 <= n do end
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

local function pairtrackpad(power)
    if power == "on" then
        print("Pairing trackpad... ")
        local t = hs.task.new("/opt/homebrew/bin/blueutil", checkBluetoothResult, {"--unpair", "14-c2-13-ef-e1-e9"})
        sleep(3)
        local t = hs.task.new("/opt/homebrew/bin/blueutil", checkBluetoothResult, {"--pair", "14-c2-13-ef-e1-e9"})
        t:start()
    else
        print("Unpairing trackpad... ")
        local t = hs.task.new("/opt/homebrew/bin/blueutil", checkBluetoothResult, {"--unpair", "14-c2-13-ef-e1-e9"})
        t:start()
    end
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "T", function()

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


--[[ local function f(event)
    if event == hs.caffeinate.watcher.systemWillSleep then
        pairtrackpad("off")
        bluetooth("off")
    elseif event == hs.caffeinate.watcher.screensDidWake then
        bluetooth("on")
        sleep(7)
        pairtrackpad("on")
    end
end ]]

-- watcher = hs.caffeinate.watcher.new(f)
-- watcher:start()

