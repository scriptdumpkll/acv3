if WALLET_LOADED == true then return end
getgenv().WALLET_LOADED = true

function WalletCmd(option)
    if option == 'show' then
        if game:service"Players".LocalPlayer.Backpack:FindFirstChild("Wallet") then
            game:service"Players".LocalPlayer.Backpack:FindFirstChild("Wallet").Parent = game:service"Players".LocalPlayer.Character
        end
    elseif option == 'hide' then
        if game:service"Players".LocalPlayer.Character:FindFirstChild("Wallet") then
            game:service"Players".LocalPlayer.Character:FindFirstChild("Wallet").Parent = game:service"Players".LocalPlayer.Backpack
        end
    else
        if game:service"Players".LocalPlayer.Character:FindFirstChild("Wallet") then
            game:service"Players".LocalPlayer.Character:FindFirstChild("Wallet").Parent = game:service"Players".LocalPlayer.Backpack
        end
    end
end
