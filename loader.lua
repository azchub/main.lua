--// VTX Simple Secure Loader (Base64)
local PASTE_URL = "https://pastebin.com/raw/XXXXXXXX" --<< حط رابط الـ Raw هنا

-- ==== HTTP Fallbacks ====
local function http_get(url)
    -- synapse / script-ware style
    if syn and syn.request then
        local r = syn.request({Url = url, Method = "GET"})
        return r and r.Body
    end
    if http and http.request then
        local r = http.request({Url = url, Method = "GET"})
        return r and r.Body
    end
    if request then
        local r = request({Url = url, Method = "GET"})
        return r and r.Body
    end
    -- Roblox (بعض المنفّذات تغلّفها)
    if game and game.HttpGet then
        local ok, body = pcall(game.HttpGet, game, url)
        if ok then return body end
    end
    return nil, "لا يوجد دالة HTTP مناسبة في الإكزكيوتر."
end

-- ==== Base64 Decode ====
local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/' -- لا تعدّل
local function b64dec(data)
    data = data:gsub("%s+", ""):gsub("[^%w%+%/%=]", "")
    local t = {}
    for i=1, #data, 4 do
        local c1 = b:find(data:sub(i,i), 1, true) or 0
        local c2 = b:find(data:sub(i+1,i+1), 1, true) or 0
        local c3 = b:find(data:sub(i+2,i+2), 1, true) or 0
        local c4 = b:find(data:sub(i+3,i+3), 1, true) or 0
        local n = (c1-1)<<18 | (c2-1)<<12 | ((c3-1)&63)<<6 | ((c4-1)&63)
        local a = string.char((n>>16)&255)
        local b2 = string.char((n>>8)&255)
        local c = string.char(n&255)
        if data:sub(i+2,i+2) == '=' then
            table.insert(t, a)
        elseif data:sub(i+3,i+3) == '=' then
            table.insert(t, a..b2)
        else
            table.insert(t, a..b2..c)
        end
    end
    return table.concat(t)
end

-- ==== Load helper ====
local _load = loadstring or load -- عشان بعض الإكزكيوترات
local function safe_load(src, chunkname)
    local ok, fn = pcall(_load, src, chunkname or "VTX_chunk")
    if not ok then return nil, "Compile error: "..tostring(fn) end
    local ok2, err = pcall(fn)
    if not ok2 then return nil, "Runtime error: "..tostring(err) end
    return true
end

-- ==== Run ====
local body, httpErr = http_get(PASTE_URL)
if not body then
    warn("[VTX Loader] فشل تحميل النص من الرابط: ", httpErr)
    return
end

-- تنظيف أي محارف غريبة
body = body:gsub("\239\187\191", "") -- شيل BOM لو موجود

-- لازم يكون المحتوى Base64 فقط
local decoded, derr = b64dec(body), nil
if not decoded or #decoded == 0 then
    warn("[VTX Loader] فشل فك Base64: تأكد أن الـ Pastebin يحتوي نص Base64 فقط (بدون أكواد Lua).")
    return
end

local ok, err = safe_load(decoded, "VTX_deobf")
if not ok then
    warn("[VTX Loader] فشل تشغيل السكربت: ", err)
else
    print("[VTX Loader] ✅ تم التحميل والتشغيل بنجاح")
end
