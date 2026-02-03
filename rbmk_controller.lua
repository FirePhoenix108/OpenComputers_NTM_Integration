local component = require("component")

local rbmkCons = component.rbmk_console 
local rod_level = io.read()

io.write("Type the level: ")

level = tonumber(rod_level)

if level then
    rbmkCons.setLevel(level)
    io.write(level)
end

