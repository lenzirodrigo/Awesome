-- xrandr --output HDMI-0 --off
-- xrandr --output HDMI-0 --mode 1920x1080 --right-of LVDS-0
-- xrandr  LVDS-0 --off
local externalDisplay = "HDMI-0"
local externalDisplayMode = "1920x1080"
local display =  "LVDS-0"
local displayMode = "1920x1080"

function turnOnExternalOffDisplay() 
	os.execute("xrandr --output " .. externalDisplay .. " --mode " .. externalDisplayMode)
	os.execute("xrandr --output " .. display .. " --off") 
end

function turnOnDisplayOffExternal()
	os.execute("xrandr --output " .. display .. " --mode " .. displayMode)
	os.execute("xrandr --output " .. externalDisplay .. " --off")
end
