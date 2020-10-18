blips = true
Citizen.CreateThread(function()
        Citizen.Wait(0)
         if blips then
            for _, info in pairs(config.blips) do
            info.blip = AddBlipForCoord(info.x, info.y, info.z)
            SetBlipSprite(info.blip, info.id)
            SetBlipDisplay(info.blip, 4)--ADEMO
            SetBlipScale(info.blip, 0.8)
            SetBlipColour(info.blip, info.color)
            SetBlipAsShortRange(info.blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(info.name)
            EndTextCommandSetBlipName(info.blip)
        end
    end
end)

