--- This script is created to listen to incoming messages. You can use it
--- On multiple PC's.


local component = require("component")

local net = component.modem
local input = io.read()

io.write("Please, type the port you want to listen and receive messages: ")
local port = tonumber(input)

while true do


    -- Wait for a message from another network card. (Yes, i copied it from the documentation.)
    local _, _, from, port, _, message = event.pull("modem_message")
    print("Got a message from " .. from .. " on port " .. port .. ": " .. tostring(message))
    os.sleep(0.5)
end
