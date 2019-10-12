

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
    
        
        local adm, optoption = opt:AddSubMenu("Administration")
        optoption:SetIcon("icon16/shield.png")
        local util, optoption2 = opt:AddSubMenu("Utility")
        optoption2:SetIcon("icon16/lightning.png")
       -- local tp, optoption2 = opt:AddSubMenu("Teleportation")
    --optoption2:SetIcon("icon16/lightning.png")
        
        
        local XadminReasonOnly = {}
        XadminReasonOnly[1] = {name = "Slay " .. v:Name(), icon = "materials/icons/slay.png", cmd = "xadmin_slay", time = false, check = "slay" }
        XadminReasonOnly[2] = {name = "Kick " .. v:Name(), icon = "materials/icons/kick.png", cmd = "xadmin_kick", time = false, check = "kick"}
        XadminReasonOnly[3] = {name = "Ban " .. v:Name(), icon = "materials/icons/gavel.png", cmd = "xadmin_ban", time = true, check = "ban" }
        for a,b in pairs(XadminReasonOnly) do
            if LocalPlayer():xAdminHasPermission(b.check)  then
            local slay = adm:AddOption(b.name, function()
                local frame = vgui.Create("DFrame")
                if b.time == false then
                frame:SetSize(400, 100)
                else
                frame:SetSize(400, 145)
                end
                frame:TDLib()
                frame:Center()
                frame:SetTitle(b.name)
                frame:MakePopup()
                frame.lblTitle:SetFont("Murder_ScoreBoardFont")
                frame.lblTitle:SetTextColor(DSMSPrimaryTextColor)
                frame:ClearPaint()
                frame:Blur()
                frame:Background(DSMSBGColor)
                frame:Outline(DSMSPrimaryTextColor)
                if b.time == true then
                    local time = vgui.Create("DLabel", frame)
                    time:Dock(TOP)
                    time:SetText("Time (Minutes, 0 for perma)")
                    time:SetFont("Murder_ScoreBoardFontSSmall")
                    time:SetColor(DSMSPrimaryTextColor)
                    local DNumberWang = vgui.Create( "DNumberWang", frame )
                    DNumberWang:Dock(TOP)		
                    DNumberWang:SetSize( 100, 25 )		
                    DNumberWang:SetMin( 0 )				
                    DNumberWang:SetMax( 100000 )				
                    DNumberWang:SetDecimals( 0 )
                    end
                local rson = vgui.Create("DLabel", frame)
                rson:Dock(TOP)
                rson:SetText("Reason")
                rson:SetFont("Murder_ScoreBoardFontSSmall")
                rson:SetSize(40, 15)
                rson:SetColor(DSMSPrimaryTextColor)
                local TextEntry = vgui.Create("DTextEntry", frame)
                TextEntry:SetPos(25, 50)
                TextEntry:SetSize(75, 40)
                TextEntry:SetTextColor(DSMSPrimaryTextColor)
                TextEntry:SetFont("Murder_ScoreBoardFont")
                TextEntry:Dock(BOTTOM)
                TextEntry:SetText("")
                TextEntry.OnEnter = function(self)
                    if b.time == false then 
                    RunConsoleCommand(b.cmd, v:SteamID(), self:GetValue())
                    frame:Close()
                    else
                       RunConsoleCommand(b.cmd, v:SteamID(), DNumberWang:GetValue(), self:GetValue())
                        frame:Close()
                    end
                end  end)    slay:SetIcon(b.icon)
            end
        end
        if LocalPlayer():xAdminHasPermission("gag")  then
                        if v:GetNWBool("xAdminGagged") == false then
                        local gag = adm:AddOption("Gag " .. v:Name(), function()
                            local gframe = vgui.Create("DFrame")
                            gframe:SetSize(400, 145)
                            gframe:TDLib()
                            gframe:Center()
                            gframe:SetTitle("Gag "..v:Name())
                            gframe:MakePopup()
                            gframe.lblTitle:SetFont("Murder_ScoreBoardFont")
                            gframe.lblTitle:SetTextColor(DSMSPrimaryTextColor)
                            gframe:ClearPaint()
                            gframe:Background(DSMSBGColor)
                            gframe:Outline(DSMSPrimaryTextColor)
                            local time = vgui.Create("DLabel", gframe)
                            time:Dock(TOP)
                            time:SetText("Time (Minutes, 0 for perma)")
                            time:SetFont("Murder_ScoreBoardFontSSmall")
                            time:SetColor(DSMSPrimaryTextColor)
                            local DNumberWang = vgui.Create( "DNumberWang", gframe )
                            DNumberWang:Dock(TOP)		
                            DNumberWang:SetSize( 100, 25 )		
                            DNumberWang:SetMin( 0 )				
                            DNumberWang:SetMax( 100000 )				
                            DNumberWang:SetDecimals( 0 )
                            local rson = vgui.Create("DLabel", gframe)
                            rson:Dock(TOP)
                            rson:SetText("Reason")
                            rson:SetSize(40, 15)
                            rson:SetFont("Murder_ScoreBoardFontSSmall")
                            rson:SetColor(DSMSPrimaryTextColor)		
                            local TextEntry = vgui.Create("DTextEntry", gframe)
                            TextEntry:SetPos(25, 50)
                            TextEntry:SetSize(75, 40)
                            TextEntry:SetTextColor(DSMSPrimaryTextColor)
                            TextEntry:SetFont("Murder_ScoreBoardFont")
                            TextEntry:Dock(BOTTOM)
                            TextEntry:SetText("")
                            TextEntry.OnEnter = function(self)
                                RunConsoleCommand("xadmin_gag", v:SteamID(), DNumberWang:GetValue(), self:GetValue())
                                gframe:Close()
                            end  end)    gag:SetIcon("icon16/sound_mute.png") else 
                                local ungag = adm:AddOption("Un-Gag " .. v:Name(), function()
                                        RunConsoleCommand("xadmin_ungag", v:SteamID())
                                     end)    ungag:SetIcon("icon16/sound.png")
                                     end
                                    end
                                
                                    
                                   -- GOD MODE
                                     if v:GetNWBool("xAdminGod") == false  then 
                                         godtxt = "God " .. v:Name()
                                         godcmd = "xadmin_god"
                                    else
                                         godtxt = "Ungod " .. v:Name()
                                         godcmd = "xadmin_ungod"
                                    end
                                     local god = util:AddOption(godtxt, function()
                                            RunConsoleCommand(godcmd, v:SteamID())  
                                         end)    
                                         god:SetIcon("materials/icons/slay.png")
                                        --CLOAK
                                         if v:GetNWBool("xAdminCloaked") == false  then 
                                            cltxt = "Cloak " .. v:Name()
                                            clcmd = "xadxadmin_cloak"
                                       else
                                            cltxt = "Uncloak " .. v:Name()
                                            clcmd = "xadmin_uncloak"
                                       end
                                        local cl = util:AddOption(cltxt, function()
                                               RunConsoleCommand(clcmd, v:SteamID())  
                                            end)    
                                            cl:SetIcon("materials/icons/slay.png")
    
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