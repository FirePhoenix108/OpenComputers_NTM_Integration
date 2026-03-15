--- This script is used to power on and off lamps or wathever block it can receive
--- A redstone signal to power on

local component = require("component")
local sides = require("sides")

local rs = component.redstone

local MAX_SIGNAL = 15
local outputSide = {
    ["Bottom"] = sides.bottom,  ["Front"] = sides.front,
    ["Top"] = sides.top,        ["Right"] = sides.right,
    ["Back"] = sides.back,       ["Left"] = sides.left,
}

local sideChoosen = nil

if not component.isAvailable("redstone") then
    print("No Redstone Card found.")
    break
end

while true do
    print("Please, type the value of the redstone signal you want to output: ")
    local inputSignal = io.read()

    if inputSignal or inputSignal < 1 and inputSignal > MAX_SIGNAL then
        print("Error: please, type a valid value (1 to 15): ")
        local inputSignal = io.read()
    else 
        print("Choose the side of the output: ")
        local sideInput = io.read()
        sideChoosen = outputSide[sideInput]
    end

    if not sideChoosen then
        print("Error: type a valid side: ")
        local sideInput = io.read()
    else
        rs.setOutput(sideChoosen, inputSignal)
        print("Output= Side " .. sideChoosen .. "\nSignal " .. inputSignal .. ".")
    end
end
    

        

    




