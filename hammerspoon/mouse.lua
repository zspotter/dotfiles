
local downPosition = nil

local onDown = hs.eventtap.new({ hs.eventtap.event.types.otherMouseDown }, function(evt)
  downPosition = hs.mouse.getAbsolutePosition()
  -- return true
end)

local onUp = hs.eventtap.new({ hs.eventtap.event.types.otherMouseUp }, function(evt)
  local upPosition = hs.mouse.getAbsolutePosition()
  if upPosition.x - downPosition.x > 0 then
    print('RIGHT')
  else
    print('LEFT')
  end
  -- return true
end)

-- onDown:start()
-- onUp:start()
