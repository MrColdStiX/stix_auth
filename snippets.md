### Security Script for Event Handling

This script provides a basic security check designed to secure unsecured events in your resources. It's important to note that this script requires the [ox_lib](https://github.com/overextended/ox_lib/releases) library for its callback functionalities.

#### Necessary Callbacks

The script uses specific callbacks that need to be implemented in both the client and server sides of your resource.

**Client-side Code:**

```lua
-- Client
-- This retrieves the security code generated from the server
local security = lib.callback.await('stix_auth:server:Auth', false)
```

**Server-side Code:**

```lua
-- Server
-- Add this check in your event on the server side and verify the security code
local check = exports['StiX-Auth']:Auth()
if check ~= auth then
    -- Replace this with your own ban export or trigger as needed
    return exports.qbx_core:ExploitBan(source, 'Using Lua Executor')
end
```

#### Example Usage

The following example demonstrates how to implement this security check in a client-server event.

**Client Example:**

```lua
-- Client
-- Requesting the security code from the server
local maxReward = lib.callback.await('stix_auth:server:Auth', false)
TriggerServerEvent('server:sellRewardItems', maxReward)
```

**Server Example:**

```lua
-- Server
-- Handling the sell reward items event
RegisterServerEvent('server:sellRewardItems')
AddEventHandler('server:sellRewardItems', function(auth)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local check = exports['StiX-Auth']:Auth()
    if check ~= auth then
        return exports.qbx_core:ExploitBan(source, 'Using Lua Executor') -- you can use your own ban or kick triggers
    end
end)
```

### Support and Suggestions

For support or to provide suggestions, feel free to reach out to me on Discord: coldstix#0.

**Note:** This script is free to use and doesn't require modifications for basic functionality. It's designed to ban users for triggering any undesired event manually but does not prevent cheaters from using troll features.
