-- v.0.0.6

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

if game.Players.LocalPlayer.UserId == 2752075667 then

checkcaller = checkcaller
newcclosure = newcclosure
hookmetamethod = hookmetamethod
            
getgenv().RVVZToggleKey = "r"
local Notify = false
            
--// Notification Toggle On and Off
game:GetService("Players").LocalPlayer:GetMouse().KeyDown:Connect(function(MoeDesync)
if MoeDesync == string.lower(getgenv().RVVZToggleKey) then
pcall(function()
if Notify == false then
Notify = true
game:GetService("StarterGui"):SetCore("SendNotification", {
Title = "ON";
Text = "RVV is now turned on :3";
Icon = "rbxassetid://1407578497&w=180&h=180 true";
Duration = 5
})
elseif Notify == true then
Notify = false
game:GetService("StarterGui"):SetCore("SendNotification", {
Title = "OFF";
Text = "RVV is off";
Icon = "rbxassetid://1407578497&w=180&h=180 true";
Duration = 5
})
end
end)
end
end)
            
--// rvvz On and Off
local DesyncTypes = {}
local moeheartbeat = game:GetService("RunService").heartbeat:Connect(function()
if Notify == true then
        for i,v in pairs(game.Players["88pov"].Character.Head:GetChildren()) do
        if v:IsA("Weld") then
        v:Destroy()
        end
        end
        for i,v in pairs(game.Players["88pov"].Character:GetChildren()) do
        if v:IsA("Accessory") then
        v:Destroy()
        end
        end
        for i,v in pairs(game.Players["88pov"].Character.Head:GetChildren()) do
        if game.Players["88pov"].Character.Head:FindFirstChild("face") then
        game.Players["88pov"].Character.Head:FindFirstChild("face"):Destroy()
        end
        end
        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function _(_, a, b, d, c, e)
            local f = Instance.new("Weld")
            f.Name = _
            f.Part0 = b
            f.Part1 = d
            f.C0 = c
            f.C1 = e
            f.Parent = a
            return f
        end
        local function a(_, b)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == b then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = a(_, b)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(e, c)
            c.Parent = e
            local d = c:FindFirstChild("Handle")
            if d then
                local b = d:FindFirstChildOfClass("Attachment")
                if b then
                    local _ = a(e, b.Name)
                    if _ then
                        l(_, b)
                    end
                else
                    local e = e:FindFirstChild("Head")
                    if e then
                        local b = CFrame.new(0, 0, 0)
                        local a = c.AttachmentPoint
                        _("HeadWeld", e, e, d, b, a)
                    end
                end
            end
        end
        local _ = 1125510
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players["88pov"].Character, _)
        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function _(_, a, b, d, c, e)
            local f = Instance.new("Weld")
            f.Name = _
            f.Part0 = b
            f.Part1 = d
            f.C0 = c
            f.C1 = e
            f.Parent = a
            return f
        end
        local function a(_, b)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == b then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = a(_, b)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(e, c)
            c.Parent = e
            local d = c:FindFirstChild("Handle")
            if d then
                local b = d:FindFirstChildOfClass("Attachment")
                if b then
                    local _ = a(e, b.Name)
                    if _ then
                        l(_, b)
                    end
                else
                    local e = e:FindFirstChild("Head")
                    if e then
                        local b = CFrame.new(0, 0, 0)
                        local a = c.AttachmentPoint
                        _("HeadWeld", e, e, d, b, a)
                    end
                end
            end
        end
        local _ = 1235488
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players["88pov"].Character, _)
        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function _(_, a, b, d, c, e)
            local f = Instance.new("Weld")
            f.Name = _
            f.Part0 = b
            f.Part1 = d
            f.C0 = c
            f.C1 = e
            f.Parent = a
            return f
        end
        local function a(_, b)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == b then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = a(_, b)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(e, c)
            c.Parent = e
            local d = c:FindFirstChild("Handle")
            if d then
                local b = d:FindFirstChildOfClass("Attachment")
                if b then
                    local _ = a(e, b.Name)
                    if _ then
                        l(_, b)
                    end
                else
                    local e = e:FindFirstChild("Head")
                    if e then
                        local b = CFrame.new(0, 0, 0)
                        local a = c.AttachmentPoint
                        _("HeadWeld", e, e, d, b, a)
                    end
                end
            end
        end
        local _ = 8796225
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players["88pov"].Character, _)
        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function _(_, a, b, d, c, e)
            local f = Instance.new("Weld")
            f.Name = _
            f.Part0 = b
            f.Part1 = d
            f.C0 = c
            f.C1 = e
            f.Parent = a
            return f
        end
        local function a(_, b)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == b then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = a(_, b)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(e, c)
            c.Parent = e
            local d = c:FindFirstChild("Handle")
            if d then
                local b = d:FindFirstChildOfClass("Attachment")
                if b then
                    local _ = a(e, b.Name)
                    if _ then
                        l(_, b)
                    end
                else
                    local e = e:FindFirstChild("Head")
                    if e then
                        local b = CFrame.new(0, 0, 0)
                        local a = c.AttachmentPoint
                        _("HeadWeld", e, e, d, b, a)
                    end
                end
            end
        end
        local _ = 215724848
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players["88pov"].Character, _)
        function l(a, _)
            local b = Instance.new("Weld")
            b.Part0 = a.Parent
            b.Part1 = _.Parent
            b.C0 = a.CFrame
            b.C1 = _.CFrame
            b.Parent = a.Parent
            return b
        end
        local function _(_, a, b, d, c, e)
            local f = Instance.new("Weld")
            f.Name = _
            f.Part0 = b
            f.Part1 = d
            f.C0 = c
            f.C1 = e
            f.Parent = a
            return f
        end
        local function a(_, b)
            for _, _ in pairs(_:GetChildren()) do
                if _:IsA("Attachment") and _.Name == b then
                    return _
                elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                    local _ = a(_, b)
                    if _ then
                        return _
                    end
                end
            end
        end
        function k(e, c)
            c.Parent = e
            local d = c:FindFirstChild("Handle")
            if d then
                local b = d:FindFirstChildOfClass("Attachment")
                if b then
                    local _ = a(e, b.Name)
                    if _ then
                        l(_, b)
                    end
                else
                    local e = e:FindFirstChild("Head")
                    if e then
                        local b = CFrame.new(0, 0, 0)
                        local a = c.AttachmentPoint
                        _("HeadWeld", e, e, d, b, a)
                    end
                end
            end
        end
        local _ = 215748322
        local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
        k(game.Players["88pov"].Character, _)
        game.Players["88pov"].Character.Shirt.ShirtTemplate = "rbxassetid://1061769228"
        game.Players["88pov"].Character.Pants.PantsTemplate = "rbxassetid://160640499"
        game.Players["88pov"].Character.VoidStar.Handle.CanCollide = false
        game.Players["88pov"].Character.Headphones.Handle.CanCollide = false
        game.Players["88pov"].Character.BlackKnightHelmet.Handle.CanCollide = false
        game.Players["88pov"].Character.DarkArmor.Handle.CanCollide = false
        game.Players["88pov"].Character.FurCloak.Handle.CanCollide = false
        game.Players["88pov"].Character.Head.Mesh.MeshId = "rbxassetid://7430070993"
        Instance.new("Decal", game.Players["88pov"].Character.Head)
        game.Players["88pov"].Character.Head.Decal.Name = "face"
        game.Players["88pov"].Character.Head.face.Texture = "rbxassetid://179693472"
        game.Players["88pov"].Character.Head.CanCollide = false
        q = BrickColor.new("Really black")
        game.Players["88pov"].Character.Head.BrickColor = q
        game.Players["88pov"].Character.UpperTorso.BrickColor = q
        game.Players["88pov"].Character["RightLowerArm"].BrickColor = q
        game.Players["88pov"].Character["LeftLowerArm"].BrickColor = q
        game.Players["88pov"].Character["RightUpperArm"].BrickColor = q
        game.Players["88pov"].Character["LeftUpperArm"].BrickColor = q
        game.Players["88pov"].Character["LeftLowerLeg"].BrickColor = q
        game.Players["88pov"].Character["RightLowerLeg"].BrickColor = q
        game.Players["88pov"].Character["RightUpperLeg"].BrickColor = q
        game.Players["88pov"].Character["LeftUpperLeg"].BrickColor = q
        game.Players["88pov"].Character["RightFoot"].BrickColor = q
        game.Players["88pov"].Character["LeftFoot"].BrickColor = q
        game.Players["88pov"].Character["RightHand"].BrickColor = q
        game.Players["88pov"].Character["LeftHand"].BrickColor = q
        game.Players["88pov"].Character.Humanoid.DisplayName = "RVVZ"
        game.Players["88pov"].Character["Shirt Graphic"].Graphic = "rbxassetid://0"
end
end)

local DesyncTypes = {}
if Notify == true then
moeheartbeat:Disconnect()
end

--// Extra notification :3 silllyyyy 💖
game:GetService("StarterGui"):SetCore("SendNotification", {
Title = "RVVZ'S Loaded :3";
Text = "rvvz wants to fuck you";
Icon = "rbxassetid://1407578497&w=180&h=180 true";
Duration = 5
})
end

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
