-- Simple hashing function
function simpleHash(input)
    local hash = 0
    for i = 1, #input do
        local char = string.byte(input, i)
        hash = ((hash << 5) - hash) + char
        hash = hash & 0xFFFFFFFF -- Convert to 32bit integer
    end
    return string.format("%x", hash)
end

-- Function to generate and hash the auth code
function generateAuthCode()
    local randomPart1 = math.random(1000000000000000, 9999999999999999)
    local randomPart2 = math.random(1000000000000000, 9999999999999999)
    local auth = tostring(randomPart1) .. '-RRP-' .. tostring(randomPart2)

    -- Hashing the auth code
    local encryptedAuth = simpleHash(auth)

    print('^1Authentication ^7Code ^2Generated - ' .. encryptedAuth)
    return encryptedAuth
end

AddEventHandler('onResourceStart', function(resource)
    if 'stix_auth' ~= GetCurrentResourceName() then
        lib.print.error('PLEASE RENAME THE SCRIPT BACK TO "stix_auth" stop being weird.')
        StopResource(GetCurrentResourceName())  
    end
end)