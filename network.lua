--- This script will serve as a connection and message sender between multiple computers
--- or who know, even servers?

local component = require("component")
local sides = require("sides")
local serial = require("serialization")

local net = component.modem

local port
local message
local address
local portReceiver
local messageToSend

--- Fast check to see if the net card is wireless or not
if net.isWireless() then
    io.write("System detected you are using a wireless network card. Please, change script.")
    return
end

--- Port definer section for multiple communication with other PC's
io.write("Please, type the port number you want to use. Note: default port is 0 and the max is 65535.\n")
local  input = io.read()

if port == "" then
    port = 0
else
    port = tonumber(input)
end

if not port or port < 0 or port > 65535 then
    io.write("Error: you have entered an invalid value.")
    return
end

--- Opening the port with a check
if net.isOpen(port) then
    io.write("Error: the port is already open. Try with another one.\n")
else 
    net.open(port)
    io.write("Port successfully opened on " .. port .. "!\n")
end

--- This section is for sending messages from PC to PC

io.write("Please, select if you want to send a message to all PC or to a specific one.\nType 'Send' for one or multiple PC's, 'Broadcast' to all PC's.\n")
local message = io.read()

if message == "Send" or message == "send" then
    io.write("Please, specify the address of the receiver PC: ")
    local address = io.read()
    io.write("Please, specify the port of the receiver PC: ")
    local portReceiver = tonumber(io.read())
    io.write("Please, write the message to send: ")
    local messageToSend = io.read()
    if net.send(address, portReceiver, messageToSend) then
        io.write("Message sent!")
    else
        io.write("Error: unexpected error occured.")
    end
end

if message == "Broadcast" or message == "broadcast" then
    io.write("Please, specify the port you want to send the message to: ")
    local portReceiver = tonumber(io.read())
    io.write("Please, write the message to send: ")
    local messageToSend = io.read()
    if net.broadcast(portReceiver, messageToSend) then
        io.write("Message sent!")
    else
        io.write("Error: unexpected error occured.")
    end
end


