This script is just a simple security check for securing unsecured events

this does require [ox_lib](https://github.com/overextended/ox_lib/releases) for the callbacks

below are the callbacks needed to run the code

```lua
--Client
local security = lib.callback.await('reality-api:server:Auth', false) -- this passes the security code genereated from the server


--Server
local check = exports['StiX-Auth']:Auth() -- you would add this check in your event on the server side and pass the above security code to check to make sure data is valid
if check ~= auth then
    return exports.qbx_core:ExploitBan(source, 'Using Lua Executor') -- you can replace this with your own ban export or trigger
end



-- Example 

-- Client 
local maxReward = lib.callback.await('reality-api:server:Auth', false)
TriggerServerEvent('server:sellRewardItems', maxReward)

-- Server 
RegisterServerEvent('server:sellRewardItems')
AddEventHandler('server:sellRewardItems', function(auth)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local check = exports['StiX-Auth']:Auth()
    if check ~= auth then
       return exports.qbx_core:ExploitBan(source, 'Using Lua Executor')
    end
end)
```


if you need any support or help DM me on discord coldstix#0

thank you for using my script Suggestions are welcomed, and this script is free, there is no need to edit the script as it works. THIS WILL NOT PREVENT CHEATERS FROM USING TROLL FEATURES, ONLY BAN FOR TRIGGERING ANY KINDA EVENT YOU DO NOT WANT TRIGGERED MANUALLY.