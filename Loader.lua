-- Loader.lua
local url = "https://raw.githubusercontent.com/vtxontop/main.lua/refs/heads/main/vtx.lua"
local success, response = pcall(function()
    return game:HttpGet(url)
end)

if success then
    loadstring(response)()
else
    warn("فشل تحميل السكربت من الرابط: " .. tostring(response))
end
