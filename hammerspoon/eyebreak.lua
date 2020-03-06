
--==[ Eye Break ]==--

function alertThen(message, duration, afterFunc)
	local uuid = hs.alert.show(message, duration)
	if afterFunc ~= nil then
		hs.timer.doAfter(duration, function()
			hs.alert.closeSpecific(uuid)
			afterFunc()
		end)
	end
end

function blinkBetween(openMsg, closeMsg)
	local openDur = 0.8
	local closeDur = 0.2
	alertThen(openMsg, openDur, function()
		alertThen(closeMsg, closeDur, function()
			alertThen(openMsg, openDur, function()
				alertThen(closeMsg, closeDur, function()
					alertThen(openMsg, openDur, function()
						alertThen(closeMsg, closeDur, function()
							alertThen(openMsg)
						end)
					end)
				end)
			end)
		end)
	end)
end

local blinkFrames = {
	{"👁   👁", "           "},
	{'🙊', '🙈'},
	{'😳', '🙄'},
	{'👁 🐽 👁💦', 'v   🐽 v  💦'},
	{'👁 👃 👁', '👁‍🗨 👃 👁‍🗨'}
}
function blink()
	local frame = blinkFrames[math.random(#blinkFrames)]
	blinkBetween(frame[1], frame[2])
end

local eyeMenu = hs.menubar.new()
local eyeTimer = nil

function updateEyeTooltip()
	if eyeTimer == nil or not eyeTimer:running() then
		eyeMenu:setTooltip("Don't blink!")
	else
		local remaining = eyeTimer:nextTrigger()
		local minutes = math.floor(remaining / 60)
		eyeMenu:setTooltip("Blink in " .. minutes .. "m")
	end
end

function toggleEye()
	if eyeTimer == nil or not eyeTimer:running() then
		blink()
		eyeTimer = hs.timer.doEvery(20*60, blink)
		eyeMenu:setTitle("👁")
	else
		eyeTimer:stop()
		eyeMenu:setTitle("🙈")
	end
	updateEyeTooltip()
end

if eyeMenu then
	toggleEye()
	eyeMenu:setClickCallback(toggleEye)
	hs.timer.doEvery(10, updateEyeTooltip)
end
