if STOMP_LOADED == true then return end
getgenv().STOMP_LOADED = true

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

function StompCmd(plr)
        local target = FindPlr(plr)
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
                        game:service"ReplicatedStorage".MainEvent:FireServer("Stomp",false)
                    end
                    wait()
                until target.Character:FindFirstChild("Dead") or game:GetService("Players")[v].Character:FindFirstChild("BodyEffects"):FindFirstChild("K.O").Value == false
                player.Character.HumanoidRootPart.CFrame = OldPos
            end
        end
    else
        Say("[error, player not found]")
    end
end
