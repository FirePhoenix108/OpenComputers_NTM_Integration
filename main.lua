--- This is the main lua file for controlling any script at your choice.
--- You can still choose scripts alone, but for this main script
--- There are modified versions of those scripts.

local component = require("component")
local fs = require("filesystem")

local menu = [[
----MENU'----
1. RBMK Console (Emergency use only!).
2. Network seeker.
3. Broadcaster.
4. Messanger.
5. Port Scanner.
6. User database.


]]

io.write(menu)

local input = io.read()
local choice = tonumber(input)

io.write("\n\n")

if choice == 1 then

end

if choice == 6 then
    os.execute("member_grade.lua")
end
