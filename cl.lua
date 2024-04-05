function mewtwo()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    
    local namePed2 = "mewtwo1"
    local Hash2 = GetHashKey(namePed2)
    -- local namePed = "charizard1"
    -- local Hash = GetHashKey(namePed)
    -- RequestModel(Hash)
    RequestModel(Hash2)
    while not HasModelLoaded(Hash2) do Citizen.Wait(10) end
    
    -- local ped3 = CreatePed(4, Hash, pos.x + 10, pos.y, pos.z + 3, heading + 180, false, false)
    local xname = "weapon_ball"
    local xHash = GetHashKey(xname)
    GiveWeaponToPed(ped, xHash, 20, false, true)
    local obj = CreateObject(-2063067254, pos.x + 7, pos.y + 7, pos.z, false, false, false)
    Citizen.Wait(2000)
    SetEntityHeading(ped, 263.4893)
    TaskAimGunAtCoord(ped, pos.x + 7, pos.y + 7, pos.z + 2, 2000, false, false)
    TaskShootAtCoord(ped, pos.x + 7, pos.y + 7, pos.z + 2, 1000, false)
    Citizen.Wait(3000)
    local ped2 = CreatePed(4, Hash2, pos.x + 7, pos.y, pos.z + 3, heading + 180, false, false)
    RemoveWeaponFromPed(ped, xHash)

    CreateObject(-2063067254, pos.x + 7, pos.y + 7, pos.z, false, false, false)




    Citizen.CreateThread(function()
        while true do
            local posPed2 = GetEntityCoords(ped2)
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local dist = GetDistanceBetweenCoords(pos, posPed2, true)
            local vos = ESX.Game.GetClosestPed()
            local dist2 = GetDistanceBetweenCoords(pos, posPed2, true)
            local nos = GetEntityCoords(vos)
            local dist2 = GetDistanceBetweenCoords(pos, nos, true)
            local veh = GetClosestVehicle(posPed2.x, posPed2.y, posPed2.z, 120, 0)

            Citizen.Wait(0)

            if IsControlJustPressed(1, 73) then
                TaskWarpPedIntoVehicle(ped2, veh, -1)
                ESX.ShowNotification("J'appuyé sur X pour qu'il s'arrête")
            end 


            if dist <= 10 then
                DrawMarker(0, nos.x, nos.y, nos.z + 1.5, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.2, 0.2, 0.2, 0, 0, 255, 180, false, true, p19, false)
            end
            if dist <= 10 then 
                DrawMarker(0, posPed2.x, posPed2.y, posPed2.z + 1.5, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.2, 0.2, 0.2, 255, 255, 255, 180, false, true, p19, false)
                DrawMarker(0, nos.x, nos.y, nos.z + 1.5, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.2, 0.2, 0.2, 0, 0, 255, 180, false, true, p19, false)
                if IsControlJustPressed(1, 51) then
                    TaskCombatPed(ped2, vos, 0, 16)
                    ESX.ShowNotification("j'appuyé sur E pour qu'il attaque le PNJ ou la personne la plus proche (marker)")
                end   
            end
            -- if IsControlJustPressed(1, 73) then
            --     ClearPedTasksImmediately(ped2)
            --     ESX.ShowNotification("J'appuyé sur X pour qu'il s'arrête")
            -- end 
            if IsControlJustPressed(1, 74) then
                TaskFollowToOffsetOfEntity(ped2, ped, 0.5, 0.0, 0.0, 20.0, -1, 1.0, true)
                ESX.ShowNotification("j'ai appuyé sur H pour qu'il me suive")
            end
            if IsControlJustPressed(1, 132) then
                if dist < 5 then
                -- ESX.ShowFloatingHelpNotification("Rentre", posPed2)
                ESX.ShowNotification("j'ai appuyé sur CTRL pour faire rentrer le pokemon")
                end
                GiveWeaponToPed(ped, xHash, 20, false, true)
                Citizen.Wait(800)
                SetEntityHeading(ped, 263.4893)
                TaskAimGunAtCoord(ped, pos.x + 7, pos.y + 7, pos.z + 2, 2000, false, false)
                Citizen.Wait(1300)
                CreateObject(-383950123, posPed2.x, posPed2.y, posPed2.z - 1, false, false, true)
                DeletePed(ped2)
                RemoveWeaponFromPed(ped, xHash)
                Citizen.Wait(2000)
                xnxx()
            end 
        end
    end)
end

RegisterNetEvent('esx_pokeball:lance')
AddEventHandler('esx_pokeball:lance', function()
    mewtwo()
end)


Citizen.CreateThread(function()
    while true do
        local wait = 1000

        local object, dst = ESX.Game.GetClosestObject()
        local model = GetEntityModel(object)
        local coord = GetEntityCoords(object)
        local playerPed = PlayerPedId()
        
        if model == -383950123 then

            if dst <= 3 then
                wait = 0
                ESX.ShowFloatingHelpNotification("Pokeball", coord)
                
                if IsControlJustPressed(1, 51) then
                    local dict, anim = 'weapons@first_person@aim_rng@generic@projectile@sticky_bomb@', 'plant_floor'
                    RequestAnimDict(dict)
                    SetEntityHeading(PlayerPedId(), GetEntityHeading(object))
                    FreezeEntityPosition(PlayerPedId(), true)
                    TaskPlayAnim(playerPed, dict, anim, 8.0, 1.0, 10000, 16, 0.0, true, true, true)
                    exports['an_progBar']:run(1,'Ramassage','#27c7e1')
                    Citizen.Wait(1500)
                    TriggerServerEvent("esx_pokemon:ramasse")
                    FreezeEntityPosition(PlayerPedId(), false)
                    ClearPedTasksImmediately(PlayerPedId())
                    DeleteObject(object)
                end
            end
        end
        Citizen.Wait(wait)
    end
end)
