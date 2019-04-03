-- location
saverpath="eyessaver's path"
--

function caffeinateCallback(eventType)
    if (eventType == hs.caffeinate.watcher.screensDidLock) then
        print("screensDidLock")
        os.execute(saverpath.."/stop.sh")
    elseif (eventType == hs.caffeinate.watcher.screensDidUnlock) then
        print("screensDidUnlock")
        os.execute(saverpath.."/start.sh")
    end
end

caffeinateWatcher = hs.caffeinate.watcher.new(caffeinateCallback)
caffeinateWatcher:start()
