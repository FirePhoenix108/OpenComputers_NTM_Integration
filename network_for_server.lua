--- This script is only for servers. The purpose of it, is to use a server as an "middle man"
--- So request and message sent pass trough the server you use, and then to a PC.
--- You can use this script to do multiple things, such as identify all PC's connected,
--- Send messages, open ports and much more.


local component = require("component")
local event = require("event")

local serverNet = component.modem
local serverPort

while true do
    io.write("Please, type a valid port for this server (0 to 65535): ")
    local input = io.read()
    serverPort = tonumber(input) or 0

    if serverPort < 0 or serverPort > 65535 then
        io.write("Error: invalid port.")
    elseif serverNet.isOpen(serverPort) then
        io.write("Error: this port is already open. Try with another one.")
    else
        serverNet.open(serverPort)
        io.write("Port succesfully opened on " .. serverPort .. "!\n")
        break
    end
end

while true do
    local _, _, from, port, _, message = event.pull("modem_message")

    if port == serverPort then
        io.write("Messaggio ricevuto da " .. from .. ": " .. tostring(message)"\n")
        serverNet.send(from, serverPort, "Received.")
    end
end
