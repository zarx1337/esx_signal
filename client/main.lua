function signal()

    local alreadyDead = false
    local playerPed   = GetPlayerPed(-1)
    local coords      = GetEntityCoords(playerPed)
    local percent     = math.random(0, 3)

    if percent == 2 then
        TriggerServerEvent('esx_phone:send', "ambulance", _U('distress_message'), true, {
            x = coords.x,
            y = coords.y,
            z = coords.z
        })
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(50)
        if IsEntityDead(playerPed) and not alreadyDead then
            signal()
            alreadyDead = true

        elseif not IsEntityDead(playerPed) then
            alreadyDead = false
            
        end
    end
end)
