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
        _menuPool:ProcessMenus()
        if vehMenu == true then
            mainMenu:Visible(not mainMenu:Visible())
            vehMenu = false
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

cuffOption(leoMenu)
_menuPool:RefreshIndex()