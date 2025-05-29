-- Citizen.CreateThread(function()
--     local everythingMale = MySQL.Sync.fetchAll("SELECT * FROM rcore_clothing_items WHERE ped_model=1885233650 AND decal_name_hash IS NOT NULL AND game_build IS NULL")
--     Wait(100)
--     local everythingFemale = MySQL.Sync.fetchAll("SELECT * FROM rcore_clothing_items WHERE ped_model=-1667301416 AND decal_name_hash IS NOT NULL AND game_build IS NULL")
--     Wait(100)

--     SaveResourceFile(GetCurrentResourceName(), "e_male.json", json.encode(everythingMale))
--     Wait(1000)
--     SaveResourceFile(GetCurrentResourceName(), "e_female.json", json.encode(everythingFemale))
-- end)

-- RegisterNetEvent('rcore_clothing:gb_debug_save_working_this_build', function(itemId)
--     local item = DbGetItemById(itemId)

--     if item.game_build == nil then
--         MySQL.Sync.execute('UPDATE rcore_clothing_items SET game_build = @game_build WHERE id = @id AND game_build IS NULL', {
--             ['@game_build'] = GetGameBuild(),
--             ['@id'] = itemId
--         })
--         print(">Updated", itemId, "to", GetGameBuild())
--     end
-- end)