if BRING_LOADED == true then return end
getgenv().BRING_LOADED = true
function BringCmd(ARG_ID)
    game:service"Players".LocalPlayer.Character.HumanoidRootPart.CFrame=game:service"Players":GetPlayerByUserId(ARG_ID).Character.HumanoidRootPart.CFrame
end
