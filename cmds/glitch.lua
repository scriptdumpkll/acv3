if GLITCH_LOADED == true then return end
getgenv().GLITCH_LOADED = true

local player = game:service"Players".LocalPlayer
local CurFist
pcall(function()
    CurFist = player.Character.RightHand.Size
end)
local function reach(bool)
    if bool == true then
        for i,v in pairs(player.Character:GetChildren()) do
            if v.Name:find("Hand") then
                v.Massless = true
                v.Transparency = 1
                v.Size = Vector3.new(20,20,20)
                v.CanCollide = false
            end
        end
    elseif bool == false then
        for i,v in pairs(player.Character:GetChildren()) do
            if v.Name:find("Hand") then
                v.Massless = true
                v.Size = CurFist
                v.Transparency = 0
                v.CanCollide = true
            end
        end
    end
end

local lib = {
    Admin = "-871,-33,-662",
    Bank = "-377,21,-361",
    Club = "-266,0,-428",
    Train = "600,47,-117",
}

function GlitchCmd(plr, location)
    local target = FindPlr(plr)
    if plr:lower() == 'host' then
        target = game:service"Players":GetPlayerByUserId(Settings['host']).Name
    end
    if target ~= nil then
        target = game:service"Players"[target]
        if target and player and target.Character and player.Character then
            local OldPos = player.Character.HumanoidRootPart.CFrame
            player.Character.HumanoidRootPart.Anchored = false
            repeat
                local combat = player.Character:FindFirstChild("Combat") or player.Backpack:FindFirstChild("Combat")
                if player.Backpack:FindFirstChild("Combat") then
                    player.Backpack:FindFirstChild("Combat").Parent = player.Character
                end
                reach(true)
                player.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame*CFrame.new(0,5,0)
                player.Character:FindFirstChild("Combat"):Activate()
                wait(0.001)
            until target.Character.BodyEffects:FindFirstChild("K.O").Value == true      
            if target.Character.BodyEffects:FindFirstChild("K.O").Value == true then
                reach(false)
                repeat
                    if target.Character:FindFirstChild("GRABBING_CONSTRAINT") then
                        break
                    end
                    local x,y,z = target.Character.UpperTorso.Position.X,target.Character.UpperTorso.Position.Y,target.Character.UpperTorso.Position.Z
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(x,y+1.3,z)
                    if not target.Character:FindFirstChild("GRABBING_CONSTRAINT") then
                        game:service"ReplicatedStorage".MainEvent:FireServer("Grabbing",false)
                    end
                    wait(1)
                until target.Character:FindFirstChild("GRABBING_CONSTRAINT")
                wait(1)
                local Animation = Instance.new("Animation",game.Players.LocalPlayer.Character)
                Animation.AnimationId = "rbxassetid://3152378852"
                game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Animation):Play()
                wait(1)
                game.Players.LocalPlayer.Character.Humanoid.Health = 0
                game.Players.LocalPlayer.Character:Wait()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
                task.wait(1)
                player.Character.HumanoidRootPart.CFrame = OldPos
            end
        end
    else
        Say("[error, player not found]")
    end
end
