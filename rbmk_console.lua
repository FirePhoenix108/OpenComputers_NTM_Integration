--- This script is the RBMK Console
--- From this script you can do multiple things that you can do with the RBMK Console too
--- But in a cooler way (for me :P)
--- Consider that you can use the single scripts too, for a signle server or PC, but for this purpose is better to use a server
--- since it can support more components.


local component = require("component")
local fs = require("filesystem")

--- All RBMK components and GPU
local boiler = component.rbmk_boiler
local rod = component.rbmk_fuel_rod
local control = component.rbmk_control_rod
local console = component.rbmk_console
local gpu = component.gpu


local input = ""

local background = gpu.setBackground(0x0000C0)

local rbmkConsoleMenu = [[

------RBMK CONSOLE------
Please, choose what component you want to monitor:  
1. Fuel Rods info.
2. Steam Channels controller.
3. Control Rods controller.
4. Tanks info.
5. Turbines info.
6. Batteries controller.
0. Exit.
]]

while input ~= "0" do
    io.write(rbmkConsoleMenu .. "\n\n")
    input = io.read()
    local space = "\n\n"
    if input == "1" then
        local addr = gpu.getScreen()
        io.write(addr)
    end
    os.sleep(1.0)
end

shell.execute("main.lua")
