if UNLOCK_LOADED == true then return end
getgenv().UNLOCK_LOADED = true
function UnlockCmd()
    local plr = game:service"Players".LocalPlayer
    if workspace:FindFirstChild("AIRLOCK_PART") then
        workspace:FindFirstChild("AIRLOCK_PART"):Destroy()
    end
    plr.Character.HumanoidRootPart.Anchored = false
end
