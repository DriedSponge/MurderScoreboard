DSMSPrimaryTextColor = Color(0, 144, 255)
DSMSSecondaryTextColor = Color(255, 255, 255, 255)
DSMSHoverClor = Color(255, 0, 0)
DSMSBGColor = Color(0, 0, 0, 170)

DriedSpongeMurderScoreboardSlogan = "Cool Murder Server"



--What color do you want the bar that appears under the buttons to be?
DriedSpongeMurderScoreboardHoverBarColor = Color(255, 0, 0)
--Should what admin system are you using? (the two options are ulx and xadmin)
DSMSBAdminSystem = "xadmin"
--Scoreboard bacground color
DriedSpongeMurderScoreboardBG = Color(0, 0, 0, 170)
--What groups should I have access to admin options? (Forece murderer, kick, ban, move to spectators, etc) Whether or not a user can use certain functions
--is based on xadmin/ulx permissions

--How long should the menu take to fade in? (Set to 0 for no fade)


--No Touchy
hook.Add( "OnGamemodeLoaded", "dsmsbperms", function()
    if DSMSBAdminSystem == "xadmin" then
    xAdmin.RegisterCategory("mursb","Scoreboard","icon16/tag_blue.png")
    xAdmin.RegisterPermission("sbcopy", "Copy player data (access to copy options)", "mursb") 
    xAdmin.RegisterPermission("sbopenprofile", "Open Profiles", "mursb") 
    xAdmin.RegisterPermission("sbadmin", "Access to admin options", "mursb") 
    MsgC(Color( 18, 255, 0 ),"[DriedSponge's Murder Scoreboard]",Color(0, 246, 255)," xAdmin permissions loaded")
    end
  end )

