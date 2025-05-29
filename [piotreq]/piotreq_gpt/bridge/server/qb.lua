if Config.Framework:upper() ~= 'QB' then return end

local QBCore = exports['qb-core']:GetCoreObject()

GPT.Editable = {}

GPT.Editable.Notify = function(playerId, text, type)
    type = type or 'inform'
    TriggerClientEvent('ox_lib:notify', playerId, {title = 'MDT', description = text, type = type})
end

GPT.Editable.GetPlayerFromId = function(playerId)
    local xPlayer = QBCore.Functions.GetPlayer(playerId)
    if not xPlayer then return end

    xPlayer.identifier = xPlayer.PlayerData.citizenid
    xPlayer.source = xPlayer.PlayerData.source
    return xPlayer
end

GPT.Editable.GetPlayerFromIdentifier = function(identifier)
    local xPlayer = QBCore.Functions.GetPlayerByCitizenId(identifier)
    if not xPlayer then return end

    xPlayer.identifier = xPlayer.PlayerData.citizenid
    xPlayer.source = xPlayer.PlayerData.source
    return xPlayer
end

GPT.Editable.GetIdentifier = function(playerId)
    local xPlayer = QBCore.Functions.GetPlayer(playerId)
    if not xPlayer then return end

    return xPlayer.PlayerData.citizenid
end

GPT.Editable.GetPlayerMoney = function(xPlayer, account)
    account = account == 'money' and 'cash' or account
    return xPlayer.Functions.GetMoney(account)
end

GPT.Editable.RemovePlayerMoney = function(xPlayer, account, amount)
    account = account == 'money' and 'cash' or account
    xPlayer.Functions.RemoveMoney(account, amount)
end

GPT.Editable.BuyConfiscatedVehicle = function(vin)
    local requests = {
        'UPDATE player_vehicles SET state = 1 WHERE vin = @vin',
        'DELETE FROM gpt_confiscates WHERE vin = @vin'
    }
    MySQL.transaction(requests, {['@vin'] = vin})
end

GPT.Editable.GetPlayerJob = function(xPlayer)
    if not xPlayer then return end

    local playerJob = xPlayer.PlayerData.job
    return {
        name = playerJob.name,
        grade = tonumber(playerJob.grade.level),
        label = playerJob.label,
        grade_label = playerJob.grade.name
    }
end

GPT.Editable.GetPlayerName = function(xPlayer, separate)
    local xPlayer = type(xPlayer) == 'number' and GPT.Editable.GetPlayerFromId(xPlayer) or xPlayer
    if separate then
        return xPlayer.PlayerData.charinfo.firstname, xPlayer.PlayerData.charinfo.lastname
    else
        return xPlayer.PlayerData.charinfo.firstname..' '..xPlayer.PlayerData.charinfo.lastname
    end
end

GPT.Editable.GetMostActiveWorkers = function(jobName)
    local result = MySQL.query.await('SELECT * FROM players WHERE JSON_UNQUOTE(JSON_EXTRACT(job, "$.name")) = ? ORDER BY dutyTime DESC LIMIT 3', {jobName})
    for i = 1, #result, 1 do
        local data = result[i]
        local charinfo = json.decode(data.charinfo)
        result[i].firstname = charinfo.firstname
        result[i].lastname = charinfo.lastname
        result[i].identifier = data.citizenid
    end
    return result
end

GPT.Editable.GetLastWantedPlayers = function()
    return MySQL.query.await('SELECT wanted.*, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.firstname")) AS firstname, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.lastname")) AS lastname FROM gpt_citizens_wanted wanted LEFT JOIN players ON wanted.player = players.citizenid ORDER BY wanted.id DESC LIMIT 3')
end

GPT.Editable.GetLastWantedVehicles = function()
    return MySQL.query.await('SELECT wanted.*, player_vehicles.plate FROM gpt_vehicles_wanted wanted LEFT JOIN player_vehicles ON wanted.vin = player_vehicles.vin ORDER BY id DESC LIMIT 3')
end

GPT.Editable.GetSortedCitizens = function(value)
    if Config.UseEvidence then
        local columns = Config.EvidenceColumns
        local citizens = MySQL.query.await('SELECT players.*, gpt_citizens_wanted.id AS wanted FROM players LEFT JOIN gpt_citizens_wanted ON players.citizenid = gpt_citizens_wanted.player WHERE (LOWER(CONCAT(JSON_EXTRACT(players.charinfo, "$.firstname")," ",JSON_EXTRACT(players.charinfo, "$.lastname"))) LIKE "%'..value..'%") OR players.'..Config.SSN..' LIKE "%'..value..'%" OR players.'..columns['blood']..' LIKE "%'..value..'%" OR players.'..columns['fingerprint']..' LIKE "%'..value..'%"')
        for i = 1, #citizens, 1 do
            citizens[i].identifier = citizens[i].citizenid
        end
        return citizens
    else
        local citizens = MySQL.query.await('SELECT players.*, gpt_citizens_wanted.id AS wanted FROM players LEFT JOIN gpt_citizens_wanted ON players.citizenid = gpt_citizens_wanted.player WHERE (LOWER(CONCAT(JSON_EXTRACT(players.charinfo, "$.firstname")," ",JSON_EXTRACT(players.charinfo, "$.lastname"))) LIKE "%'..value..'%") OR players.'..Config.SSN..' LIKE "%'..value..'%"')
        for i = 1, #citizens, 1 do
            citizens[i].identifier = citizens[i].citizenid
        end
        return citizens
    end
end

GPT.Editable.GetCitizenVehicles = function(identifier)
    local loadVehicles = 'SELECT player_vehicles.*, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.firstname")) AS firstname, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.lastname")) AS lastname, EXISTS (SELECT 1 FROM gpt_vehicles_wanted WHERE gpt_vehicles_wanted.vin = player_vehicles.vin) AS wanted, IF(player_vehicles.co_owner IS NOT NULL, JSON_UNQUOTE(JSON_EXTRACT(co_owner.charinfo, "$.firstname")), NULL) AS cofname, IF(player_vehicles.co_owner IS NOT NULL, JSON_UNQUOTE(JSON_EXTRACT(co_owner.charinfo, "$.lastname")), NULL) AS colname FROM player_vehicles JOIN players ON player_vehicles.citizenid = players.citizenid LEFT JOIN players AS co_owner ON player_vehicles.co_owner = co_owner.citizenid WHERE player_vehicles.citizenid = @id'
    if Config.SecondOwner then
        loadVehicles = loadVehicles..' OR player_vehicles.'..Config.SecondOwner..' = @id'
    end
    return MySQL.query.await(loadVehicles, {['@id'] = identifier})
end

GPT.Editable.GetJobName = function(jobData)
    jobData = json.decode(jobData)
    return jobData.name
end

GPT.Editable.GetSearchedCitizen = function(identifier)
    local citizen = MySQL.single.await('SELECT * FROM players WHERE citizenid = ? LIMIT 1', {identifier})
    if citizen then
        local charinfo = json.decode(citizen.charinfo)
        local job = json.decode(citizen.job)
        return {
            firstname = charinfo.firstname,
            lastname = charinfo.lastname,
            id = citizen[Config.SSN],
            dateofbirth = charinfo.birthdate,
            job = job.name,
            identifier = identifier,
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
    local notes = MySQL.query.await('SELECT gpt_citizens_notes.*, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.firstname")) AS firstname, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.lastname")) AS lastname FROM gpt_citizens_notes LEFT JOIN players ON gpt_citizens_notes.officer = players.citizenid WHERE gpt_citizens_notes.player = ? ORDER BY gpt_citizens_notes.id DESC', {identifier})
    return notes
end

GPT.Editable.GetCitizenWanted = function(identifier)
    return MySQL.query.await('SELECT gpt_citizens_wanted.*, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.firstname")) AS firstname, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.lastname")) AS lastname FROM gpt_citizens_wanted LEFT JOIN players ON gpt_citizens_wanted.officer = players.citizenid WHERE gpt_citizens_wanted.player = ? ORDER BY gpt_citizens_wanted.id DESC', {identifier})
end

GPT.Editable.GetCitizenCases = function(identifier)
    return MySQL.query.await('SELECT * FROM gpt_cases WHERE citizens LIKE "%'..identifier..'%" ORDER BY id DESC')
end

GPT.Editable.GetCaseVehicles = function(value)
    return MySQL.query.await('SELECT * FROM player_vehicles WHERE vin LIKE "%'..value..'%" OR plate LIKE "%'..value..'%"')
end

GPT.Editable.GetSearchedVehicles = function(value)
    return MySQL.query.await('SELECT pv.*, JSON_UNQUOTE(JSON_EXTRACT(p1.charinfo, "$.firstname")) AS ofname, JSON_UNQUOTE(JSON_EXTRACT(p1.charinfo, "$.lastname")) AS olname, JSON_UNQUOTE(JSON_EXTRACT(p2.charinfo, "$.firstname")) AS cofname, JSON_UNQUOTE(JSON_EXTRACT(p2.charinfo, "$.lastname")) AS colname, EXISTS (SELECT 1 FROM gpt_vehicles_wanted WHERE gpt_vehicles_wanted.vin = pv.vin) AS wanted FROM player_vehicles pv LEFT JOIN players p1 ON pv.citizenid = p1.citizenid LEFT JOIN players p2 ON pv.co_owner = p2.citizenid WHERE pv.plate LIKE "%'..value..'%" OR pv.vin LIKE "%'..value..'%"')
end

GPT.Editable.GetFullVehicleInfo = function(vin)
    local vehicleInfo = MySQL.single.await('SELECT pv.*, JSON_UNQUOTE(JSON_EXTRACT(p1.charinfo, "$.firstname")) AS ofname, JSON_UNQUOTE(JSON_EXTRACT(p1.charinfo, "$.lastname")) AS olname, JSON_UNQUOTE(JSON_EXTRACT(p2.charinfo, "$.firstname")) AS cofname, JSON_UNQUOTE(JSON_EXTRACT(p2.charinfo, "$.lastname")) AS colname FROM player_vehicles pv LEFT JOIN players p1 ON pv.citizenid = p1.citizenid LEFT JOIN players p2 ON pv.co_owner = p2.citizenid WHERE pv.vin = ?', {vin})
    vehicleInfo.notes = MySQL.query.await('SELECT gnotes.*, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.firstname")) AS firstname, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.lastname")) AS lastname FROM gpt_vehicles_notes gnotes LEFT JOIN players ON gnotes.officer = players.citizenid WHERE gnotes.vin = ?', {vin})
    vehicleInfo.wanted = MySQL.query.await('SELECT gwanted.*, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.firstname")) AS firstname, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.lastname")) AS lastname FROM gpt_vehicles_wanted gwanted LEFT JOIN players ON gwanted.officer = players.citizenid WHERE gwanted.vin = ?', {vin})
    return vehicleInfo
end

GPT.Editable.GetVehicleData = function(vin)
    local vehicleWanted = MySQL.query.await('SELECT gwanted.*, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.firstname")) AS firstname, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.lastname")) AS lastname FROM gpt_vehicles_wanted gwanted LEFT JOIN players ON gwanted.officer = players.citizenid WHERE gwanted.vin = ?', {vin})
    local vehicleNotes = MySQL.query.await('SELECT gnotes.*, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.firstname")) AS firstname, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.lastname")) AS lastname FROM gpt_vehicles_notes gnotes LEFT JOIN players ON gnotes.officer = players.citizenid WHERE gnotes.vin = ?', {vin})
    return vehicleWanted, vehicleNotes
end

GPT.Editable.GetWeapons = function(value)
    local weapons = MySQL.query.await('SELECT gpt_weapons.*, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.firstname")) AS firstname, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.lastname")) AS lastname FROM gpt_weapons LEFT JOIN players ON gpt_weapons.owner = players.citizenid WHERE gpt_weapons.serial LIKE "%'..value..'%"')
    return weapons
end

GPT.Editable.GetSearchedWorkers = function(value)
    local result = MySQL.query.await('SELECT * FROM players WHERE JSON_UNQUOTE(JSON_EXTRACT(charinfo, "$.firstname")) LIKE "%'..value..'%" OR JSON_UNQUOTE(JSON_EXTRACT(charinfo, "$.lastname")) LIKE "%'..value..'%" OR '..Config.SSN..' LIKE "%'..value..'%"')
    local sortedWorkers = {}
    for i = 1, #result, 1 do
        local charinfo = json.decode(result[i].charinfo)
        local job = json.decode(result[i].job)
        sortedWorkers[i] = {
            identifier = result[i].citizenid,
            ssn = result[i][Config.SSN],
            firstname = charinfo.firstname,
            lastname = charinfo.lastname,
            job = GPT.Jobs[job.name].label
        }
    end

    return sortedWorkers
end

GPT.Editable.GetFullWorkerInfo = function(identifier)
    local workerData = {}
    local workerInfo = MySQL.single.await('SELECT * FROM players WHERE citizenid = ? LIMIT 1', {identifier})
    if workerInfo then
        local xWorker = QBCore.Functions.GetPlayerByCitizenId(identifier)
        if xWorker then
            xWorker.source = xWorker.PlayerData.source
        end
        local charinfo = workerInfo.charinfo and json.decode(workerInfo.charinfo) or {
            firstname = workerInfo.firstname,
            lastname = workerInfo.lastname,
            dateofbirth = workerInfo.dateofbirth
        }
        if charinfo.birthdate then
            charinfo.dateofbirth = charinfo.birthdate
        end
        local workerJob = GPT.Editable.GetJobName(workerInfo.job)
        local workerGrade = workerInfo.job_grade or json.decode(workerInfo.job).grade.level
        workerData.identifier = identifier
        workerData.name = charinfo.firstname..' '..charinfo.lastname
        workerData.radio = xWorker and GPT.Editable.FetchPlayerRadio(xWorker.source) or locale('no_data')
        workerData.status = xWorker and exports['piotreq_jobcore']:GetPlayerDutyData(identifier).status or 0
        workerData.dutyTime = workerInfo.dutyTime
        workerData.job = GPT.Jobs[workerJob] and GPT.Jobs[workerJob].label or locale('no_data')
        workerData.badge = GPT.Editable.FetchPlayerBadge(identifier)
        workerData.grade_label = GPT.Jobs[workerJob].grades[tostring(workerGrade)].label
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
    
        local officerVehicle = MySQL.single.await('SELECT * FROM player_vehicles WHERE job = ? AND citizenid = ?', {
            workerJob, identifier
        })
    
        if officerVehicle then
            workerData.vehicle = {model = officerVehicle.vehicle, plate = officerVehicle.plate}
        else
            workerData.vehicle = locale('no_vehicle')
        end
    
        local notes = MySQL.query.await('SELECT notes.*, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.firstname")) AS firstname, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.lastname")) AS lastname FROM gpt_workers_notes notes LEFT JOIN players ON notes.creator = players.citizenid WHERE notes.officer = ? ORDER by id DESC', {identifier})
        workerData.notes = notes
        workerData.licenses = MySQL.query.await('SELECT * FROM gpt_licenses WHERE owner = ?', {identifier})
        return workerData
    end

    return nil
end

GPT.Editable.GetCaseData = function(id)
    local case = MySQL.single.await('SELECT gpt_cases.*, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.firstname")) AS firstname, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.lastname")) AS lastname FROM gpt_cases LEFT JOIN players ON gpt_cases.creator = players.citizenid WHERE gpt_cases.id = ? LIMIT 1', {id})
    local officers = json.decode(case.officers)
    for k, v in pairs(officers) do
        local xOfficer = QBCore.Functions.GetPlayerByCitizenId(v.citizenid)
        if xOfficer then
            v.job = xOfficer.PlayerData.job.label
        else
            local row = MySQL.single.await('SELECT JSON_UNQUOTE(JSON_EXTRACT(job, "$.name")) AS job FROM players WHERE citizenid = ? LIMIT 1', {v.citizenid})
            if row then
                v.job = GPT.Jobs[row.job].label
            end
        end
    end

    local vehicles = json.decode(case.vehicles)
    for k, v in pairs(vehicles) do
        local vehicleData = MySQL.single.await('SELECT hash FROM player_vehicles WHERE vin = ? LIMIT 1', {v.vin})
        if vehicleData then
            v.vehicle = {model = vehicleData.hash}
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
    MySQL.update('UPDATE players SET dutyTime = ? WHERE citizenid = ?', {dutyTime, identifier})
end

GPT.Editable.GetCitizenLicense = function(id)
    local row = MySQL.single.await('SELECT * FROM user_licenses WHERE id = ?', {id})
    return row
end

GPT.Editable.AddCitizenLicense = function(license, name, player)
    local id = MySQL.insert.await('INSERT INTO user_licenses (type, name, owner) VALUES(?, ?, ?)', {
        license, name, player
    })
    if id then
        local player = QBCore.Functions.GetPlayerByCitizenId(player)
        player.PlayerData.metadata.licences[license] = true
        player.Functions.SetMetaData('licences', player.PlayerData.metadata.licences)
    end
    return id
end

GPT.Editable.DeleteCitizenLicense = function(id, owner, license)
    MySQL.update('DELETE FROM user_licenses WHERE id = ?', {id})
    local player = QBCore.Functions.GetPlayerByCitizenId(owner)
    if player then
        player.PlayerData.metadata.licences[license] = false
        player.Functions.SetMetaData('licences', player.PlayerData.metadata.licences)
    end
end

GPT.Editable.SetCitizenPhoto = function(photo, player)
    MySQL.update('UPDATE players SET gptPhoto = ? WHERE citizenid = ?', {photo, player})
end

GPT.Editable.SetOfficerPhoto = function(photo, player)
    MySQL.update('UPDATE players SET gptOfficerPhoto = ? WHERE citizenid = ?', {photo, player})
end

GPT.Editable.ConfiscateVehicle = function(vin)
    local affectedRows = MySQL.update.await('UPDATE player_vehicles SET state = 3 WHERE vin = ? AND state != 3', {vin})
    if affectedRows > 0 then
        local row = MySQL.single.await('SELECT vehicleid FROM player_vehicles WHERE vin = ? LIMIT 1', {vin})
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

GPT.Editable.GetPlayerFromSSN = function(ssn)
    local row = MySQL.single.await('SELECT citizenid FROM players WHERE '..Config.SSN..' = ? LIMIT 1', {ssn})
    return row and row.citizenid or nil
end

GPT.Editable.FetchJobs = function()
    local Jobs = {}
	local sharedJobs = QBCore.Shared.Jobs

	for k, v in pairs(QBCore.Shared.Jobs) do
		Jobs[k] = {
            name = k,
            label = v.label,
            grades = {}
        }
	end

    for k, v in pairs(QBCore.Shared.Jobs) do
        for grade, gradeInfo in pairs(v.grades) do
            Jobs[k].grades[tostring(grade)] = {
                grade = tonumber(grade),
                label = gradeInfo.name,
                name = gradeInfo.name
            }
        end
    end

    return Jobs
end

GPT.Editable.SetPlayerJob = function(identifier, name, grade)
    local promise = promise.new()
    local xPlayer = QBCore.Functions.GetPlayerByCitizenId(identifier)
    if xPlayer then
        xPlayer.Functions.SetJob(name, grade)
    end
    local row = MySQL.single.await('SELECT job FROM players WHERE citizenid = ? LIMIT 1', {identifier})
    if not row then
        row = {job = json.encode({name = name, grade = {}})}
    end

    row.job = json.decode(row.job)
    row.job.name = name
    row.job.grade.level = grade
    local affectedRows = MySQL.update.await('UPDATE players SET job = ?, jobJoined = ? WHERE citizenid = ?', {
        json.encode(row.job), os.date('%H:%M %d/%m/%Y', os.time()), identifier
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
    local row = MySQL.single.await('SELECT badge FROM players WHERE citizenid = ? LIMIT 1', {identifier})
    return row and row.badge or locale('no_data')
end

GPT.Editable.ChangePlayerBadge = function(identifier, badge)
    local promise = promise.new()
    local affectedRows = MySQL.update.await('UPDATE players SET badge = ? WHERE citizenid = ?', {
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
    local employees = MySQL.query.await('SELECT * FROM players WHERE JSON_EXTRACT(job, "$.name") = ?', {jobName})
    local sortedEmployees = {}
    for i = 1, #employees, 1 do
        local employee = employees[i]
        local xEmployee = QBCore.Functions.GetPlayerByCitizenId(employee.citizenid)
        local playerRadio = '-'
        if xEmployee then
            local playerId = xEmployee.source or xEmployee.PlayerData?.source
            local radioChannel = GPT.Editable.FetchPlayerRadio(playerId)
            if radioChannel and radioChannel ~= 0 and type(radioChannel) ~= 'string' then
                if Config.RadioChannels[tostring(radioChannel)] then
                    playerRadio = '#'..radioChannel..' - '..Config.RadioChannels[tostring(radioChannel)]
                else
                    playerRadio = '#'..radioChannel
                end
            end
        end
        local dutyData = exports['piotreq_jobcore']:GetPlayerDutyData(employee.citizenid)
        local charinfo = json.decode(employee.charinfo)
        local jobData = json.decode(employee.job)
        sortedEmployees[#sortedEmployees + 1] = {
            identifier = employee.citizenid,
            name = charinfo.firstname..' '..charinfo.lastname,
            grade_label = GPT.Jobs[jobName].grades[tostring(jobData.grade.level)] and GPT.Jobs[jobName].grades[tostring(jobData.grade.level)].label or locale('no_data'),
            grade = tonumber(jobData.grade.level),
            badge = GPT.Editable.FetchPlayerBadge(employee.citizenid),
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
    local announcements = MySQL.query.await('SELECT ann.*, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.firstname")) AS firstname, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.lastname")) AS lastname FROM gpt_announcements ann LEFT JOIN players ON ann.creator = players.citizenid WHERE ann.job = ? ORDER BY important DESC', {jobName})
    return announcements
end

GPT.Editable.FetchCases = function()
    local cases = MySQL.query.await('SELECT gpt_cases.*, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.firstname")) AS firstname, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.lastname")) AS lastname FROM gpt_cases LEFT JOIN players ON gpt_cases.creator = players.citizenid')
    local sortedCases = {}
    for i = 1, #cases, 1 do
        local officers = json.decode(cases[i].officers)
        for k, v in pairs(officers) do
            local xOfficer = QBCore.Functions.GetPlayerByCitizenId(v.citizenid)
            if xOfficer then
                v.job = xOfficer.PlayerData.job.label
            else
                local row = MySQL.single.await('SELECT JSON_UNQUOTE(JSON_EXTRACT(job, "$.name")) AS job FROM players WHERE citizenid = ? LIMIT 1', {v.citizenid})
                if row then
                    v.job = GPT.Jobs[row.job].label
                end
            end
        end

        local vehicles = json.decode(cases[i].vehicles)
        for k, v in pairs(vehicles) do
            local vehicleData = MySQL.single.await('SELECT hash FROM player_vehicles WHERE vin = ? LIMIT 1', {v.vin})
            if vehicleData then
                v.vehicle = {model = vehicleData.hash}
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
    local vehicles = MySQL.query.await('SELECT gpt_confiscates.*, player_vehicles.*, gpt_confiscates.price FROM gpt_confiscates LEFT JOIN player_vehicles ON gpt_confiscates.vin = player_vehicles.vin WHERE player_vehicles.citizenid = ?', {identifier})
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
    until(not MySQL.single.await('SELECT plate FROM player_vehicles WHERE plate = ?', {newPlate}))
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
        until(not MySQL.single.await('SELECT vin FROM player_vehicles WHERE vin = ?', {newPlate}))
        return newPlate
    end
end

exports('GenerateVIN', GPT.Editable.GenerateVIN)

GPT.Editable.Pay = function(data)
    local xPlayer = QBCore.Functions.GetPlayer(data.player)
    local plyMoney = xPlayer.Functions.GetMoney('bank')
    if plyMoney < data.price then
        return false
    end

    xPlayer.Functions.RemoveMoney('bank', data.price)
    return true
end

GPT.Editable.GetGarage = function(jobName)
    local garage = MySQL.query.await('SELECT player_vehicles.*, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.firstname")) AS firstname, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.lastname")) AS lastname FROM player_vehicles LEFT JOIN players ON player_vehicles.citizenid = players.citizenid WHERE player_vehicles.job = ? ORDER BY id DESC', {jobName})
    for i = 1, #garage, 1 do
        garage[i].stored = garage[i].state
    end
    return garage
end

GPT.Editable.BoughtVehicle = function(data)
    local xPlayer = GPT.Editable.GetPlayerFromId(data.playerId)
    local promise = promise.new()
    local mods = {
        engineHealth = 1000.0, bodyHealth = 1000.0, fuelLevel = 100.0,
        model = GetHashKey(data.model), plate = data.plate
    }
    local id = MySQL.insert.await('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state, job, vin) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', {
        xPlayer.PlayerData.license, xPlayer.PlayerData.citizenid, data.model, GetHashKey(data.model), json.encode(mods), data.plate, 1, data.job, data.vin
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
    local xPlayer = GPT.Editable.GetPlayerFromId(data.player)
    local vehicles = MySQL.query.await('SELECT * FROM player_vehicles WHERE job = ? AND state = 0', {data.job})
    if #vehicles > 0 then
        local toPay = (500 * #vehicles)
        local plyMoney = xPlayer.Functions.GetMoney('bank')
        if plyMoney < toPay then
            return locale('not_enough_money')
        end

        for i = 1, #vehicles, 1 do
            local veh = vehicles[i]
            if veh.vehicleid then
                local entity = NetworkGetEntityFromNetworkId(veh.vehicleid)
                if entity and entity ~= 0 and DoesEntityExist(entity) then
                    DeleteEntity(entity)
                end
            end
        end
        local affectedRows = MySQL.update.await('UPDATE player_vehicles SET state = 1 WHERE job = ?', {data.job})
        promise:resolve(true)
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
    promise:resolve(jailDone)

    local await = Citizen.Await(promise)
    return await
end

GPT.Editable.FetchCitizenJudgments = function(identifier)
    local judgments = MySQL.query.await('SELECT judgements.*, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.firstname")) AS firstname, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.lastname")) AS lastname FROM judgements LEFT JOIN players ON judgements.officer = players.citizenid WHERE judgements.player = ? ORDER BY id ASC', {identifier})
    return judgments
end

GPT.Editable.GetLastJudgment = function(identifier) -- need to return id, and time
    local lastJudgment = MySQL.single.await('SELECT * FROM judgements WHERE officer = ? ORDER BY id DESC LIMIT 1', {
        identifier
    })
    return lastJudgment
end

if GetResourceState('ox_inventory') ~= 'missing' then
    local weaponNames = {
        ['WEAPON_PISTOL'] = 'Pistol'
    }
    exports.ox_inventory:registerHook('buyItem', function(payload)
        local _source = payload.source
        local xPlayer = GPT.Editable.GetPlayerFromId(_source)
        exports['piotreq_gpt']:RegisterWeapon({
            model = payload.itemName and weaponNames[payload.itemName] or 'Unknown',
            owner = xPlayer.PlayerData.citizenid,
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
        affectedRows = MySQL.update.await('UPDATE player_vehicles SET citizenid = ? WHERE vin = ?', {
            data.identifier, data.vin
        })
    else
        affectedRows = MySQL.update.await('UPDATE player_vehicles SET citizenid = NULL WHERE vin = ?', {
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

AddEventHandler('QBCore:Server:OnPlayerUnload', function(playerId)
    local _source = playerId
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    if not xPlayer then return end

    MySQL.update('UPDATE players SET lastActive = ? WHERE citizenid = ?', {os.date('%H:%M %d/%m/%Y', os.time()), xPlayer.PlayerData.citizenid})
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