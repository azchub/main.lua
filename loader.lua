local success, response = pcall(function()
    return game:HttpGet("https://raw.githubusercontent.com/USERNAME/REPONAME/main/loader.lua")
end)

if success and response and response ~= "" then
    local func, err = loadstring(response)
    if func then
        func()
    else
        warn("❌ خطأ أثناء تحويل الكود: " .. tostring(err))
    end
else
    warn("❌ فشل تحميل الملف من GitHub. تأكد من الرابط أو من وجود الملف loader.lua في المستودع.")
end
