local function script_path()
  local str = debug.getinfo(2, "S").source:sub(2)
  return str:match("(.*/)")
end

local path = script_path()
print("Loading scripts at " .. path)

dofile(path .. "keymap.lua")
dofile(path .. "windows.lua")
dofile(path .. "eyebreak.lua")
dofile(path .. "mouse.lua")

-- Show UTC time in menubar
-- local utcMenuBar = hs.menubar.new()
-- hs.timer.doEvery(1, function()
--   utcMenuBar:setTitle(os.date("!%H:%M UTC"))
-- end)
