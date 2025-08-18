-- Loader Script
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- إنشاء ScreenGui إذا ما كان موجود
local ScreenGui = PlayerGui:FindFirstChild("VTX_GUI")
if not ScreenGui then
    ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "VTX_GUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = PlayerGui
end

-- تحميل سكربت خارجي (vtx.lua)
local success, response = pcall(function()
    return game:HttpGet("https://raw.githubusercontent.com/vtxontop/main.lua/refs/heads/main/vtx.lua")
end)

if success then
    local func = loadstring(response)
    if func then
        func()
        warn("✅ VTX Script Loaded Successfully")
    else
        warn("⚠️ Failed to compile vtx.lua")
    end
else
    warn("⚠️ Error loading vtx.lua: ", response)
end
