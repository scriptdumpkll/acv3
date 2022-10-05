if DUPE_LOADED == true then return end
getgenv().DUPE_LOADED = true

local player = game:service"Players".LocalPlayer
function DupeCmd(alt_name)
    local data = FindPlr(alt_name)
    if data ~= nil then
        if data ~= player.Name then
            local poses = {"4.5,0,0","0,0,4.5","-4.5,0,0","0,0,-4.5","3,0,3","-3,0,3","-3,0,-3","3,0,-3","6.5,0,0","5,0,3","3.5,0,5","0,0,6.5","-5,0,3","-3.5,0,5","-6.5,0,0","-5,0,-3","-3.5,0,-5","0,0,-6.5","5,0,-3","3.5,0,-5","4.5,7,0","0,7,4.5","-4.5,7,0","0,7,-4.5","3,7,3","-3,7,3","-3,7,-3","3,7,-3","6.5,7,0","5,7,3","3.5,7,5","0,7,6.5","-5,7,3","-3.5,7,5","-6.5,7,0","-5,7,-3","-3.5,7,-5","0,7,-6.5","5,7,-3","3.5,7,-5"}
            local NewAlts = ReformAlts()
            local Target = game:service"Players"[data]
            for i,v in pairs(NewAlts) do
                if v == player.UserId then
                    local x,y,z = poses[i]:split(",")[1],poses[i]:split(",")[2],poses[i]:split(",")[3]
                    player.Character.HumanoidRootPart.CFrame=Target.Character.HumanoidRootPart.CFrame*CFrame.new(x,y,z)
                end
            end
            wait(1.5)
            game:service"RunService":BindToRenderStep("DROP_CMD",3,function()
                game:service"ReplicatedStorage".MainEvent:FireServer("DropMoney",10000)
            end)
        else
            game:service"RunService":BindToRenderStep("CASHAURA_DUPE",4,function()
                for i,v in pairs(workspace.Ignored.Drop:GetChildren()) do
                    if v:IsA("Part") then
                        if (v.Position-player.Character.HumanoidRootPart.Position).Magnitude <= 14 then
                            fireclickdetector(v.ClickDetector)
                        end
                    end
                end
            end)
        end
    else
        Say("Invalid alt.")
    end
end
