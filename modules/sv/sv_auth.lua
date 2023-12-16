-- Generate and print the encrypted auth code
local encryptedAuthCode = generateAuthCode()
print(encryptedAuthCode)
if not encryptedAuthCode then return print('Failed to Generate Code') end
local Auth = encryptedAuthCode


local GetAuth = function()
    return Auth 
end
exports('Auth', GetAuth) -- exports['StiX-Auth']:Auth()



lib.callback.register('reality-api:server:Auth', GetAuth)