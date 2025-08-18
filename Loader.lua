-- Loader.lua
local url = "https://raw.githubusercontent.com/vtxontop/main.lua/refs/heads/main/vtx.lua"

local success, response = pcall(function()
    return game:HttpGet(url)
end)

if success then
    local func, loadError = loadstring(response)
    if func then
        func()
    else
        warn("خطأ في تشغيل السكربت:", loadError)
    end
else
    warn("فشل الاتصال بالرابط:", response)
end
