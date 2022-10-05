if RESET_LOADED == true then return end
getgenv().RESET_LOADED = true
function ResetCmd()
    local LP = game:service"Players".LocalPlayer
    local OLDPOS = LP.Character.HumanoidRootPart.CFrame
    LP.Character.Humanoid.Health = 0
    for i,v in pairs(LP.Character:GetChildren()) do
        if v:IsA("MeshPart") or v:IsA("BasePart") or v.Name == "HumanoidRootPart" then
            v:Destroy()
        end
    end
    LP.CharacterAdded:Wait()
    wait(.5)
    LP.Character.HumanoidRootPart.CFrame = OLDPOS
end
