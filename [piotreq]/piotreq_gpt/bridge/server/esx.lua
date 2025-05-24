if Config.Framework:upper() ~= 'ESX' then return end

GPT.Editable = {}

GPT.Editable.Notify = function(playerId, text, type)
    type = type or 'inform'
    TriggerClientEvent('ox_lib:notify', playerId, {title = 'GPT', description = text, type = type})
end

GPT.Editable.GetPlayerFromId = function(playerId)
    return ESX.GetPlayerFromId(playerId)
end

GPT.Editable.GetPlayerFromIdentifier = function(identifier)
    return ESX.GetPlayerFromIdentifier(identifier)
end

GPT.Editable.GetIdentifier = function(playerId)
    return ESX.GetPlayerFromId(playerId).identifier
end

GPT.Editable.GetPlayerMoney = function(xPlayer, account)
    return xPlayer.getAccount(account).money
end

GPT.Editable.RemovePlayerMoney = function(xPlayer, account, amount)
    xPlayer.removeAccountMoney(account, amount)
end

GPT.Editable.BuyConfiscatedVehicle = function(vin)
    local requests = {
        'UPDATE owned_vehicles SET stored = 1 WHERE vin = @vin',
        'DELETE FROM gpt_confiscates WHERE vin = @vin'
    }
    MySQL.transaction(requests, {['@vin'] = vin})
end

GPT.Editable.GetPlayerJob = function(xPlayer)
    local playerJob = xPlayer.job
    return {
        name = playerJob.name,
        grade = tonumber(playerJob.grade),
        label = playerJob.label,
        grade_label = playerJob.grade_label
    }
end

GPT.Editable.GetPlayerName = function(xPlayer, separate)
    local xPlayer = type(xPlayer) == 'number' and GPT.Editable.GetPlayerFromId(xPlayer) or xPlayer
    if separate then
        return xPlayer.get('firstName'), xPlayer.get('lastName')
    else
        return xPlayer.get('firstName')..' '..xPlayer.get('lastName')
    end
end

GPT.Editable.GetMostActiveWorkers = function(jobName)
    return MySQL.query.await('SELECT * FROM users WHERE job = ? ORDER BY dutyTime DESC LIMIT 3', {jobName})
end

GPT.Editable.GetLastWantedPlayers = function()
    return MySQL.query.await('SELECT wanted.*, users.firstname, users.lastname FROM gpt_citizens_wanted wanted LEFT JOIN users ON wanted.player = users.identifier ORDER BY id DESC LIMIT 3')
end

GPT.Editable.GetLastWantedVehicles = function()
    return MySQL.query.await('SELECT wanted.*, owned_vehicles.plate FROM gpt_vehicles_wanted wanted LEFT JOIN owned_vehicles ON wanted.vin = owned_vehicles.vin ORDER BY id DESC LIMIT 3')
end

GPT.Editable.GetSortedCitizens = function(value)
    if Config.UseEvidence then
        local columns = Config.EvidenceColumns
        local citizens = MySQL.query.await('SELECT users.*, gpt_citizens_wanted.id AS wanted FROM users LEFT JOIN gpt_citizens_wanted ON users.identifier = gpt_citizens_wanted.player WHERE (LOWER(CONCAT(users.firstname," ",users.lastname)) LIKE "%'..value..'%") OR users.'..Config.SSN..' LIKE "%'..value..'%" OR users.'..columns['blood']..' LIKE "%'..value..'%" OR users.'..columns['fingerprint']..' LIKE "%'..value..'%"')
        return citizens
    else
        local citizens = MySQL.query.await('SELECT users.*, gpt_citizens_wanted.id AS wanted FROM users LEFT JOIN gpt_citizens_wanted ON users.identifier = gpt_citizens_wanted.player WHERE (LOWER(CONCAT(users.firstname," ",users.lastname)) LIKE "%'..value..'%") OR users.'..Config.SSN..' LIKE "%'..value..'%"')
        return citizens
    end
end

GPT.Editable.GetCitizenVehicles = function(identifier)
    local loadVehicles = 'SELECT owned_vehicles.*, users.firstname, users.lastname, EXISTS (SELECT 1 FROM gpt_vehicles_wanted WHERE gpt_vehicles_wanted.vin = owned_vehicles.vin) AS wanted FROM owned_vehicles JOIN users ON owned_vehicles.owner = users.identifier WHERE owner = ?'
    if Config.SecondOwner then
        loadVehicles = loadVehicles..' OR '..Config.SecondOwner..' = ?'
    end
    return MySQL.query.await(loadVehicles, {identifier})
end

GPT.Editable.GetJobName = function(jobName)
    return jobName
end

GPT.Editable.GetSearchedCitizen = function(identifier)
    local citizen = MySQL.single.await('SELECT * FROM users WHERE identifier = ? LIMIT 1', {identifier})
    if citizen then
        return {
            firstname = citizen.firstname,
            lastname = citizen.lastname,
            id = citizen[Config.SSN],
            dateofbirth = citizen.dateofbirth,
            job = citizen.job,
            identifier = citizen.identifier,
            gptPhoto = citizen.gptPhoto,
            blood = citizen[Config.EvidenceColumns['blood']],
            fingerprint = citizen[Config.EvidenceColumns['fingerprint']]
        }
    end

    return nil
end

GPT.Editable.GetCitizenLicenses = function(identifier)
    return MySQL.query.await('SELECT * FROM user_licenses WHERE owner = ?', {identifier})
end

GPT.Editable.GetCitizenNotes = function(identifier)
   return MySQL.query.await('SELECT gpt_citizens_notes.*, users.firstname, users.lastname FROM gpt_citizens_notes LEFT JOIN users ON gpt_citizens_notes.officer = users.identifier WHERE gpt_citizens_notes.player = ? ORDER BY id DESC', {identifier})
end

GPT.Editable.GetCitizenWanted = function(identifier)
    return MySQL.query.await('SELECT gpt_citizens_wanted.*, users.firstname, users.lastname FROM gpt_citizens_wanted LEFT JOIN users ON gpt_citizens_wanted.officer = users.identifier WHERE gpt_citizens_wanted.player = ? ORDER BY id DESC', {identifier})
end

GPT.Editable.GetCitizenCases = function(identifier)
    return MySQL.query.await('SELECT * FROM gpt_cases WHERE citizens LIKE "%'..identifier..'%" ORDER BY id DESC')
end

GPT.Editable.GetCaseVehicles = function(value)
    return MySQL.query.await('SELECT * FROM owned_vehicles WHERE vin LIKE "%'..value..'%" OR plate LIKE "%'..value..'%"')
end

GPT.Editable.GetSearchedVehicles = function(value)
    return MySQL.query.await('SELECT ov.*, u1.firstname AS ofname, u1.lastname AS olname, u2.firstname AS cofname, u2.lastname AS colname, EXISTS (SELECT 1 FROM gpt_vehicles_wanted WHERE gpt_vehicles_wanted.vin = ov.vin) AS wanted FROM owned_vehicles ov LEFT JOIN users u1 ON ov.owner = u1.identifier LEFT JOIN users u2 ON ov.co_owner = u2.identifier WHERE ov.plate LIKE "%'..value..'%" OR ov.vin LIKE "%'..value..'%"')
end

GPT.Editable.GetFullVehicleInfo = function(vin)
    local vehicleInfo = MySQL.single.await('SELECT ov.*, u1.firstname AS ofname, u1.lastname AS olname, u2.firstname AS cofname, u2.lastname AS colname FROM owned_vehicles ov LEFT JOIN users u1 ON ov.owner = u1.identifier LEFT JOIN users u2 ON ov.co_owner = u2.identifier WHERE ov.vin = ?', {vin})
    vehicleInfo.notes = MySQL.query.await('SELECT gnotes.*, users.firstname, users.lastname FROM gpt_vehicles_notes gnotes LEFT JOIN users ON gnotes.officer = users.identifier WHERE gnotes.vin = ?', {vin})
    vehicleInfo.wanted = MySQL.query.await('SELECT gwanted.*, users.firstname, users.lastname FROM gpt_vehicles_wanted gwanted LEFT JOIN users ON gwanted.officer = users.identifier WHERE gwanted.vin = ?', {vin})
    return vehicleInfo
end

GPT.Editable.GetVehicleData = function(vin)
    local vehicleWanted = MySQL.query.await('SELECT gwanted.*, users.firstname, users.lastname FROM gpt_vehicles_wanted gwanted LEFT JOIN users ON gwanted.officer = users.identifier WHERE gwanted.vin = ?', {vin})
    local vehicleNotes = MySQL.query.await('SELECT gnotes.*, users.firstname, users.lastname FROM gpt_vehicles_notes gnotes LEFT JOIN users ON gnotes.officer = users.identifier WHERE gnotes.vin = ?', {vin})
    return vehicleWanted, vehicleNotes
end

GPT.Editable.GetWeapons = function(value)
    local weapons = MySQL.query.await('SELECT gpt_weapons.*, users.firstname, users.lastname FROM gpt_weapons LEFT JOIN users ON gpt_weapons.owner = users.identifier WHERE gpt_weapons.serial LIKE "%'..value..'%"')
    return weapons
end

GPT.Editable.GetSearchedWorkers = function(value)
    local result = MySQL.query.await('SELECT * FROM users WHERE firstname LIKE "%'..value..'%" OR lastname LIKE "%'..value..'%" OR '..Config.SSN..' LIKE "%'..value..'%"')
    local sortedWorkers = {}
    for i = 1, #result, 1 do
        sortedWorkers[i] = {
            identifier = result[i].identifier,
            ssn = result[i][Config.SSN],
            firstname = result[i].firstname,
            lastname = result[i].lastname,
            job = GPT.Jobs[result[i].job].label
        }
    end

    return sortedWorkers
end

GPT.Editable.GetFullWorkerInfo = function(identifier)
    local workerData = {}
    local workerInfo = MySQL.single.await('SELECT * FROM users WHERE identifier = ? LIMIT 1', {identifier})
    if workerInfo then
        local xWorker = ESX.GetPlayerFromIdentifier(identifier)
        workerData.identifier = identifier
        workerData.name = workerInfo.firstname..' '..workerInfo.lastname
        workerData.radio = xWorker and GPT.Editable.FetchPlayerRadio(xWorker.source) or locale('no_data')
        workerData.status = xWorker and exports['piotreq_jobcore']:GetPlayerDutyData(identifier).status or 0
        workerData.dutyTime = workerInfo.dutyTime
        workerData.job = GPT.Jobs[workerInfo.job] and GPT.Jobs[workerInfo.job].label or locale('no_data')
        workerData.badge = GPT.Editable.FetchPlayerBadge(identifier)
        workerData.grade_label = GPT.Jobs[workerInfo.job].grades[tostring(workerInfo.job_grade)].label
        workerData.ssn = workerInfo[Config.SSN]
        workerData.lastActive = workerInfo.lastActive or locale('no_data')
        workerData.jobJoined = workerInfo.jobJoined or locale('no_data')
        workerData.photo = workerInfo.gptOfficerPhoto
    
        local lastJudgment = GPT.Editable.GetLastJudgment(identifier)
    
        if lastJudgment and lastJudgment.id then
            workerData.lastJudgment = os.date('%H:%M %d/%m/%Y', lastJudgment.time)
        else
            workerData.lastJudgment = locale('no_data')
        end
    
        local officerVehicle = MySQL.single.await('SELECT * FROM owned_vehicles WHERE job = ? AND owner = ?', {
            workerInfo.job, identifier
        })
    
        if officerVehicle then
            workerData.vehicle = {model = json.decode(officerVehicle.vehicle).model, plate = officerVehicle.plate}
        else
            workerData.vehicle = locale('no_data')
        end
    
        local notes = MySQL.query.await('SELECT notes.*, users.firstname, users.lastname FROM gpt_workers_notes notes LEFT JOIN users ON notes.creator = users.identifier WHERE notes.officer = ? ORDER by id DESC', {identifier})
        workerData.notes = notes
        workerData.licenses = MySQL.query.await('SELECT * FROM gpt_licenses WHERE owner = ?', {identifier})
        return workerData
    end

    return nil
end

GPT.Editable.GetCaseData = function(id)
    local case = MySQL.single.await('SELECT gpt_cases.*, users.firstname, users.lastname FROM gpt_cases LEFT JOIN users ON gpt_cases.creator = users.identifier WHERE gpt_cases.id = ? LIMIT 1', {id})
    local officers = json.decode(case.officers)
    for k, v in pairs(officers) do
        local xOfficer = ESX.GetPlayerFromIdentifier(v.identifier)
        if xOfficer then
            v.job = xOfficer.getJob().label
        else
            local row = MySQL.single.await('SELECT job FROM users WHERE identifier = ? LIMIT 1', {v.identifier})
            if row then
                v.job = GPT.Jobs[row.job].label
            end
        end
    end

    local vehicles = json.decode(case.vehicles)
    for k, v in pairs(vehicles) do
        local vehicleData = MySQL.single.await('SELECT vehicle FROM owned_vehicles WHERE vin = ? LIMIT 1', {v.vin})
        if vehicleData then
            v.vehicle = vehicleData.vehicle
        end
    end
    local sortedCase = {
        title = case.title,
        id = case.id,
        text = case.description,
        creatorName = case.firstname..' '..case.lastname,
        creator = case.creator,
        status = case.status,
        citizens = json.decode(case.citizens),
        vehicles = vehicles,
        officers = officers,
        photos = json.decode(case.attachments),
        create_date = os.date('%H:%M %d/%m/%Y', case.create_time),
        edit_date = os.date('%H:%M %d/%m/%Y', case.edit_date),
    }
    return sortedCase
end

GPT.Editable.UpdateDutyTime = function(dutyTime, identifier)
    MySQL.update('UPDATE users SET dutyTime = ? WHERE identifier = ?', {dutyTime, identifier})
end

GPT.Editable.GetCitizenLicense = function(id)
    local row = MySQL.single.await('SELECT * FROM user_licenses WHERE id = ?', {id})
    return row
end

GPT.Editable.AddCitizenLicense = function(license, name, player)
    local id = MySQL.insert.await('INSERT INTO user_licenses (type, name, owner) VALUES(?, ?, ?)', {
        license, name, player
    })
    return id
end

GPT.Editable.DeleteCitizenLicense = function(id)
    MySQL.update('DELETE FROM user_licenses WHERE id = ?', {id})
end

GPT.Editable.SetCitizenPhoto = function(photo, player)
    MySQL.update('UPDATE users SET gptPhoto = ? WHERE identifier = ?', {photo, player})
end

GPT.Editable.SetOfficerPhoto = function(photo, player)
    MySQL.update('UPDATE users SET gptOfficerPhoto = ? WHERE identifier = ?', {photo, player})
end

GPT.Editable.ConfiscateVehicle = function(vin)
    local affectedRows = MySQL.update.await('UPDATE owned_vehicles SET stored = 3 WHERE vin = ? AND stored != 3', {vin})
    if affectedRows > 0 then
        local row = MySQL.single.await('SELECT vehicleid FROM owned_vehicles WHERE vin = ? LIMIT 1', {vin})
        if row and row.vehicleid then
            local entity = NetworkGetEntityFromNetworkId(row.vehicleid)
            if entity ~= 0 and DoesEntityExist(entity) then
                DeleteEntity(entity)
            end
        end

        return true
    end

    return false
end

GPT.Editable.GetPlayerFromSSN = function(ssn, job)
    local row = MySQL.single.await('SELECT identifier FROM users WHERE '..Config.SSN..' = ? AND job = ? LIMIT 1', {ssn, job})
    return row and row.identifier or nil
end

GPT.Editable.FetchJobs = function()
    local Jobs = {}
	local jobs = MySQL.query.await('SELECT * FROM jobs')

	for _, v in ipairs(jobs) do
		Jobs[v.name] = v
		Jobs[v.name].grades = {}
	end

	local jobGrades = MySQL.query.await('SELECT * FROM job_grades')

	for _, v in ipairs(jobGrades) do
		if Jobs[v.job_name] then
			Jobs[v.job_name].grades[tostring(v.grade)] = v
		else
			print(('[^3WARNING^7] Ignoring job grades for ^5"%s"^0 due to missing job'):format(v.job_name))
		end
	end

	for _, v in pairs(Jobs) do
		if ESX.Table.SizeOf(v.grades) == 0 then
			Jobs[v.name] = nil
			print(('[^3WARNING^7] Ignoring job ^5"%s"^0 due to no job grades found'):format(v.name))
		end
	end

    return Jobs
end

GPT.Editable.SetPlayerJob = function(identifier, name, grade)
    local promise = promise.new()
    local xPlayer = ESX.GetPlayerFromIdentifier(identifier)
    if xPlayer then
        xPlayer.setJob(name, grade)
    end
    local affectedRows = MySQL.update.await('UPDATE users SET job = ?, job_grade = ?, jobJoined = ? WHERE identifier = ?', {
        name, grade, os.date('%H:%M %d/%m/%Y', os.time()), identifier
    })
    if affectedRows > 0 then
        -- multi job export if you use one
        promise:resolve(true)
    else
        promise:resolve(false)
    end

    local await = Citizen.Await(promise)
    return await
end

GPT.Editable.FetchPlayerBadge = function(identifier)
    local row = MySQL.single.await('SELECT badge FROM users WHERE identifier = ? LIMIT 1', {identifier})
    return row and row.badge or locale('no_data')
end

GPT.Editable.ChangePlayerBadge = function(identifier, badge)
    local promise = promise.new()
    local affectedRows = MySQL.update.await('UPDATE users SET badge = ? WHERE identifier = ?', {
        badge, identifier
    })
    if affectedRows > 0 then
        promise:resolve(true)
    else
        promise:resolve(false)
    end

    local await = Citizen.Await(promise)
    return await
end

GPT.Editable.FetchPlayerRadio = function(player)
    local channel = Player(player).state.radioChannel
    if channel and channel ~= 0 then
        return channel
    end

    return locale('no_data')
end

GPT.Editable.FetchEmployees = function(jobName)
    local employees = MySQL.query.await('SELECT * FROM users WHERE job = ?', {jobName})
    local sortedEmployees = {}
    for i = 1, #employees, 1 do
        local employee = employees[i]
        local xEmployee = ESX.GetPlayerFromIdentifier(employee.identifier)
        local playerRadio = '-'
        if xEmployee then
            local radioChannel = GPT.Editable.FetchPlayerRadio(xEmployee.source)
            if radioChannel and radioChannel ~= 0 and type(radioChannel) ~= 'string' then
                if Config.RadioChannels[tostring(radioChannel)] then
                    playerRadio = '#'..radioChannel..' - '..Config.RadioChannels[tostring(radioChannel)]
                else
                    playerRadio = '#'..radioChannel
                end
            end
        end
        local dutyData = exports['piotreq_jobcore']:GetPlayerDutyData(employee.identifier)
        sortedEmployees[#sortedEmployees + 1] = {
            identifier = employee.identifier,
            name = employee.firstname..' '..employee.lastname,
            grade_label = GPT.Jobs[jobName].grades[tostring(employee.job_grade)] and GPT.Jobs[jobName].grades[tostring(employee.job_grade)].label or locale('no_data'),
            grade = tonumber(employee.job_grade),
            badge = GPT.Editable.FetchPlayerBadge(employee.identifier),
            status = dutyData and dutyData.status or 0,
            radio = playerRadio,
            dutyTime = employee.dutyTime or 0,
            lastActive = employee.lastActive or locale('no_data')
        }
    end
    table.sort(sortedEmployees, function(a, b) 
        local order = {[1] = 1, [2] = 2, [0] = 3}
        return order[a.status] < order[b.status]
    end)
    table.sort(sortedEmployees, function(a, b) return b.grade < a.grade end)
    return sortedEmployees
end

GPT.Editable.FetchAnnouncements = function(jobName)
    local announcements = MySQL.query.await('SELECT ann.*, users.firstname, users.lastname FROM gpt_announcements ann LEFT JOIN users ON ann.creator = users.identifier WHERE ann.job = ? ORDER BY important DESC', {jobName})
    return announcements
end

GPT.Editable.FetchCases = function()
    local cases = MySQL.query.await('SELECT gpt_cases.*, users.firstname, users.lastname FROM gpt_cases LEFT JOIN users ON gpt_cases.creator = users.identifier')
    local sortedCases = {}
    for i = 1, #cases, 1 do
        local officers = json.decode(cases[i].officers)
        for k, v in pairs(officers) do
            local xOfficer = ESX.GetPlayerFromIdentifier(v.identifier)
            if xOfficer then
                v.job = xOfficer.getJob().label
            else
                local row = MySQL.single.await('SELECT job FROM users WHERE identifier = ? LIMIT 1', {v.identifier})
                if row then
                    v.job = GPT.Jobs[row.job].label
                end
            end
        end

        local vehicles = json.decode(cases[i].vehicles)
        for k, v in pairs(vehicles) do
            local vehicleData = MySQL.single.await('SELECT vehicle FROM owned_vehicles WHERE vin = ? LIMIT 1', {v.vin})
            if vehicleData then
                v.vehicle = vehicleData.vehicle
            end
        end

        sortedCases[#sortedCases + 1] = {
            title = cases[i].title,
            id = cases[i].id,
            text = cases[i].description,
            creatorName = cases[i].firstname..' '..cases[i].lastname,
            creator = cases[i].creator,
            status = cases[i].status,
            citizens = json.decode(cases[i].citizens),
            vehicles = vehicles,
            officers = officers,
            photos = json.decode(cases[i].attachments),
            create_date = os.date('%H:%M %d/%m/%Y', cases[i].create_time),
            edit_date = os.date('%H:%M %d/%m/%Y', cases[i].edit_date),
        }
    end
    return sortedCases
end

GPT.Editable.OnAnswer = function(player, text)
    GPT.Editable.Notify(player, text, 'inform')
end

GPT.Editable.GetConfiscatedVehicles = function(identifier)
    local vehicles = MySQL.query.await('SELECT gpt_confiscates.*, owned_vehicles.*, gpt_confiscates.price FROM gpt_confiscates LEFT JOIN owned_vehicles ON gpt_confiscates.vin = owned_vehicles.vin WHERE owned_vehicles.owner = ?', {identifier})
    return vehicles
end

GPT.Editable.GeneratePlate = function()
    local newPlate = ''
    local chars = 'ABCDEFGIHJKLMNOPRSTXWYUZ1234567890'
    repeat
        for i = 1, 8 do
            local random = math.random(1, chars:len())
            newPlate = newPlate..chars:sub(random, random)
        end
    until(not MySQL.single.await('SELECT plate FROM owned_vehicles WHERE plate = ?', {newPlate}))
    return newPlate
end

GPT.Editable.GenerateVIN = function()
    if GetResourceState('piotreq_phone') ~= 'missing' then
        return exports['piotreq_phone']:GenerateVIN()
    else
        local newPlate = ''
        local chars = 'ABCDEFGIHJKLMNOPRSTXWYUZ1234567890'
        repeat
            for i = 1, 12 do
                local random = math.random(1, chars:len())
                newPlate = newPlate..chars:sub(random, random)
            end
        until(not MySQL.single.await('SELECT vin FROM owned_vehicles WHERE vin = ?', {newPlate}))
        return newPlate
    end
end

exports('GenerateVIN', GPT.Editable.GenerateVIN)

GPT.Editable.Pay = function(data)
    local promise = promise.new()
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_'..data.job, function(account)
        if account then
            if account.money >= data.price then
                account.removeMoney(data.price)
                promise:resolve(true)
            else
                promise:resolve(false)
            end
        else
            showError(('Cant find account %s'):format('society_'..data.job))
            promise:resolve(false)
        end
    end)
    local await = Citizen.Await(promise)
    return await
end

GPT.Editable.GetGarage = function(jobName)
    local garage = MySQL.query.await('SELECT garage.*, users.firstname, users.lastname FROM owned_vehicles garage LEFT JOIN users ON garage.owner = users.identifier WHERE garage.job = ? ORDER BY id DESC', {jobName})
    return garage
end

GPT.Editable.BoughtVehicle = function(data)
    local promise = promise.new()
    local id = MySQL.insert.await('INSERT INTO owned_vehicles (plate, vehicle, stored, type, job, vin) VALUES (?, ?, ?, ?, ?, ?)', {
        data.plate, json.encode({plate = data.plate, model = joaat(data.model)}), 1, data.type, data.job, data.vin
    })
    if id then
        promise:resolve(true)
    else
        promise:resolve(false)
    end

    local await = Citizen.Await(promise)
    return await
end

GPT.Editable.ImpoundVehicles = function(data)
    local promise = promise.new()
    local vehicles = MySQL.query.await('SELECT * FROM owned_vehicles WHERE job = ? AND stored = 0', {data.job})
    if #vehicles > 0 then
        local toPay = (500 * #vehicles)
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_'..data.job, function(account)
            if account then
                if account.money >= toPay then
                    account.removeMoney(toPay)
                    for i = 1, #vehicles, 1 do
                        local veh = vehicles[i]
                        if veh.vehicleid then
                            local entity = NetworkGetEntityFromNetworkId(veh.vehicleid)
                            if entity and entity ~= 0 and DoesEntityExist(entity) then
                                DeleteEntity(entity)
                            end
                        end
                    end
                    local affectedRows = MySQL.update.await('UPDATE owned_vehicles SET stored = 1 WHERE job = ?', {data.job})
                    promise:resolve(true)
                else
                    promise:resolve(locale('society_not_enough_money'))
                end
            else
                showError(('Cant find account %s'):format('society_'..data.job))
                promise:resolve(locale('cant_find_society'))
            end
        end)
    else
        promise:resolve(locale('no_vehicles_to_impound'))
    end
    local await = Citizen.Await(promise)
    return await
end

GPT.Editable.SendJail = function(player, data)
    local promise = promise.new()
    local _source = player
    local totalFine, totalJail, displayReason = tonumber(data.fine), tonumber(data.jail), ''
    local offenses = data.offenses
    local citizens = data.citizens
    for k, v in pairs(offenses) do
        if displayReason == '' then
            displayReason = v.count..'x '..v.label
        else
            displayReason = displayReason..', '..v.count..'x '..v.label
        end
    end
    local jailDone = exports['p_policejob']:JailPlayers(_source, {
        players = citizens,
        jail = totalJail,
        fine = totalFine,
        reason = displayReason,
        offenses = offenses
    })
    promise:resolve(jobDone)

    local await = Citizen.Await(promise)
    return await
end

GPT.Editable.FetchCitizenJudgments = function(identifier)
    local judgments = MySQL.query.await('SELECT judgements.*, users.firstname, users.lastname FROM judgements LEFT JOIN users ON judgements.officer = users.identifier WHERE judgements.player = ? ORDER BY id ASC', {identifier})
    return judgments
end

GPT.Editable.GetLastJudgment = function(identifier) -- need to return id, and time
    local lastJudgment = MySQL.single.await('SELECT * FROM judgements WHERE officer = ? ORDER BY id DESC LIMIT 1', {
        identifier
    })
    return lastJudgment
end

if GetResourceState('ox_inventory') ~= 'missing' then
    exports['ox_inventory']:registerHook('buyItem', function(payload)
        local _source = payload.source
        local xPlayer = ESX.GetPlayerFromId(_source)
        exports['piotreq_gpt']:RegisterWeapon({
            model = ESX.GetWeaponLabel(payload.itemName),
            owner = xPlayer.identifier,
            serial = payload.metadata.serial
        })
    end, {
        itemFilter = {
            WEAPON_PISTOL = true
        },
    })
end

GPT.Editable.ChangeDriver = function(data)
    local promise = promise.new()
    local affectedRows = nil
    if data.identifier then
        affectedRows = MySQL.update.await('UPDATE owned_vehicles SET owner = ? WHERE vin = ?', {
            data.identifier, data.vin
        })
    else
        affectedRows = MySQL.update.await('UPDATE owned_vehicles SET owner = NULL WHERE vin = ?', {
            data.vin
        })
    end
    if affectedRows > 0 then
        promise:resolve(true)
    else
        promise:resolve(false)
    end

    local await = Citizen.Await(promise)
    return await
end

GPT.Editable.RemoveEvidence = function(playerId, itemName, itemMetadata)
    if GetResourceState('ox_inventory') == 'started' then
        exports['ox_inventory']:RemoveItem(playerId, itemName, 1, itemMetadata)
    elseif GetResourceState('qb-inventory') == 'started' then
        exports['qb-inventory']:RemoveItem(playerId, itemName, 1, nil, itemMetadata)
    elseif GetResourceState('ps-inventory') == 'started' then
        exports['ps-inventory']:RemoveItem(playerId, itemName, 1, nil, itemMetadata)
    elseif GetResourceState('qs-inventory') == 'started' then
        exports['qs-inventory']:RemoveItem(playerId, itemName, 1, nil, itemMetadata)
    elseif GetResourceState('tgiann-inventory') == 'started' then
        exports['tgiann-inventory']:RemoveItem(playerId, itemName, 1, nil, itemMetadata)
    elseif GetResourceState('codem-inventory') == 'started' then
        exports['codem-inventory']:RemoveItem(playerId, itemName, 1, nil, metadata)
    end
end

RegisterNetEvent('esx:playerDropped', function(player)
    local xPlayer = ESX.GetPlayerFromId(player)
    if not xPlayer then return end

    MySQL.update('UPDATE users SET lastActive = ? WHERE identifier = ?', {os.date('%H:%M %d/%m/%Y', os.time()), xPlayer.identifier})
end)

RegisterNetEvent('piotreq_gpt:ShotAlert', function()
    local _source = source
    exports['piotreq_gpt']:SendAlert(_source, {
        title = locale('shooting_alert'),
        code = '10-90',
        canAnswer = false,
        maxOfficers = 5,
        time = 5,
        blip = {
            scale = 1.1,
            sprite = 280,
            color = 1,
            alpha = 200,
            name = locale('report')
        },
        type = 'risk',
        info = {
            {icon = 'fa-solid fa-road', isStreet = true},
        },
        notifyTime = 10000,
    })
end)

local discordWebhooks = {
    ['patrol:create'] = 'WEBHOOK HERE',
    ['patrol:toggle'] = 'WEBHOOK HERE',
    ['patrol:leave'] = 'WEBHOOK HERE',
    ['patrol:joined'] = 'WEBHOOK HERE',
    ['patrol:kick'] = 'WEBHOOK HERE',

    ['cases:create'] = 'WEBHOOK HERE',
    ['cases:edit'] = 'WEBHOOK HERE',

    ['announcements:create'] = 'WEBHOOK HERE',
    ['announcements:delete'] = 'WEBHOOK HERE',

    ['workers:addnote'] = 'WEBHOOK HERE',
    ['workers:deletenote'] = 'WEBHOOK HERE',
    ['workers:changebadge'] = 'WEBHOOK HERE',
    ['workers:changegrade'] = 'WEBHOOK HERE',
    ['workers:fire'] = 'WEBHOOK HERE',
    ['workers:resetTime'] = 'WEBHOOK HERE',
    ['workers:resetTimers'] = 'WEBHOOK HERE',
    ['workers:hire'] = 'WEBHOOK HERE',
    ['workers:setPhoto'] = 'WEBHOOK HERE',
    ['workers:addLicense'] = 'WEBHOOK HERE',
    ['workers:deleteLicense'] = 'WEBHOOK HERE',

    ['judgement'] = 'WEBHOOK HERE',

    ['actions:join'] = 'WEBHOOK HERE',
    ['actions:leave'] = 'WEBHOOK HERE',
    ['actions:update'] = 'WEBHOOK HERE',
    ['actions:changeVisor'] = 'WEBHOOK HERE',

    ['citizens:addNote'] = 'WEBHOOK HERE',
    ['citizens:deleteNote'] = 'WEBHOOK HERE',
    ['citizens:addWanted'] = 'WEBHOOK HERE',
    ['citizens:deleteWanted'] = 'WEBHOOK HERE',
    ['citizens:addLicense'] = 'WEBHOOK HERE',
    ['citizens:deleteLicense'] = 'WEBHOOK HERE',
    ['citizens:setPhoto'] = 'WEBHOOK HERE',

    ['vehicles:addNote'] = 'WEBHOOK HERE',
    ['vehicles:deleteNote'] = 'WEBHOOK HERE',
    ['vehicles:addWanted'] = 'WEBHOOK HERE',
    ['vehicles:deleteWanted'] = 'WEBHOOK HERE',
    ['vehicles:confiscate'] = 'WEBHOOK HERE',
    ['vehicles:getConfiscatedVehicle'] = 'WEBHOOK HERE',

    ['garage:buyVehicle'] = 'WEBHOOK HERE',
    ['garage:editDriver'] = 'WEBHOOK HERE',
    ['garage:impoundVehicles'] = 'WEBHOOK HERE',

    ['weapons:registerWeapon'] = 'WEBHOOK HERE',
    ['evidences:newEvidence'] = 'WEBHOOK HERE',
}
local discordMessages = {
    ['patrol:create'] = 'Player created new Patrol\nPlayer ID: %s\nSteam HEX: %s\nDiscord ID: %s\nSteam Name: %s',
    ['patrol:toggle'] = 'Player toggled Patrol\nPlayer ID: %s\nSteam HEX: %s\nDiscord ID: %s\nSteam Name: %s',
    ['patrol:leave'] = 'Player left Patrol\nPlayer ID: %s\nSteam HEX: %s\nDiscord ID: %s\nSteam Name: %s',
    ['patrol:joined'] = 'Player joined Patrol\nPlayer ID: %s\nSteam HEX: %s\nDiscord ID: %s\nSteam Name: %s',
    ['patrol:kick'] = 'Player kicked Player from Patrol\nPlayer ID: %s\nSteam HEX: %s\nDiscord ID: %s\nSteam Name: %s',
    ['cases:create'] = 'Player created new case\nPlayer ID: %s\nSteam HEX: %s\nDiscord ID: %s\nSteam Name: %s',
    ['cases:edit'] = 'Player edited case\nPlayer ID: %s\nSteam HEX: %s\nDiscord ID: %s\nSteam Name: %s',
    ['announcements:create'] = 'Player created announcement\nPlayer ID: %s\nSteam HEX: %s\nDiscord ID: %s\nSteam Name: %s',
    ['announcements:delete'] = 'Player deleted announcement\nPlayer ID: %s\nSteam HEX: %s\nDiscord ID: %s\nSteam Name: %s',
}

GPT.Editable.DiscordLog = function(playerId, data, logType)
    Citizen.CreateThread(function()
        local steamName, steamHex, discordId = GetPlayerName(playerId) or 'Unknown', 'Unknown', 'Unknown'
        local identifiers = GetPlayerIdentifiers(playerId)
        for i = 1, #identifiers do
            if string.find(identifiers[i], 'steam:') then
                steamHex = identifiers[i]
            elseif string.find(identifiers[i], 'discord:') then
                discordId = string.gsub(identifiers[i], 'discord:', '')
            end
        end
    
        local message = discordMessages[logType] and discordMessages[logType]:format(playerId, steamHex, discordId, steamName) or nil
        if message then
            local webhook = discordWebhooks[logType]
            local embedData = { {
                ['title'] = 'Police MDT',
                ['color'] = 14423100,
                ['footer'] = {
                    ['text'] = "Police MDT | pScripts | " .. os.date(),
                    ['icon_url'] = "https://r2.fivemanage.com/xlufCGKYLtGfU8IBmjOL9/LOGO3.png"
                },
                ['description'] = message,
                ['author'] = {
                    ['name'] = "pScripts",
                    ['icon_url'] = "https://r2.fivemanage.com/xlufCGKYLtGfU8IBmjOL9/LOGO3.png"
                }
            } }
            PerformHttpRequest(webhook, nil, 'POST', json.encode({
                username = 'pScripts',
                embeds = embedData
            }), {
                ['Content-Type'] = 'application/json'
            })
        end
    end)
end