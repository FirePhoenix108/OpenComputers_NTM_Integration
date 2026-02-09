--- I hope this script won't activate for any chance.
--- If the script start to work, I'm sorry for you...
--- Jokes aside, this script is for an RBMK "failure", "meltdown" or explosion.

local component = require("component")
local sides = require("sides")
local os = require("os")
local fs = require("filesystem")

local rs = component.redstone
local rbmkFuel = component.rbmk_fuel_rod
local luaPath = "/home/important_files/member_grade.lua"
local dirPath = "/home/important_files"

if not component.isAvailable("redstone") then
    io.write("Error: Redstone Card not found.")
    return
end

if not component.isAvailable("rbmk_fuel_rod") then
    io.write("Error: RBMK Fuel Rod Column not found.")
    return
end

local MAX_SIGNAL = 15
local REQUIRED_GRADE = 7
local alarm = false

---- Check to see if the user info dir exists
if not fs.exists(dirPath) then
    io.write("User directory database not found. ")
    io.write("Creating it for you...\n")
    fs.makeDirectory(dirPath)
    io.write("A directory in /home named important_files has been created!\n")
    io.write("Please, run again the program to make changes effective.\n")
    return
end

---- Check to see if the .lua file of the user info exists
if not fs.exists(luaPath) then
    io.write("")
end

local function loadUsers()
    if not fs.exists(path) then
        return {}
    end
    return dofile(path)
end

while true do
    local status, heat = pcall(rbmkFuel.getHeat)

    if not status or heat == nil then
        io.write("\n----ALARM ACTIVATED----\n")
        rs.setOutput(sides.left, MAX_SIGNAL)
        alarm = true
        break
    end

    os.sleep(0.5)
end

while alarm do
    io.write("ALARM DETECTED. \nPLEASE, TYPE YOUR PASSWORD TO DEACTIVATE. (Must be an authorized member)\n")

    io.write("Username: ")
    local username = io.read()

    io.write("Password: ")
    local password = io.read()

    local users = loadUsers()
    local user = users[username]

    if user and user.password == password and user.grade >= REQUIRED_GRADE then
        rs.setOutput(sides.left, 0)
        io.write("ALARM DEACTIVATED\n")
        alarm = false
    else
        io.write("ACCESS DENIED\n")
    end

    os.sleep(0.5)
end
