--- This script is created to listen to incoming messages. You can use it
--- On multiple PC's.


local component = require("component")
local event = require("event")

local net = component.modem
local input = io.read()

io.write("Please, type the port you want to listen and receive messages: ")
local port = tonumber(input)

if port then
    net.open(port)
    io.write("Port opened on" .. port .. ".\n")
else
    io.write("Error: incorrect port or port already open.")
    return
end

while true do
    -- Wait for a message from another network card. (Yes, i copied it from the documentation.)
    local _, _, from, port, _, message = event.pull("modem_message")
    print("Got a message from " .. from .. " on port " .. port .. ": " .. tostring(message))
    os.sleep(0.5)
end
