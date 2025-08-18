local HttpService = game:GetService("HttpService")

-- رابط vtx.lua من Pastebin (raw link)
local url = "https://raw.githubusercontent.com/vtxontop/main.lua/refs/heads/main/vtxx.lua" -- غير XXXXX برابطك

local success, response = pcall(function()
    return game:HttpGet(url)
end)

if success and response then
    local decoded
    pcall(function()
        decoded = HttpService:Base64Decode(response)
    end)

    if decoded then
        loadstring(decoded)()
    else
        warn("❌ فشل ككه فك التشفير (Base64 غير صحيح)")
    end
else
    warn("❌ فشل تحميل الرابط")
end
