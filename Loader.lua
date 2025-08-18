-- Loader.lua
local url = "https://pastebin.com/raw/wXggQD5S"
local success, response = pcall(function()
    return game:HttpGet(url)
end)

if success then
    loadstring(response)()
else
    warn("فشل التحميل من Pastebin:", response)
end
