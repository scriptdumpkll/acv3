function Say(arg)
    game:service"ReplicatedStorage".DefaultChatSystemChatEvents.SayMessageRequest:FireServer(arg, "All")
end

function FindPlr(arg)
    for i,v in pairs(game:service"Players":GetChildren()) do
        if v.Name:lower():find(arg:lower()) then
            return v.Name
        elseif v.DisplayName:lower():find(arg:lower()) then
            return v.Name
        end
    end
    return nil
end

function CheckAlt(userid)
    for i,v in pairs(game:service"Players":GetChildren()) do
        if v.UserId == userid then
            return true
        end
    end
    return false
end

function ReformAlts()
    local n = {}
    for i,v in pairs(Alts) do
        if CheckAlt(v) == true then
            table.insert(n,v)
        end
    end
    return n
end
