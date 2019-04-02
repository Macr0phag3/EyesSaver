-- location
saverpath="eyessaver's path"
--

function caffeinateCallback(eventType)
    if (eventType == hs.caffeinate.watcher.screensDidLock) then
        print("screensDidLock")
        os.execute(saverpath.."/eyessaver/stop.sh")
    elseif (eventType == hs.caffeinate.watcher.screensDidUnlock) then
        print("screensDidUnlock")
        os.execute(saverpath.."/eyessaver/start.sh")
    end
end

caffeinateWatcher = hs.caffeinate.watcher.new(caffeinateCallback)
caffeinateWatcher:start()
