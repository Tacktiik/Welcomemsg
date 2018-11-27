Citizen.CreateThread(function() 
    while true do   
		
        if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId())) then
            local veh = GetVehiclePedIsTryingToEnter(PlayerPedId())
            local lock = GetVehicleDoorLockStatus(veh)

            if lock == 7 then
                SetVehicleDoorsLocked(veh, 2)
            end
                 
            local pedd = GetPedInVehicleSeat(veh, -1)

            if pedd then                   
                SetPedCanBeDraggedOut(pedd, false)
            end             
        end   
        Citizen.Wait(1)	
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1028.50646972656,-2719.64575195313,20.4863452911377, true) <= 22 then 
			Drawing.draw3DText(-1028.50646972656, -2719.64575195313, 20.4863452911377 + 1.700, "Bienvenue `sur NOM DU SERV !", 6, 1.0, 0.8)
			Drawing.draw3DText(-1028.50646972656, -2719.64575195313, 20.4863452911377, "Reglement et Informations sur : TONDISCORD! ", 8, 0.4, 0.3)
			Drawing.draw3DText(-1028.50646972656, -2719.64575195313, 20.4863452911377 - .700, "Bon Jeu à Tous !", 8, 0.4, 0.3)
		end
	end
end)


Drawing = setmetatable({}, Drawing)
Drawing.__index = Drawing

function Drawing.draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*20
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov

    SetTextScale(scaleX*scale, scaleY*scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 150)
    SetTextDropshadow(1, 1, 1, 0, 255)
    SetTextEdge(2, 0, 0, 0, 220)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end
