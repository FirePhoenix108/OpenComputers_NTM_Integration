--- This is a sort of storage for the users.
local fs = require("filesystem")
local sz = require("serialization")

io.write("WARNING!\n")
io.write("This is the user database. Please be careful to what you are doing here!\n\n\n")

local usersInfo = "/home/database/users.txt"


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

io.write("Do you want to make a new user or see the already registered ones?\n(Write '1' for new user or '2' to watch the database)...\n")
local input = io.read()

if input == 1 then
    io.write("Please write the username: ")
    local username = io.read()
    io.write("Please write the password: ")
    local pssw = io.read()
    local newUser = { password = pssw }
    local database = databaseRead(usersInfo)
    database[username] = newUser
    databaseSave(usersInfo, database)
    io.write("User succesfully created!")
    return
end

if input == 2 then 
    io.write("---- REGISTERED USERS LIST ----")
    local database = databaseRead(usersInfo)
    for username, info in pairs(database) do
        io.write("User: " .. username .. " | Password: " .. info.password)
    end

    io.write("---------------------------")
end

