if DROP_LOADED == true then return end
getgenv().DROP_LOADED = true
function DropCmd()
    game:service"RunService":BindToRenderStep("DROP_CMD",3,function()
        game:service"ReplicatedStorage".MainEvent:FireServer("DropMoney",10000)
        game.ReplicatedStorage.MainEvent:FireServer("Block",true)
    end)
end
