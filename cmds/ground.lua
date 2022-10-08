if GROUND_LOADED == true then return end
getgenv().GROUND_LOADED = true

function GroundCmd()
    local player = game.Players.LocalPlayer
    local part = CreateGroundPart()
    Toggles['Noclipping'] = true
    workspace:FindFirstChild(part).CFrame = player.Character.HumanoidRootPart.CFrame-Vector3.new(0,11,0)
    workspace:FindFirstChild(part).Anchored = true
    player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame-Vector3.new(0,5,0)
    wait(5)
    player.Character.HumanoidRootPart.Anchored = true
end
