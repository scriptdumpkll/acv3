if AIRLOCK_LOADED == true then return end
getgenv().AIRLOCK_LOADED = true
function AirlockCmd()
    local Height = 6
    local plr = game:service"Players".LocalPlayer
    local Part = Instance.new("Part",workspace)
    Part.Name = "AIRLOCK_PART"
    Part.Size = Vector3.new(5,2,5)
    Part.Transparency = 1
    Part.CFrame = plr.Character.HumanoidRootPart.CFrame*CFrame.new(0,Height,0)
    Part.Anchored = true
    plr.Character.HumanoidRootPart.CFrame=plr.Character.HumanoidRootPart.CFrame*CFrame.new(0,Height+1,0)
    wait(1)
    plr.Character.HumanoidRootPart.Anchored = true
end
