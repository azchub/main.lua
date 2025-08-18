local url = "https://raw.githubusercontent.com/vtxontop/main.lua/refs/heads/main/vtx.lua" -- 🔗 غير الرابط هنا

local success, result = pcall(function()
    return game:HttpGet(url)
end)

if success and result and #result > 0 then
    print("✅ تم تحميل السكربت من الرابط!")
    local func, err = loadstring(result)
    if func then
        func() -- تشغيل السكربت
    else
        warn("⚠️ فشل في تحويل السكربت: ".. tostring(err))
    end
else
    warn("❌ فشل في جلب السكربت من الرابط. تأكد إن الرابط صحيح ويعطي كود (RAW).")
end
