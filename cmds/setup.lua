if SETUP_LOADED == true then return end
getgenv().SETUP_LOADED = true

local Locations, Options = {
    bank = {"-388,21,-336","-388,21,-327","-388,21,-318","-388,21,-309","-388,21,-300","-388,21,-291","-388,21,-282","-388,21,-273","-388,21,-264","-388,21,-255","-388,21,-246","-388,21,-237","-388,21,-228","-375,21,-336","-375,21,-327","-375,21,-318","-375,21,-309","-375,21,-300","-375,21,-291","-375,21,-282","-375,21,-273","-375,21,-264","-375,21,-255","-375,21,-246","-375,21,-237","-375,21,-228","-360,21,-336","-360,21,-327","-360,21,-318","-360,21,-309","-360,21,-300","-360,21,-291","-360,21,-282","-360,21,-273","-360,21,-264","-360,21,-255","-360,21,-246","-360,21,-237","-360,21,-228"},
    club = {"-282,-7,-348","-274,-7,-348","-266,-7,-348","-258,-7,-348","-250,-7,-348","-282,-7,-357","-274,-7,-357","-266,-7,-357","-258,-7,-357","-250,-7,-357","-282,-7,-362","-274,-7,-362","-266,-7,-362","-258,-7,-362","-250,-7,-362","-282,-7,-367","-274,-7,-367","-266,-7,-367","-258,-7,-367","-250,-7,-367","-282,-7,-372","-274,-7,-372","-266,-7,-372","-258,-7,-372","-250,-7,-372","-282,-7,-377","-274,-7,-377","-266,-7,-377","-258,-7,-377","-250,-7,-377","-282,-7,-382","-274,-7,-382","-266,-7,-382","-258,-7,-382","-250,-7,-382","-248,0,-342","-260,0,-341","-271,0,-341","-281,0,-341"},
    train = {"553,35,-56","553,35,-66","553,35,-76","553,35,-86","553,35,-96","553,35,-106","568,35,-56","568,35,-66","568,35,-76","568,35,-86","568,35,-96","568,35,-106","688,35,-141","679,35,-141","670,35,-141","661,35,-141","652,35,-141","643,35,-141","634,35,-141","625,35,-141","616,35,-141","607,35,-141","688,35,-156","679,35,-156","670,35,-156","661,35,-156","652,35,-156","643,35,-156","634,35,-156","625,35,-156","616,35,-156","607,35,-156","586,34,-142","579,34,-135","566,34,-122","572,34,-115","583,34,-127","593,34,-138"},
    admin = {"-826,-40,-617","-826,-40,-605","-826,-40,-593","-826,-40,-581","-826,-40,-569","-826,-40,-557","-845,-40,-617","-845,-40,-605","-845,-40,-593","-845,-40,-581","-845,-40,-569","-845,-40,-557","-864,-40,-617","-864,-40,-605","-864,-40,-593","-864,-40,-581","-864,-40,-569","-864,-40,-557","-879,-40,-617","-879,-40,-605","-879,-40,-593","-879,-40,-581","-879,-40,-569","-879,-40,-557","-898,-40,-617","-898,-40,-605","-898,-40,-593","-898,-40,-581","-898,-40,-569","-898,-40,-557","-918,-40,-617","-918,-40,-605","-918,-40,-593","-918,-40,-581","-918,-40,-569","-918,-40,-557","-816,-33,-643","-927,-33,-642","-873,-33,-521"},
},{"bank","admin","bank","club"}

local player = game:service"Players".LocalPlayer
function SetupCmd(area)
    if table.find(Options,area:lower()) then
        local poses = Locations[area:lower()]
        local new = ReformAlts()
        for i,v in pairs(new) do
            if v == player.UserId then
                local x,y,z = poses[i]:split(",")[1],poses[i]:split(",")[2],poses[i]:split(",")[3]
                player.Character.HumanoidRootPart.CFrame=CFrame.new(x,y,z)
            end
        end
    else
        Say("Invalid setup.")
    end
end
