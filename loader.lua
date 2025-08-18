-- loader.lua
local url = "https://raw.githubusercontent.com/vtxontop/main.lua/main/main.lua"

local success, response = pcall(function()
    return game:HttpGet(url)
end)

if success and response and response ~= "" then
    local func, err = loadstring(response)
    if func then
        print("✅ تم تحميل main.lua من GitHub")
        func()
    else
        warn("❌ خطأ أثناء تحويل الكود: " .. tostring(err))
    end
else
    warn("❌ فشل تحميل الملف من GitHub. تأكد من الرابط أو من وجود main.lua في المستودع.")
end
