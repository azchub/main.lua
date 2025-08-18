-- Loader.lua
local url = "https://raw.githubusercontent.com/vtxontop/main.lua/refs/heads/main/vtx.lua"

local success, response = pcall(function()
    return game:HttpGet(url)
end)

if success and response and #response > 0 then
    local func, err = loadstring(response)
    if func then
        print("✅ تم تحميل vtx.lua وتشغيله")
        func()
    else
        warn("❌ خطأ في تحويل الكود:", err)
    end
else
    warn("❌ فشل تحميل الملف من الرابط")
end
