if LOCK_LOADED == true then return end
getgenv().LOCK_LOADED = true
function LockCmd()
    local plr = game:service"Players".LocalPlayer
    plr.Character.HumanoidRootPart.Anchored = true
end
