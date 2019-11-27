local VolumeDeLaMusique = 0.2

function ChargementAnimation(donnees)
    while (not HasAnimDictLoaded(donnees)) do 
        RequestAnimDict(donnees)
        Wait(5)
    end
end

CreateThread(function()
    while true do
        Wait(0)
        if IsControlPressed(1, 19) and IsControlJustPressed(1, 44) then  -- alt + A
            if IsPedArmed(GetPlayerPed(-1), 7) then
                SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey('WEAPON_UNARMED'), true)
            end
            if (DoesEntityExist(GetPlayerPed(-1)) and not IsEntityDead(GetPlayerPed(-1))) then
                ChargementAnimation("rcmnigel1c")
                TaskPlayAnim(GetPlayerPed(-1), "rcmnigel1c", "hailing_whistle_waive_a", 2.0, 2.0, 2000, 51, 0, false, false, false)
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(0)
        if IsControlPressed(1, 19) and IsControlJustPressed(1, 47) then  -- alt + G
            if IsPedArmed(GetPlayerPed(-1), 7) then
                SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey('WEAPON_UNARMED'), true)
            end
            if (DoesEntityExist(GetPlayerPed(-1)) and not IsEntityDead(GetPlayerPed(-1))) then
                ChargementAnimation("melee@unarmed@streamed_variations")
                TaskPlayAnim(GetPlayerPed(-1), "melee@unarmed@streamed_variations", "plyr_takedown_front_slap", 8.0, 1.0, 1500, 1, 0, 0, 0, 0)
                Wait(500)
                SendNUIMessage({
                    DemarrerLaMusique     = 'DemarrerLaMusique',
                    VolumeDeLaMusique   = VolumeDeLaMusique
                })
            end
        end
    end
end)