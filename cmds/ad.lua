if AD_LOADED == true then return end
getgenv().AD_LOADED = true
getgenv().CurrentAdvertising = false

function AdCmd(option)
    if option:lower() == 'on' then
        if CurrentAdvertising == false then
            CurrentAdvertising = true
            while CurrentAdvertising == true do
                wait(2)
                Say(Settings['admsg'])
            end
        end
    else
        CurrentAdvertising = false
    end
end
