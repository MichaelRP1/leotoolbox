_menuPool = NativeUI.CreatePool()
-- Create Main Menu to Select Department
mainMenu = NativeUI.CreateMenu("LEO Vehicle Menu", "~b~CRONUS GAMING LEO VEHICLES MENU")
_menuPool:Add(mainMenu)
vehMenu = false

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function sheriffMenu(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Sheriff Vehicles")
    for i = 1, 1 do
        local Item = NativeUI.CreateItem("Crown Victoria", "Spawn Sheriff CVPI")
        Item.Activated = function(ParentMenu, SelectedItem)
            spawnCar("sheriff")
        end
        local Item2 = NativeUI.CreateItem("Tahoe", "Spawn Sheriff Tahoe")
        Item2.Activated = function(ParentMenu, SelectedItem)
            spawnCar("sheriff2")
        end
        local Item3 = NativeUI.CreateItem("Charger", "Spawn Sheriff Charger")
        Item3.Activated = function(ParentMenu, SelectedItem)
            spawnCar("sheriff4")
        end
        local Item4 = NativeUI.CreateItem("Taurus", "Spawn Sheriff FPIS")
        Item4.Activated = function(ParentMenu, SelectedItem)
            spawnCar("sheriff5")
        end
        local Item5 = NativeUI.CreateItem("Explorer", "Spawn Sheriff FPIU")
        Item5.Activated = function(ParentMenu, SelectedItem)
            spawnCar("sheriff6")
        end
    submenu:AddItem(Item)
    submenu:AddItem(Item2)
    submenu:AddItem(Item3)
    submenu:AddItem(Item4)
    submenu:AddItem(Item5)
    end
end

function fireMenu(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Fire Rescue Vehicles")
    for i = 1, 1 do
        local Item = NativeUI.CreateItem("Ladder", "Spawn FR Ladder Truck")
        Item.Activated = function(ParentMenu, SelectedItem)
            spawnCar("ladder4")
        end
        local Item2 = NativeUI.CreateItem("Engine", "Spawn FR Engine")
        Item2.Activated = function(ParentMenu, SelectedItem)
            spawnCar("firetruk2")
        end
        local Item3 = NativeUI.CreateItem("Engine 2", "Spawn FR Engine 2")
        Item3.Activated = function(ParentMenu, SelectedItem)
            spawnCar("firetruk4")
        end
        local Item4 = NativeUI.CreateItem("Rescue", "Spawn FR Rescue Truck")
        Item4.Activated = function(ParentMenu, SelectedItem)
            spawnCar("srescue1")
        end
        local Item5 = NativeUI.CreateItem("Ambulance", "Spawn FR Ambulance")
        Item5.Activated = function(ParentMenu, SelectedItem)
            spawnCar("ambulance")
        end
    submenu:AddItem(Item)
    submenu:AddItem(Item2)
    submenu:AddItem(Item3)
    submenu:AddItem(Item4)
    submenu:AddItem(Item5)
    end
end

function swatMenu(menu)
    local submenu = _menuPool:AddSubMenu(menu, "SWAT Vehicles")
    for i = 1, 1 do
        local Item = NativeUI.CreateItem("Bearcat", "Spawn SWAT Bearcat")
        Item.Activated = function(ParentMenu, SelectedItem)
            spawnCar("swat")
        end
        local Item2 = NativeUI.CreateItem("Tahoe", "Spawn SWAT Tahoe")
        Item2.Activated = function(ParentMenu, SelectedItem)
            spawnCar("sum2")
        end
        local Item3 = NativeUI.CreateItem("Charger", "Spawn SWAT Charger")
        Item3.Activated = function(ParentMenu, SelectedItem)
            spawnCar("sum1")
        end
    submenu:AddItem(Item)
    submenu:AddItem(Item2)
    submenu:AddItem(Item3)
    end
end

sheriffMenu(mainMenu)
fireMenu(mainMenu)
swatMenu(mainMenu)
_menuPool:RefreshIndex()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        _menuPool:ProcessMenus()
        if vehMenu == true then
            mainMenu:Visible(not mainMenu:Visible())
            vehMenu = false
        end
        if IsControlJustPressed(1, 166) and DoesEntityExist(ped) and CheckSkin(ped) then
            leoMenu:Visible(not leoMenu:Visible())
        end
    end
end)

-- End Vehicles Menu
-- Start LEO Menu
leoMenu = NativeUI.CreateMenu("LEO Toolbox", "~b~CRONUS GAMING LEO UTILITIES MENU")
_menuPool:Add(leoMenu)

function cuffOption(menu)
    local Item = NativeUI.CreateItem("Cuff", "Cuff the person closest to you")
    menu.OnItemSelect = function(sender, item, index)
        cuffPlayer()
    end
    menu:AddItem(Item)
end

function uncuffOption(menu)
    local Item = NativeUI.CreateItem("Uncuff", "Uncuff the person closest to you")
    menu.OnItemSelect = function(sender, item, index)
        uncuffPlayer()
    end
    menu:AddItem(Item)
end

function dragOption(menu)
    local Item = NativeUI.CreateItem("Drag", "Drag the person closest to you")
    menu.OnItemSelect = function(sender, item, index)
        dragPlayer()
    end
    menu:AddItem(Item)
end

function undragOption(menu)
    local Item = NativeUI.CreateItem("Undrag", "Undrag the person closest to you")
    menu.OnItemSelect = function(sender, item, index)
        undragPlayer()
    end
    menu:AddItem(Item)
end

function evehOption(menu)
    local Item = NativeUI.CreateItem("Make Player Enter Vehicle", "Make the person closest to you enter the vehicle closest to you")
    menu.OnItemSelect = function(sender, item, index)
        evehiclePlayer()
    end
    menu:AddItem(Item)
end

function lvehOption(menu)
    local Item = NativeUI.CreateItem("Make Player Exit Vehicle", "Make the person closest to you exit the vehicle closest to you")
    menu.OnItemSelect = function(sender, item, index)
        lvehiclePlayer()
    end
    menu:AddItem(Item)
end

function entityOption(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Spawn Objects")
    for i = 1, 1 do
        local Item = NativeUI.CreateItem("Steel Barrier", "Spawn Steel Barrier")
        Item.Activated = function(ParentMenu, SelectedItem)
            spawnEntity("prop_barrier_work04a")
        end
        local Item2 = NativeUI.CreateItem("Wood Barrier", "Spawn Wood Barrier")
        Item2.Activated = function(ParentMenu, SelectedItem)
            spawnEntity("prop_barrier_work05")
        end
        local Item4 = NativeUI.CreateItem("Road Work LED", "Spawn Road Work LED Sign")
        Item4.Activated = function(ParentMenu, SelectedItem)
            spawnEntity("prop_trafficdiv_01")
        end
    submenu:AddItem(Item)
    submenu:AddItem(Item2)
    submenu:AddItem(Item3)
    submenu:AddItem(Item4)
    end
end

function despawnOption(menu)
    local amount = {}
    for i = 1, 100 do amount[i] = i end
    local Item = NativeUI.CreateSliderItem("Despawn Objects", amount, 5, "Despawn all objects within a radius", false)
    menu.OnItemSelect = function(sender, item, index)
        rad = item:IndexToItem(index)
        despawnProp(rad)
    end
    menu:AddItem(Item)
end

cuffOption(leoMenu)
uncuffOption(leoMenu)
dragOption(leoMenu)
undragOption(leoMenu)
evehOption(leoMenu)
lvehOption(leoMenu)
despawnOption(leoMenu)
_menuPool:RefreshIndex()

-- Make Sure Player is in Correct PED
local skins = {
	"s_m_y_cop_01",
	"s_f_y_cop_01",
	"s_m_y_hwaycop_01",
	"s_m_y_sheriff_01",
	"s_f_y_sheriff_01",
	"s_m_y_ranger_01",
    "s_f_y_ranger_01",
    "csb_mweather",
    "s_m_m_armoured_01",
    "s_m_m_armoured_02",
    "s_m_y_blackops_02",
    "s_m_y_fireman_01",
    "s_m_y_grip_01",
    "s_m_y_marine_01",
    "s_m_y_marine_02",
    "s_m_y_marine_03",
    "s_m_y_ranger_01",
    "s_m_y_swat_01",
}

function CheckSkin(ped)
	for i = 1, #skins do
		if GetHashKey(skins[i]) == GetEntityModel(ped) then
			return true
		end
	end
	return false
end
