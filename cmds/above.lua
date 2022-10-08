if ABOVE_LOADED == true then return end
getgenv().ABOVE_LOADED = true

function Above()
     Toggles['Noclipping'] = true
     player.Character.HumanoidRootPart.Anchored = false
     player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame + Vector3.new(0,8,0)
     for i,v in pairs(workspace:GetChildren()) do
          if v:IsA("Part") and string.find(v.Name,"GROUND") then
               v:Destroy()
          end
     end
end
