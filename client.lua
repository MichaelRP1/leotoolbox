RegisterCommand("leoloadout", function()
    -- Notify User that the script is starting
    notify("~b~Welcome to Cronus Gaming LEO Loadout Equipper")
    Citizen.Wait(1)
    -- Give user the following weapons
    giveWeapon("weapon_combatpistol")
    giveWeapon("weapon_nightstick")
    giveWeapon("weapon_carbinerifle_mk2")
    giveWeapon("weapon_pumpshotgun")
    giveWeapon("weapon_stungun")
    -- Notify user that weapons are equipped
    notify("~b~LEO Weapons Equipped")
    -- Give user the following weapon attachments
    weaponComponent("weapon_combatpistol", "COMPONENT_COMBATPISTOL_CLIP_02")
    weaponComponent("weapon_combatpistol", "COMPONENT_AT_PI_FLSH")
    weaponComponent("weapon_carbinerifle_mk2", "COMPONENT_CARBINERIFLE_MK2_CLIP_02")
    weaponComponent("weapon_carbinerifle_mk2", "COMPONENT_AT_AR_FLSH")
    weaponComponent("weapon_pumpshotgun", "COMPONENT_AT_AR_FLSH")
    -- Notify user that weapon attachments have been equipped
    notify("~b~LEO Weapon Attachments Equipped")
    vehMenu = true
    notify("~b~LEO Vehicle Menu Has Been Opened")
end)

function notify(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(true, false)
end

function giveWeapon(hash)
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(hash), 999, false, false)
end

function weaponComponent(weaponHash, component)
    if HasPedGotWeapon(GetPlayerPed(-1), GetHashKey(weaponHash), false) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey(weaponHash), GetHashKey(component))
    end
end

function spawnCar(car)
    if IsPedInAnyVehicle(PlayerPedId(), false) then
		currentVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
		DeleteEntity(currentVehicle)
    end
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehicle = CreateVehicle(car, x, y, z + 1, 0.0, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
end

function GetClosestPlayer()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = PlayerPedId()
	local plyCoords = GetEntityCoords(ply, 0)
	
	for index,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = Vdist(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"])
			if(closestDistance == -1 or closestDistance > distance) then
				closestPlayer = value
				closestDistance = distance
			end
		end
	end
	return closestPlayer, closestDistance
end

function cuffPlayer()
    local plyPed = GetNearestPlayerToEntity(PlayerId())
    local targetCoords = GetEntityCoords(GetNearestPlayerToEntity(PlayerId()), 0)
	local plyCoords = GetEntityCoords(PlayerId(), 0)
    local distance = Vdist(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"])
    if(distance ~= -1 and distance < 3) then
        SetEnableHandcuffs(plyPed, true)
        SetCurrentPedWeapon(plyPed, unarmed, true)
        notify("You have ~r~cuffed~s~ " .. GetPlayerName(plyPed))
    else
        notify("There is no player within cuffing distance!")
    end
end

function uncuffPlayer()
    local plyPed = GetNearestPlayerToEntity(PlayerId())
    local targetCoords = GetEntityCoords(GetNearestPlayerToEntity(PlayerId()), 0)
	local plyCoords = GetEntityCoords(PlayerId(), 0)
    local distance = Vdist(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"])
    if(distance ~= -1 and distance < 3) then
        SetEnableHandcuffs(plyPed, false)
        UncuffPed(plyPed)
        notify("You have ~r~uncuffed~s~ " .. GetPlayerName(plyPed))
    else
        notify("There is no player within uncuffing distance!")
    end
end

-- Never Wanted
Citizen.CreateThread(function()
    Citizen.Wait(1000)
    SetPoliceIgnorePlayer(PlayerId(), true)
    SetDispatchCopsForPlayer(PlayerId(), false)
    Citizen.InvokeNative(0xDC0F817884CDD856, 1, false)
    Citizen.InvokeNative(0xDC0F817884CDD856, 2, false)
    Citizen.InvokeNative(0xDC0F817884CDD856, 3, false)
    Citizen.InvokeNative(0xDC0F817884CDD856, 5, false)
    Citizen.InvokeNative(0xDC0F817884CDD856, 8, false)
    Citizen.InvokeNative(0xDC0F817884CDD856, 9, false)
    Citizen.InvokeNative(0xDC0F817884CDD856, 10, false)
    Citizen.InvokeNative(0xDC0F817884CDD856, 11, false)
end)