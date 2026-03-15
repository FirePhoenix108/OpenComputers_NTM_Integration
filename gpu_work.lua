--- Just a test script. Don't worry about it.


local component = require("component")
local fs = ("filesystem")

local gpu = component.gpu

local res_h, res_w = gpu.getResolution()

io.write("Width: " .. res_w)
io.write("Height: " .. res_h)

if res_h > 160 and res_w > 50 then
    local maxResSupported = gpu.setResolution(res_w, res_h)
    if maxResSupported then
        io.write("Resolution set!")
    else
        io.write("Error.")
    end
end