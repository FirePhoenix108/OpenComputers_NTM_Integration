local internet = require("internet")
local component = require("component")

local internet = component.internet

io.write("Do you want to open a new port?")
local openPort = io.read()

if openPort == "Yes" or openPort == "yes" then
    io.write("Please, write the port number: ")
    local portNumber = tonumber(io.read())
    if portNumber >= 0 and portNumber <= 65535 then
        internet.connect(portNumber)
        io.write("Port succesfully opened on " ..portNumber..".")
    else
        io.write("Port number is not valid. Please, write a valid one.")
        portNumber = tonumber(io.read())
    end
else
    io.write("Exiting the program...")
    os.sleep(0.5)
    return
end