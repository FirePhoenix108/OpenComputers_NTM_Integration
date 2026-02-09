--- I know it's the same thing as before, but i want to do
--- separate things. If you like it, good. If not, make your own!

local component = require("component")
local sides = require("sides")

local MAX_SIGNAL = 15

local rs = component.redstone

local possibleSides = {
    ["1"] = sides.bottom,   ["4"] = sides.front,
    ["2"] = sides.top,     ["5"] = sides.right,
    ["3"] = sides.back,     ["6"] = sides.left,
}

local choosenSide = possibleSides[sideChoosen]

while true do
    print("Please, choose a value between 0 and 15, or if you want to exit, type 'q'.")
    local inputSignal = io.read()

    if inputSignal == "q" then
        print("Closing programm...")
        return
    end

    if inputSignal < 0 or inputSignal > MAX_SIGNAL then
        print("Error: please, type a value between 1 and 15.")
        local inputSignal = io.read()
    end

    if inputSignal >= 0 and inputSignal <= MAX_SIGNAL then
        local finalSignal = inputSignal
    end

    print("Please, specify what side you want the output: ")
    local side = io.read()

    rs.setOutput(choosenSide, finalSignal)
    print("Output sent from " .. choosenSide .. " with strengh signal of " .. finalSignal .. ".")
end