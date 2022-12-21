-- v.0.0.1

-- Temp fix for ROBLOX turning off highlights
if setfflag then setfflag("OutlineSelection", "true") end

-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local CoreGui = game:GetService("CoreGui");
local Players = game:GetService("Players");
local Workspace = game:GetService("Workspace");
local Lighting = game:GetService("Lighting");
local VirtualInputManager = game:GetService("VirtualInputManager");

-- Remote Stuff
local Events = ReplicatedStorage:WaitForChild("Events", 1337)

-- Local Player
local Player = Players.LocalPlayer;

-- UI Lib (Fluxus Lib because I like it)
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tekuuu/Lib/main/fluxusLIB.lua"))()

-- ESP support
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/tekuuu/esp/main/highlightoutline.lua"))()

-- Main Window
local Window = lib:CreateWindow("Evade ; Made by moe")

-- Create Pages
local MainPage = Window:NewTab("Main")

-- Create Sections
local ESPSection = MainPage:AddSection("Esp stuff")
local moeSection = MainPage:AddSection("moe ;-;")

-- GUI Toggles / Settings
local Highlights_Active = false;
local AI_ESP = false;
local No_CamShake = false;

-- Anti AFK
for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do v:Disable() end

-- Simple Text ESP
function Simple_Create(base, name, trackername, studs)
    local bb = Instance.new('BillboardGui', game.CoreGui)
    bb.Adornee = base
    bb.ExtentsOffset = Vector3.new(0,1,0)
    bb.AlwaysOnTop = true
    bb.Size = UDim2.new(0,6,0,6)
    bb.StudsOffset = Vector3.new(0,1,0)
    bb.Name = trackername

    local frame = Instance.new('Frame', bb)
    frame.ZIndex = 10
    frame.BackgroundTransparency = 0.3
    frame.Size = UDim2.new(1,0,1,0)
    frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

    local txtlbl = Instance.new('TextLabel', bb)
    txtlbl.ZIndex = 10
    txtlbl.BackgroundTransparency = 1
    txtlbl.Position = UDim2.new(0,0,0,-48)
    txtlbl.Size = UDim2.new(1,0,10,0)
    txtlbl.Font = 'ArialBold'
    txtlbl.FontSize = 'Size12'
    txtlbl.Text = name
    txtlbl.TextStrokeTransparency = 0.5
    txtlbl.TextColor3 = Color3.fromRGB(255, 0, 0)

    local txtlblstud = Instance.new('TextLabel', bb)
    txtlblstud.ZIndex = 10
    txtlblstud.BackgroundTransparency = 1
    txtlblstud.Position = UDim2.new(0,0,0,-35)
    txtlblstud.Size = UDim2.new(1,0,10,0)
    txtlblstud.Font = 'ArialBold'
    txtlblstud.FontSize = 'Size12'
    txtlblstud.Text = tostring(studs) .. " Studs"
    txtlblstud.TextStrokeTransparency = 0.5
    txtlblstud.TextColor3 = Color3.new(255,255,255)
end

-- Clear ESP
function ClearESP(espname)
    for _,v in pairs(game.CoreGui:GetChildren()) do
        if v.Name == espname and v:isA('BillboardGui') then
            v:Destroy()
        end
    end
end

-- Respawn
ESPSection:AddButton("Respawn", "no robux involved", function()
game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
end)

-- Character Highlights
ESPSection:AddButton("Character Highlights", "Highlights everyone so u can see them", function()
    ESP:ClearESP();
    Highlights_Active = true;

    for i, v in ipairs(Players:GetPlayers()) do
        if v ~= Player then
            v.CharacterAdded:Connect(function(Char)
                ESP:AddOutline(Char)
                ESP:AddNameTag(Char)
            end)

            if v.Character then
                ESP:AddOutline(v.Character)
                ESP:AddNameTag(v.Character)
            end
        end
    end
end)

-- AI Text ESP
ESPSection:AddToggle("Bot ESP", "Says the name of the bots and their distance", false, function(bool)
    AI_ESP = bool;
end)

-- No Camera Shake
ESPSection:AddToggle("No Camera Shake", "Removes camera shake that the bots give u", false, function(bool)
    No_CamShake = bool;
end)

-- moe ;-; copy tag
moeSection:AddButton("Copy moes tag", "Copies his tag (he has frqs off)", function() -- HAHAHHEAHEHAHEHE
    setclipboard("mоe#1003")
end)

-- [[ Helpers / Loop Funcs ]] --

-- Highlight helper
game:GetService("Players").PlayerAdded:Connect(function(Player)
    Player.CharacterAdded:Connect(function(Char)
        if Highlights_Active then
            ESP:AddOutline(Char)
            ESP:AddNameTag(Char)
        end
    end)
end)

-- Target only Local Player
Player.CharacterAdded:Connect(function(Char)
    local Hum = Char:WaitForChild("Humanoid", 1337);
    end)


-- ESP AI
task.spawn(function()
    while task.wait(0.05) do
        if AI_ESP then
            pcall(function()
                ClearESP("AI_Tracker")
                local GamePlayers = Workspace:WaitForChild("Game", 1337).Players;
                for i,v in pairs(GamePlayers:GetChildren()) do
                    if not game.Players:FindFirstChild(v.Name) then -- Is AI
                        local studs = Player:DistanceFromCharacter(v.PrimaryPart.Position)
                        Simple_Create(v.HumanoidRootPart, v.Name, "AI_Tracker", math.floor(studs + 0.5))
                    end
                end
            end)
        else
            ClearESP("AI_Tracker");
        end
    end
end)

-- Camera Shake
task.spawn(function()
    while task.wait() do
        if No_CamShake then
            Player.PlayerScripts:WaitForChild("CameraShake", 1234).Value = CFrame.new(0,0,0) * CFrame.Angles(0,0,0);
        end
    end
end)

game:GetService("Players").LocalPlayer:GetMouse().KeyDown:connect(function(dbb)
if string.lower(dbb)=="v"then if game:GetService("CoreGui").FluxHub.Frame.Visible==true then game:GetService("CoreGui").FluxHub.Frame.Visible=false elseif game:GetService("CoreGui").FluxHub.Frame.Visible==false then
game:GetService("CoreGui").FluxHub.Frame.Visible=true end end end)
