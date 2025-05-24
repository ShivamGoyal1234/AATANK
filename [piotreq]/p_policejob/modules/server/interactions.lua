local function forceUncuff(playerId)
    local _source = playerId
    local state = Player(_source).state
    if not state.isCuffed then
        return
    end

    local cuffType = state.cuffType
    state:set('isCuffed', false, true)
    state:set('cuffType', "none", true)
    local timer = 0
    Citizen.Wait(1000)
    while Player(_source).state.isCuffed do
        Citizen.Wait(500)
        timer += 1
        if timer >= 5 then
            break
        end
    end
    TriggerClientEvent('p_policejob:ForceUncuff', _source, cuffType)
    SendDiscordLog(_source, locale('player_has_been_force_uncuffed'), 'interactions')

    if GetResourceState('qb-core') == 'started' or GetResourceState('qbx_core') == 'started' then
        local xPlayer = Core.GetPlayerFromId(_source)
        xPlayer.Functions.SetMetaData('ishandcuffed', false)
    end
end

exports('forceUncuff', forceUncuff)

local function forceCuff(playerId)
    local _source = playerId
    local state = Player(_source).state
    if state.isCuffed then
        return
    end

    state:set('isCuffed', true, true)
    state:set('cuffType', "cuffs", true)
    TriggerClientEvent('p_policejob:ForceCuff', _source)
    SendDiscordLog(_source, locale('player_has_been_force_cuffed'), 'interactions')
    if GetResourceState('qb-core') == 'started' or GetResourceState('qbx_core') == 'started' then
        local xPlayer = Core.GetPlayerFromId(_source)
        xPlayer.Functions.SetMetaData('ishandcuffed', true)
    end
end

exports('forceCuff', forceCuff)

RegisterNetEvent('p_policejob:HandCuffs')
AddEventHandler('p_policejob:HandCuffs', function(data)
    local _source = source
    if not utils.canInteract(_source, data.player, 5.0) then  -- utils.canInteract is checking player distance, player online, id's etc
        SendDiscordLog(_source, locale('player_attempted_to_cuff', data.player), 'interactions')
        return 
    end

    if data.type == 'cuffs' then
        if Inventory.getItemCount(_source, 'handcuffs') < 1 then return end
        SendDiscordLog(_source, locale('player_cuffed_player_cuffs', data.player), 'interactions')
    else
        if data.state then 
            if Inventory.getItemCount(_source, 'rope') < 1 then
                return
            end

            Inventory.removePlayerItem(_source, 'rope', 1)
        else
            Inventory.addPlayerItem(_source, 'rope', 1)
        end
        SendDiscordLog(_source, locale('player_cuffed_player_rope', data.player), 'interactions')
    end

    if GetResourceState('qb-core') == 'started' or GetResourceState('qbx_core') == 'started' then
        local xPlayer = Core.GetPlayerFromId(data.player)
        xPlayer.Functions.SetMetaData('ishandcuffed', data.state)
    end
    
    TriggerClientEvent('p_policejob:HandCuffsAnimation', _source, {
        isCuff = data.state,
        isArrested = false,
        player = data.player,
        type = data.type,
        timer = data.timer,
        time = data.time,
        front = data.front,
        isHard = data.isHard
    })
    TriggerClientEvent('p_policejob:HandCuffsAnimation', data.player, {
        isCuff = data.state,
        isArrested = true,
        player = _source,
        type = data.type,
        timer = data.timer,
        time = data.time,
        front = data.front,
        isHard = data.isHard
    })
end)

RegisterNetEvent('p_policejob:DragPlayer')
AddEventHandler('p_policejob:DragPlayer', function(data)
    local _source = source
    if not utils.canInteract(_source, data.player, 5.0) then
        SendDiscordLog(_source, locale('player_attempted_to_drag_player', data.player), 'interactions')
        return 
    end

    local playerState = Player(_source).state
    local targetState = Player(data.player).state
    if data.state and targetState.draggedBy then return end
    if Core.isPlayerDead(data.player) or targetState.isCuffed or (playerState.draggingPlayer and playerState.draggingPlayer == data.player) then
        TriggerClientEvent('p_policejob:StartDrag', _source, {
            state = data.state,
            isDragging = true,
            player = data.player
        })
        
        TriggerClientEvent('p_policejob:StartDrag', data.player, {
            state = data.state,
            isDragging = false,
            player = _source
        })
    
        playerState:set('draggingPlayer', data.state and data.player or nil, true)
        targetState:set('draggedBy', data.state and _source or nil, true)
        SendDiscordLog(_source, locale(data.state and 'player_start_dragging_player' or 'player_stopped_dragging_player', data.player), 'interactions')
    end
end)

RegisterNetEvent('p_policejob:OutVehicle')
AddEventHandler('p_policejob:OutVehicle', function(data)
    local _source = source
    if not utils.canInteract(_source, data.player) then
        SendDiscordLog(_source, locale('player_attempted_to_get_out_player', data.player), 'interactions')
        return 
    end

    if Config.Debug then
        print(('Checking if is player %s is dead or cuffed'):format(data.player))
        print('Is player '..data.player..' dead: '..tostring(Core.isPlayerDead(data.player)))
        print('Is player '..data.player..' cuffed: '..tostring(Player(data.player).state.isCuffed))
    end
    if Core.isPlayerDead(data.player) or Player(data.player).state.isCuffed then
        if Config.Debug then
            print(('Attempt to take out player %s from vehicle'):format(data.player))
        end
        TriggerClientEvent('p_policejob:client:TakeOutVehicle', data.player)
        SendDiscordLog(_source, locale('player_took_out_player', data.player), 'interactions')
    end
end)

RegisterNetEvent('p_policejob:PutInVehicle')
AddEventHandler('p_policejob:PutInVehicle', function(data)
    local _source = source
    if not utils.canInteract(_source, data.player) then 
        SendDiscordLog(_source, locale('player_attempted_to_put_in_player', data.player), 'interactions')
        return 
    end

    local targetState = Player(data.player).state
    if Config.Debug then
        print(('Checking if is player %s is dead or cuffed'):format(data.player))
        print('Is player '..data.player..' dead: '..tostring(Core.isPlayerDead(data.player)))
        print('Is player '..data.player..' cuffed: '..tostring(targetState.isCuffed))
    end
    if Core.isPlayerDead(data.player) or targetState.isCuffed then
        if Config.Debug then
            print(('Attempt to put in vehicle player %s on seat %s'):format(data.player, data.seat))
        end

        if targetState.draggedBy then
            TriggerClientEvent('p_policejob:StartDrag', _source, {
                state = false,
                isDragging = true,
                player = data.player
            })
            
            TriggerClientEvent('p_policejob:StartDrag', data.player, {
                state = false,
                isDragging = false,
                player = _source
            })
        
            Player(_source).state:set('draggingPlayer', nil, true)
            targetState:set('draggedBy', nil, true)
            Citizen.Wait(100)
        end


        TriggerClientEvent('p_policejob:client:PutInVehicle', data.player, {
            player = _source,
            seat = data.seat
        })
        SendDiscordLog(_source, locale('player_put_in_player', data.player, data.seat), 'interactions')
    end
end)

RegisterNetEvent('p_policejob:CheckGunPowder')
AddEventHandler('p_policejob:CheckGunPowder', function(targetId)
    local _source = source
    if not utils.canInteract(_source, targetId) then
        SendDiscordLog(_source, locale('player_attempted_to_check_gun_powder', targetId), 'interactions')
        return 
    end

    local gunPowder = lib.callback.await('p_policejob:GetGunPowder', targetId)
    if gunPowder then
        Core.ShowNotification(_source, locale('this_player_have_gun_powder'), 'info')
    else
        Core.ShowNotification(_source, locale('this_player_dont_have_gun_powder'), 'info')
    end
    SendDiscordLog(_source, locale('player_checked_gun_powder', targetId, (gunPowder and '+' or '-')), 'interactions')
end)

RegisterNetEvent('p_policejob:interactions:OpenCuffs', function(data)
    local _source = source
    if not utils.canInteract(_source, data.player) then 
        SendDiscordLog(_source, locale('player_attempted_to_open_cuffs', data.player), 'interactions')
        return 
    end

    local result = lib.callback.await('p_policejob:interactions:attemptOpenCuffs', _source)
    if result then
        forceUncuff(data.player)
        Core.ShowNotification(_source, locale('you_opened_cuffs'), 'success')
        SendDiscordLog(_source, locale('player_opened_cuffs', data.player), 'interactions')
    end
end)

RegisterNetEvent('p_policejob/server_interactions/ToggleHeadBag', function(data)
    local _source = source
    if not utils.canInteract(_source, data.player) then 
        SendDiscordLog(_source, locale('player_attempted_to_toggle_head_bag', data.player), 'interactions')
        return 
    end
    local stateBag = Player(data.player).state
    if data.state and stateBag.hasHeadBag then return end
    if not data.state and not stateBag.hasHeadBag then return end
    
    if data.state then
        local itemCount = Inventory.getItemCount(_source, 'headbag')
        if not itemCount or itemCount < 1 then return end
        Inventory.removePlayerItem(_source, 'headbag', 1)
    else
        Inventory.addPlayerItem(_source, 'headbag', 1)
    end

    Player(data.player).state:set('hasHeadBag', data.state, true)
    TriggerClientEvent('p_policejob/client_interactions/ToggleHeadBag', data.player, data.state)
    SendDiscordLog(_source, locale(data.state and 'player_putted_on_head_bag' or 'player_took_off_head_bag', data.player), 'interactions')
end)

RegisterNetEvent('p_policejob/server_interactions/StartCarryPlayer', function(targetId)
    local _source = source
    if not utils.canInteract(_source, targetId) then
        SendDiscordLog(_source, locale('player_attempted_to_carry_player', targetId), 'interactions')
        return 
    end
    local stateBag = Player(targetId).state
    if stateBag.carriedBy then return end

    local result = true
    if Config.Carry.useRequest then 
        result = lib.callback.await('p_policejob/client_interactions/RequestCarryPlayer', targetId, _source)  
    end
    if result then
        stateBag:set('carriedBy', _source, true)
        Player(_source).state:set('carryingPlayer', targetId, true)
        TriggerClientEvent('p_policejob/client_interactions/StartCarryPlayer', _source, {
            isCarrying = true,
            playerId = targetId
        })
        TriggerClientEvent('p_policejob/client_interactions/StartCarryPlayer', targetId, {
            isCarrying = false,
            playerId = _source
        })
        SendDiscordLog(_source, locale('player_started_carrying_player', targetId), 'interactions')
    end
end)

RegisterNetEvent('p_policejob/server_interactions/StopCarryPlayer', function(targetId)
    local _source = source
    if not utils.canInteract(_source, targetId) then 
        SendDiscordLog(_source, locale('player_attempted_to_stop_carry_player', targetId), 'interactions')
        return 
    end
    local stateBag = Player(targetId).state
    if not stateBag.carriedBy or stateBag.carriedBy ~= _source then return end

    stateBag:set('carriedBy', nil, true)
    Player(_source).state:set('carryingPlayer', nil, true)
    TriggerClientEvent('p_policejob/client_interactions/StopCarryPlayer', _source)
    TriggerClientEvent('p_policejob/client_interactions/StopCarryPlayer', targetId)
    SendDiscordLog(_source, locale('player_stopped_carrying_player', targetId), 'interactions')
end)

RegisterNetEvent('p_policejob/server_interactions/toggleMouthTape', function(data)
    local _source = source
    if not utils.canInteract(_source, data.player) then 
        SendDiscordLog(_source, locale('player_attempted_to_toggle_mouthtape_player', data.player), 'interactions')
        return 
    end

    local stateBag = Player(data.player).state
    if (data.state and stateBag.mouthTaped) or (not data.state and not stateBag.mouthTaped) then return end

    if data.state then
        local itemCount = Inventory.getItemCount(_source, 'mouthtape')
        if not itemCount or itemCount < 1 then return end
        Inventory.removePlayerItem(_source, 'mouthtape', 1)
    else
        Inventory.addPlayerItem(_source, 'mouthtape', 1)
    end

    stateBag:set('mouthTaped', data.state, true)
end)