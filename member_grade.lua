--- This is a sort of storage for the users.
local fs = require("filesystem")
local sz = require("serialization")

io.write("WARNING!\n")
io.write("This is the user database. Please be careful to what you are doing here!\n\n\n")

local usersInfo = "/home/database/users.txt"
local databaseDir = "/home/database"

if not fs.exists(databaseDir) then
    io.write("WARNIGN!\nThe directory is missing.\n")
    io.write("Creating it for you...\n\n\n")
    fs.makeDirectory("/home/database")
    os.sleep(1.0)
    io.write("A directory in /home named database has been created!\n")
    io.write("Please, run again the program to make changes effective.\n")
    return
end


--- This function let you put in the .txt file the info
local function databaseSave(usersInfo, dataTable)
    local f = io.open(usersInfo, "w")
    if f then
        local serializedString = sz.serialize(dataTable)
        f:write(serializedString)
        f:close()
        return true
    end
    return false
end

--- Reading function, to see the database content
local function databaseRead(usersInfo)
    local r = io.open(usersInfo, "r")
    if not r then
        return {}
    end
    local content = r:read("*a")
    r:close()
    local savedInfo = sz.unserialize(content)
    return savedInfo or {}
end

os.sleep(1.0)

local input = ""

while input ~= "q" do
    io.write("\n1: New User | 2: View Database | q: Exit\n")
    io.write("Choice: ")
    input = io.read()

    if input == "1" then
        io.write("Please write the username: ")
        local username = io.read()
        io.write("Please write the password: ")
        local pssw = io.read()
        local newUser = { password = pssw }
        local database = databaseRead(usersInfo)
        database[username] = newUser
        databaseSave(usersInfo, database)
        io.write("User succesfully created!\n")
    end

    if input == "2" then 
        io.write("---- REGISTERED USERS LIST ----\n")
        local database = databaseRead(usersInfo)
        for username, info in pairs(database) do
            io.write("\nUser: " .. username .. " | Password: " .. info.password)
        end

        io.write("---------------------------\n")
    end
end

io.write("\n")
os.execute("main.lua")


