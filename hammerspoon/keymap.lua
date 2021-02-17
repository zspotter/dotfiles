
--==[ Function Media Keys ]==--

function remapSystemKeyStroke(fromMods, fromKey, toMods, toSysKey)
	local toModsMap = {}
	for i, key in ipairs(toMods) do
		toModsMap[key] = true
	end

	local function keyStroke()
		hs.eventtap.event.newSystemKeyEvent(toSysKey, true):setFlags(toModsMap):post()
		hs.eventtap.event.newSystemKeyEvent(toSysKey, false):setFlags(toModsMap):post()
	end

	hs.hotkey.bind(fromMods, fromKey, keyStroke, nil, keyStroke)
end

remapSystemKeyStroke({}, 'f7', {}, 'PREVIOUS')
remapSystemKeyStroke({}, 'f8', {}, 'PLAY')
remapSystemKeyStroke({}, 'f9', {}, 'NEXT')
remapSystemKeyStroke({}, 'f10', {}, 'MUTE')
remapSystemKeyStroke({}, 'f11', {}, 'SOUND_DOWN')
remapSystemKeyStroke({}, 'f12', {}, 'SOUND_UP')

--==[ SoundSource App Shortcuts ]==--

function incrementSoundSourceVolume()
  hs.eventtap.keyStroke({'cmd', 'shift'}, hs.keycodes.map('+'))

  -- hs.application.launchOrFocus('SoundSource')
  -- hs.eventtap.keyStroke({}, hs.keycodes.map['down'])
  -- TODO: not working even when focus is on the right bar!
  -- Try emiting separate keystrokes for:
  -- cmd down
  -- up arrow down
  -- up arrow up
  -- cmd up
  -- hs.eventtap.keyStroke({"cmd"}, hs.keycodes.map["up"])
end

-- hs.hotkey.bind({}, 'f12', incrementSoundSourceVolume)
