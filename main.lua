--- This is the main lua file for controlling any script at your choice.
--- You can still choose scripts alone, but for this main script
--- There are modified versions of those scripts.

local component = require("component")
local fs = require("filesystem")

local menu = [[
----MENU'----
1. RBMK Console.
2. Network seeker.
3. Broadcaster.
4. Messanger.
5. Port Scanner.
6. User database.


]]

io.write(menu)

local choice = io.read() 

io.write("\n\n")

if choice == "1" then
    sehll.execute("rbmk_console.lua")
else
    io.write("Error: Please enter a valid option.")
    sehll.execute("main.lua")
end

if choice == "6" then
    sehll.execute("member_grade.lua")
end

if choice == "debug" then
    os.exit()
end