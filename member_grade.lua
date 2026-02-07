--- This is a sort of storage for the users.
local fs = require("filesystem")
local sz = require("serialization")

io.write("WARNING!\n")
io.write("This is the user database. Please be careful to what you are doing here!\n\n\n")

local usersInfo = "/home/database/users.txt"

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

io.write("Do you want to make a new user or see the already registered ones?\n(Write '1' for new user or '2' to watch the database)...\n")
local input = io.read()

if input == 1 then
    if 
    io.write("Please write the username: ")
end


local users = {
    powerPlantDirector = {
        password = "1234",
        grade = 10
    },
    worker = {
        password = "1245",
        grade = 3
    }
}

return users
