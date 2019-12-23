

function scoreboardoptions(v)
    opt = DermaMenu()
    opt:Open(gui.MouseX(), gui.MouseY(), "", ownerpanel)
    
    
    if v ~= LocalPlayer() and v:IsMuted() then
            local unmute = opt:AddOption("Un-Mute", function()
                v:SetMuted(false)
            end)
    
            unmute:SetIcon("icon16/sound.png")
        else
            if v ~= LocalPlayer()  then
            local mute = opt:AddOption("Mute", function()
                v:SetMuted(true)
            end)
    
            mute:SetIcon("icon16/sound_mute.png")
        end
    end
    
    local NonAdminOptions = {}
    NonAdminOptions[1] = {name = "Open Steam Profile", icon = "materials/icons/steamlogo.png", does = function() v:ShowProfile()end, perm = "sbopenprofile"}
    
    for a,b in pairs(NonAdminOptions) do
    if  LocalPlayer():xAdminHasPermission(b.perm) then
    local steampro = opt:AddOption(b.name,b.does )
    steampro:SetIcon("materials/icons/steamlogo.png")
    steampro:SetIcon(b.icon)
    end
    end
    
    
    --copyoptsions
    if LocalPlayer():xAdminHasPermission("sbcopy")  then
    local copy, optoption = opt:AddSubMenu("Copy")
    optoption:SetIcon("icon16/page_white_copy.png")
    local CopyOptions = {}
    CopyOptions[1] = {name = "Copy SteamID", icon = "materials/icons/steamlogo.png", does = function() SetClipboardText(v:SteamID()) end}
    CopyOptions[2] = {name = "Copy SteamID64", icon = "materials/icons/steamlogo.png", does = function()  if v:IsBot() == false then SetClipboardText(v:SteamID64()) else SetClipboardText("BOT") end end}
    CopyOptions[3] = {name = "Copy Profile URL", icon = "materials/icons/steamlogo.png", does = function() SetClipboardText("http://steamcommunity.com/profiles/" .. v:SteamID64()) end}
    CopyOptions[4] = {name = "Copy Name", icon = "icon16/tag_blue.png", does = function() SetClipboardText(v:Name()) end}
    
    for a,b in pairs(CopyOptions) do
    local copyid = copy:AddOption(b.name, b.does)
    copyid:SetIcon(b.icon)
    end
    end
    if LocalPlayer():xAdminHasPermission("sbadmin") then
        opt:AddSpacer()
        local MurderCommands = {}
        MurderCommands[1] = {name = "Move to Spectators", icon = "icon16/user_go.png", does = function() RunConsoleCommand("mu_movetospectate", v:EntIndex()) end}
        MurderCommands[2] = {name = "Forece Murderer", icon = "icon16/user_red.png", does = function()  RunConsoleCommand("mu_forcenextmurderer", v:EntIndex()) end}
    for a,b in pairs(MurderCommands) do
        
        local murdercmd = opt:AddOption(b.name, b.does)
        murdercmd:SetIcon(b.icon)
    end
    
        
        
        
       -- local tp, optoption2 = opt:AddSubMenu("Teleportation")
    --optoption2:SetIcon("icon16/lightning.png")
        
        
        -- local XadminReasonOnly = {}
        -- XadminReasonOnly[1] = {name = "Slay " .. v:Name(), icon = "materials/icons/slay.png", cmd = "xadmin_slay", time = false, check = "slay" }
        -- XadminReasonOnly[2] = {name = "Kick " .. v:Name(), icon = "materials/icons/kick.png", cmd = "xadmin_kick", time = false, check = "kick"}
        -- XadminReasonOnly[3] = {name = "Ban " .. v:Name(), icon = "materials/icons/gavel.png", cmd = "xadmin_ban", time = true, check = "ban" }

                                
                                    
                                   
    
                                    --TELEPORTATION
                                    if v ~= LocalPlayer() then
                                        local tp, optoption3 = opt:AddSubMenu("Teleportation")
                                        optoption3:SetIcon("icon16/arrow_out.png")
                                         local gto = tp:AddOption("Goto "..v:Name(), function()
                                            RunConsoleCommand("xadmin_goto", v:Name())  
                                         end)    
                                         gto:SetIcon("icon16/arrow_left.png")
                                         local brg = tp:AddOption("Bring "..v:Name(), function()
                                            RunConsoleCommand("xadmin_bring", v:Name())  
                                         end)    
                                         brg:SetIcon("icon16/arrow_right.png")
                                    end
                    
        end
    end