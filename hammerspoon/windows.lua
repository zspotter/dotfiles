--==[ Static config ]==--

hs.window.animationDuration = 0
hs.grid.setGrid("7x4")

--==[ Window mode keys ]==--

windowMode = hs.hotkey.modal.new("cmd-shift", "d")
windowMode:bind('', 'escape', function() windowMode:exit() end)

function windowMode:entered()
	if not hs.window.focusedWindow() and hs.window.frontmostWindow() then
		hs.window.frontmostWindow():focus()
	end
	highlightFocus()
end

windowMode:bind('shift', 'h', hs.grid.pushWindowLeft)
windowMode:bind('ctrl', 'h', hs.grid.resizeWindowThinner)
windowMode:bind('', 'h', function()
	hs.window.focusedWindow():focusWindowWest()
	highlightFocus()
end)

windowMode:bind('shift', 'j', hs.grid.pushWindowDown)
windowMode:bind('ctrl', 'j', hs.grid.resizeWindowTaller)
windowMode:bind('', 'j', function()
	hs.window.focusedWindow():focusWindowSouth()
	highlightFocus()
end)

windowMode:bind('shift', 'k', hs.grid.pushWindowUp)
windowMode:bind('ctrl', 'k', hs.grid.resizeWindowShorter)
windowMode:bind('', 'k', function()
	hs.window.focusedWindow():focusWindowNorth()
	highlightFocus()
end)

windowMode:bind('shift', 'l', hs.grid.pushWindowRight)
windowMode:bind('ctrl', 'l', hs.grid.resizeWindowWider)
windowMode:bind('', 'l', function()
	hs.window.focusedWindow():focusWindowEast()
	highlightFocus()
end)

windowMode:bind('', '=', function()
	hs.grid.resizeWindowWider()
	hs.grid.resizeWindowTaller()

end)
windowMode:bind('', '-', function()
	hs.grid.resizeWindowThinner()
	hs.grid.resizeWindowShorter()
end)

hs.hints.style = "vimperator"
windowMode:bind('', 'g', function()
	windowMode:exit()
	hs.hints.windowHints(nil, highlightFocus)
end)

local hl = hs.drawing.rectangle(hs.geometry(0,0,0,0))
hl:setFillColor(hs.drawing.color.hammerspoon.osx_yellow)
function highlightFocus()
	local win = hs.window.focusedWindow()
	if not win then return end

	hl:setFrame(win:frame())
	hl:setAlpha(0.3)
	hl:show()
	local t
	t = hs.timer.doEvery(0.03, function()
		if hl:alpha() <= 0.01 then
			hl:hide()
			t:stop()
			return
		end
		hl:setAlpha(0.85 * hl:alpha())
	end)
end

--==[ Update grid margins based on screen size ]==--

function updateMargins()
  local margins = {w = 0, h = 0}
  for i, screen in ipairs(hs.screen.allScreens()) do
    if screen:fullFrame().w > 1680 then
      margins = {w = 3, h = 3}
    end
  end
  print("Updating margins: {" .. margins.w .. "," .. margins.h .. "}")
  hs.grid.setMargins(margins)
  snapFocus()
end

function snapFocus()
	local win = hs.window.focusedWindow()
	if win then hs.grid.snap(win) end
end


hs.grid.setMargins({w = 0, h = 0})
-- updateMargins()

-- screenWatcher = hs.screen.watcher.new(updateMargins)
-- screenWatcher:start()

