ESX = exports["es_extended"]:getSharedObject()

----------------------------------------------------------------

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

function DrawText3Ds(x, y, z, text)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
        SetTextScale(0.0*scale, 0.40*scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(1, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        SetDrawOrigin(x,y,z, 0)
        DrawText(0.0, 0.0)
        ClearDrawOrigin()
end

function SetVehicleModData(vehicle, modType, data)
	if (modType == 'extras') then
		local tempList = {}
		for id = 0, 25, 1 do
			if (DoesExtraExist(vehicle, id)) then
				table.insert(tempList, id)
			end
		end
		
		if (DoesExtraExist(vehicle, tempList[data.id])) then
			SetVehicleExtra(vehicle, tempList[data.id], data.enable)
		end
	end
end

CreateThread(function()
    while true do 
        Wait(4)
        local CoordsP = GetEntityCoords(PlayerPedId())
        if ESX.PlayerData.job and ESX.PlayerData.job.name == Config.MenuExtra.JobName then
            if IsPedInAnyVehicle(PlayerPedId(), false) ~= false then  
                if #(CoordsP - Config.MenuExtra['Menu'].CoordsMenu) <= Config.MenuExtra['Menu'].Distance then
                    DrawText3Ds(Config.MenuExtra['Menu'].CoordsMenu.x, Config.MenuExtra['Menu'].CoordsMenu.y, Config.MenuExtra['Menu'].CoordsMenu.z, Config.MenuExtra['Translate'][Config.MenuExtra.Language].Text3D)
                    DrawMarker(36, Config.MenuExtra['Menu'].CoordsMenu.x, Config.MenuExtra['Menu'].CoordsMenu.y, Config.MenuExtra['Menu'].CoordsMenu.z-0.97, Config.MenuExtra['Menu'].Marker.dirX, Config.MenuExtra['Menu'].Marker.dirY, Config.MenuExtra['Menu'].Marker.dirZ, Config.MenuExtra['Menu'].Marker.rotX, Config.MenuExtra['Menu'].Marker.rotY, Config.MenuExtra['Menu'].Marker.rotZ, Config.MenuExtra['Menu'].Marker.scaleX, Config.MenuExtra['Menu'].Marker.scaleY, Config.MenuExtra['Menu'].Marker.scaleZ, Config.MenuExtra['Menu'].Color.red, Config.MenuExtra['Menu'].Color.green, Config.MenuExtra['Menu'].Color.blue, Config.MenuExtra['Menu'].Color.alpha, false, false, true, false, false, false, false, false)
                    if IsControlJustPressed(0, 38) and #(CoordsP - Config.MenuExtra['Menu'].CoordsMenu) <= 2.0 then 
                        for _,v in pairs(Config.MenuExtra['VehicleList']) do 
                            if string.lower(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(PlayerPedId(), false)))) == v then -- Use (string.lower) if you have problems with the vehicle name
                                lib.showContext('extrapolice')
                            end
                        end
                    end
                else 
                    Wait(1000)
                end
            else
                Wait(2000)
            end
        else
            Wait(3000)
        end
    end
end)

lib.registerContext({
    id = 'extrapolice',
    title = 'Menu extra',
    options = {

        { 
            title = 'Mettre des extra',
            --description = 'Permet de mettre des peds addons',
            icon = 'car',
            iconColor = '#EF5B02',  
            menu = 'extraon'
        },

        { 
            title = 'Retirer des extra',
            --description = 'Permet de modifié son véhicule',
            icon = 'car',
            iconColor = '#AA00FF',  
            menu = 'extraoff'
        },
    }
})


lib.registerContext({
    menu = 'extrapolice',
    id = 'extraon',
    title = 'Menu extra',
    options ={ 
	{
        title = "Extra n°1", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  1
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 0})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' installé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
	{
        title = "Extra n°2", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  2
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 0})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' installé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
	{
        title = "Extra n°3", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  3
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 0})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' installé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
	{
        title = "Extra n°4", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  4
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 0})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' installé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
	{
        title = "Extra n°5", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  5
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 0})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' installé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
	{
        title = "Extra n°6", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  6
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 0})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' installé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
	{
        title = "Extra n°7", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  7
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 0})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' installé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
	{
        title = "Extra n°8", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  8
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 0})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' installé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
	{
        title = "Extra n°9", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  9
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 0})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' installé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
	{
        title = "Extra n°10", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  10
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 0})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' installé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
	{
        title = "Extra n°11", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  11
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 0})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' installé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
	{
        title = "Extra n°12", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  12
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 0})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' installé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
	{
        title = "Extra n°13", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  13
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 0})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' installé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
	{
        title = "Extra n°14", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  14
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 0})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' installé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
	{
        title = "Extra n°15", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  15
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 0})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' installé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
}
})

lib.registerContext({
    menu = 'extrapolice',
    id = 'extraoff',
    title = 'Menu extra',
    options ={ 
	{
        title = "Extra n°1", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  1
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 1})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' désactivé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
	{
        title = "Extra n°2", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  2
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 1})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' désactivé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
	{
        title = "Extra n°3", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  3
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 1})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' désactivé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
	{
        title = "Extra n°4", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  4
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 1})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' désactivé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
	{
        title = "Extra n°5", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  5
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 1})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' désactivé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
	{
        title = "Extra n°6", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  6
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 1})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' désactivé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
	{
        title = "Extra n°7", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  7
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 1})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' désactivé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
	{
        title = "Extra n°8", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  8
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 1})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' désactivé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
	{
        title = "Extra n°9", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  9
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 1})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' désactivé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
	{
        title = "Extra n°10", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  10
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 1})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' désactivé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
	{
        title = "Extra n°11", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  11
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 1})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' désactivé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
	{
        title = "Extra n°12", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  12
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 1})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' désactivé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
	{
        title = "Extra n°13", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  13
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 1})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' désactivé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
	{
        title = "Extra n°14", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  14
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 1})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' désactivé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
	{
        title = "Extra n°15", 
        onSelect = function()
			local VPed = GetVehiclePedIsIn(PlayerPedId(), false)
			--print(test)
			local Vengine = GetVehicleEngineHealth(VPed)/10
			local Vengine2 = math.floor(Vengine)

			if Vengine2 >= 99.0 then 

			TimeoutExtra = true
			number =  15
			--print(number)
			mis = true
			SetVehicleModData(VPed, 'extras', {id = number, enable = 1})
			ESX.ShowNotification('Menu police', 'Extra n°' .. number .. ' désactivé', 'success', 8000, 'top-left')
			Citizen.SetTimeout(500, function() TimeoutExtra = false end)

			else 
			ESX.ShowNotification(Config.MenuExtra['Translate'][Config.MenuExtra.Language].TOO_DAMAGED)
			end
        end
    },
}
})
