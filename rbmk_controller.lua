local component = require("component")

local rbmk_ctrl_rod = rbmk_control_rod.component 
local rod_level = io.read()

io.write("Type the level: ")

level = tonumber(rod_level)

rbmk_ctrl_rod = setLevel(level)

