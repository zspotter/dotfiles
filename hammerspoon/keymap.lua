
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
