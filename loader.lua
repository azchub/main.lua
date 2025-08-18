local url = "https://raw.githubusercontent.com/vtxontop/r3d/main/vtxx.lua"

local success, response = pcall(function()
    return game:HttpGet(url)
end)

if success and response and response ~= "" then
    local func, err = loadstring(response)
    if func then
        print("✅ تم تحميل vtxx.lua ")
        func()
    else
        warn("❌ خطأ أثناء تحويل الكود: " .. tostring(err))
    end
else
    warn("❌ فشل تحميل الملف من GitHub. تأكد من الرابط أو من وجود vtxx.lua في المستودع r3d.")
end


----- vtx on toppp
