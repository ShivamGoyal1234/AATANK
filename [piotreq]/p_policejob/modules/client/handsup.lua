local handsUp = false

RegisterCommand('p_handsup', function()
	if exports['p_policejob']:isInCuffProcess() or LocalPlayer.state.PhoneOpen then
		return
	end
	
	if handsUp then
		ClearPedSecondaryTask(cache.ped)
		handsUp = false
		return
	end

	if LocalPlayer.state.isCuffed or LocalPlayer.state.PhoneOpen then
		return
	end

	local animDict = lib.requestAnimDict("random@mugging3")
	TaskPlayAnim(cache.ped, animDict, "handsup_standing_base", 2.0, 2.0, -1, 49, true)
	RemoveAnimDict(animDict)
	handsUp = true
	Citizen.CreateThread(function()
		while handsUp do
			Wait(1)
			DisableControlAction(2, 24, true)
			DisableControlAction(2, 257, true)
			DisableControlAction(2, 25, true)
			DisableControlAction(2, 263, true)
			DisableControlAction(2, 45, true)
			DisableControlAction(2, 37, true)
			DisableControlAction(2, 23, true)
			DisableControlAction(0, 47, true)
			DisableControlAction(0, 264, true)
			DisableControlAction(0, 257, true)
			DisableControlAction(0, 140, true)
			DisableControlAction(0, 141, true)
			DisableControlAction(0, 142, true)
			DisableControlAction(0, 143, true)
			if (IsEntityPlayingAnim(cache.ped, "random@mugging3", "handsup_standing_base", 3) ~= 1) then
				handsUp = false
			end
		end
	end)
end)

RegisterKeyMapping('p_handsup', locale('hands_up'), 'keyboard', 'OEM_3') -- ALIAS