--[[                                      ]]--
--                                          -
--   Multicolor Awesome WM 3.5.+ config     --
--        github.com/copycat-killer         --
--                                          -
--[[                                      ]]--

--[[
ooooo         o8o   .o8                                    o8o                     
`888'         `"'  "888                                    `"'                     
 888         oooo   888oooo.  oooo d8b  .oooo.   oooo d8b oooo   .ooooo.   .oooo.o 
 888         `888   d88' `88b `888""8P `P  )88b  `888""8P `888  d88' `88b d88(  "8 
 888          888   888   888  888      .oP"888   888      888  888ooo888 `"Y88b.  
 888       o  888   888   888  888     d8(  888   888      888  888    .o o.  )88b 
o888ooooood8 o888o  `Y8bod8P' d888b    `Y888""8o d888b    o888o `Y8bod8P' 8""888P' 
--]]
gears 	        = require("gears")
awful           = require("awful")
awful.rules     = require("awful.rules")
awful.autofocus = require("awful.autofocus")
wibox           = require("wibox")
beautiful       = require("beautiful")
naughty         = require("naughty")
vicious         = require("vicious")
--layouts         = require("layouts")
string          = require("string")

--[[
      .o.                       .                          .                          .   
     .888.                    .o8                        .o8                        .o8   
    .8"888.     oooo  oooo  .o888oo  .ooooo.   .oooo.o .o888oo  .oooo.   oooo d8b .o888oo 
   .8' `888.    `888  `888    888   d88' `88b d88(  "8   888   `P  )88b  `888""8P   888   
  .88ooo8888.    888   888    888   888   888 `"Y88b.    888    .oP"888   888       888   
 .8'     `888.   888   888    888 . 888   888 o.  )88b   888 . d8(  888   888       888 . 
o88o     o8888o  `V88V"V8P'   "888" `Y8bod8P' 8""888P'   "888" `Y888""8o d888b      "888" 
--]]

function run_once(cmd)
  findme = cmd
  firstspace = cmd:find(" ")
  if firstspace then
     findme = cmd:sub(0, firstspace-1)
  end
  awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
 end 

run_once("unclutter -idle 10")

-- }}}

-- {{{ Localization

os.setlocale(os.getenv("LANG"))

--[[
oooooooooooo                                               
`888'     `8                                               
 888         oooo d8b oooo d8b  .ooooo.  oooo d8b  .oooo.o 
 888oooo8    `888""8P `888""8P d88' `88b `888""8P d88(  "8 
 888    "     888      888     888   888  888     `"Y88b.  
 888       o  888      888     888   888  888     o.  )88b 
o888ooooood8 d888b    d888b    `Y8bod8P' d888b    8""888P' 
--]]                                                                           

-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end

-- }}}
--[[
oooooo     oooo                     o8o             .o8       oooo                     
 `888.     .8'                      `"'            "888       `888                     
  `888.   .8'    .oooo.   oooo d8b oooo   .oooo.    888oooo.   888   .ooooo.   .oooo.o 
   `888. .8'    `P  )88b  `888""8P `888  `P  )88b   d88' `88b  888  d88' `88b d88(  "8 
    `888.8'      .oP"888   888      888   .oP"888   888   888  888  888ooo888 `"Y88b.  
     `888'      d8(  888   888      888  d8(  888   888   888  888  888    .o o.  )88b 
      `8'       `Y888""8o d888b    o888o `Y888""8o  `Y8bod8P' o888o `Y8bod8P' 8""888P' 
--]]

-- Useful Paths
home = os.getenv("HOME")
confdir = home .. "/.config/awesome"
scriptdir = confdir .. "/scripts/"
themes = confdir .. "/themes"
active_theme = themes .. "/multicolor"

-- Themes define colours, icons, and wallpapers
beautiful.init(active_theme .. "/theme.lua")

terminal = "gnome-terminal"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor
gui_editor = "subl"
browser = "google-chrome"
mail = terminal .. " -e mutt "
chat = terminal .. " -e irssi "
tasks = terminal .. " -e htop "

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"
--altkey = "Mod1"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.floating,             -- 1
    awful.layout.suit.tile,                 -- 2
    awful.layout.suit.tile.left,            -- 3
    awful.layout.suit.tile.bottom,          -- 4
    awful.layout.suit.tile.top,             -- 5
    -- awful.layout.suit.fair,                 -- 6
    -- awful.layout.suit.fair.horizontal,      -- 7
    -- awful.layout.suit.spiral,               -- 8
    -- awful.layout.suit.spiral.dwindle,       -- 9
    -- awful.layout.suit.max,                  -- 10
    -- --awful.layout.suit.max.fullscreen,     -- 11
    --awful.layout.suit.magnifier           -- 12
    --layouts.tilegaps,                       -- 13
}

-- }}}
--[[
oooooo   oooooo     oooo           oooo  oooo                                                     
 `888.    `888.     .8'            `888  `888                                                     
  `888.   .8888.   .8'    .oooo.    888   888  oo.ooooo.   .oooo.   oo.ooooo.   .ooooo.  oooo d8b 
   `888  .8'`888. .8'    `P  )88b   888   888   888' `88b `P  )88b   888' `88b d88' `88b `888""8P 
    `888.8'  `888.8'      .oP"888   888   888   888   888  .oP"888   888   888 888ooo888  888     
     `888'    `888'      d8(  888   888   888   888   888 d8(  888   888   888 888    .o  888     
      `8'      `8'       `Y888""8o o888o o888o  888bod8P' `Y888""8o  888bod8P' `Y8bod8P' d888b    
                                                888                  888                          
                                               o888o                o888o                         
--]]

if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end


--[[
ooooooooooooo                               
8'   888   `8                               
     888       .oooo.    .oooooooo  .oooo.o 
     888      `P  )88b  888' `88b  d88(  "8 
     888       .oP"888  888   888  `"Y88b.  
     888      d8(  888  `88bod8P'  o.  )88b 
    o888o     `Y888""8o `8oooooo.  8""888P' 
                        d"     YD           
                        "Y88888P'           
--]]            
-- Define a tag table which hold all screen tags.
tags = {
       names = { "web", "term", "dev", "files", "other" },       
       layout = { layouts[2], layouts[3], layouts[3], layouts[4], layouts[1] } 
       }
for s = 1, screen.count() do
-- Each screen has its own tag table.
   tags[s] = awful.tag(tags.names, s, tags.layout)
end

-- }}}
                                          
-- {{{ Freedesktop Menu

require("freedesktop/freedesktop")

--[[
oooooo   oooooo     oooo  o8o   .o8                             
 `888.    `888.     .8'   `"'  "888                             
  `888.   .8888.   .8'   oooo   888oooo.   .ooooo.  oooo    ooo 
   `888  .8'`888. .8'    `888   d88' `88b d88' `88b  `88b..8P'  
    `888.8'  `888.8'      888   888   888 888   888    Y888'    
     `888'    `888'       888   888   888 888   888  .o8"'88b   
      `8'      `8'       o888o  `Y8bod8P' `Y8bod8P' o88'   888o 
--]]
-- Colours
coldef  = "</span>"
colwhi  = "<span color='#b2b2b2'>"
colbwhi = "<span color='#ffffff'>"
blue = "<span color='#7493d2'>"
yellow = "<span color='#e0da37'>"
purple = "<span color='#e33a6e'>"
lightpurple = "<span color='#eca4c4'>"
azure = "<span color='#80d9d8'>"
green = "<span color='#87af5f'>"
lightgreen = "<span color='#62b786'>"
red = "<span color='#e54c62'>"
orange = "<span color='#ff7100'>"
brown = "<span color='#db842f'>"
fuchsia = "<span color='#800080'>"
gold = "<span color='#e7b400'>"

-- Textclock widget
clockicon = wibox.widget.imagebox()
clockicon:set_image(beautiful.widget_clock)
mytextclock = awful.widget.textclock("<span color='#7788af'>%A %d %B</span> " .. blue .. "</span><span color=\"#343639\">></span> <span color='#de5e1e'>%H:%M</span> ")


-- /home fs widget
fshicon = wibox.widget.imagebox()
fshicon:set_image(theme.confdir .. "/widgets/fs.png")
fshwidget = wibox.widget.textbox()
    vicious.register(fshwidget, vicious.widgets.fs,
    function (widget, args)
        if args["{/home used_p}"] >= 95 and args["{/home used_p}"] < 99 then
            return colwhi .. args["{/home used_p}"] .. "%" .. coldef
        elseif args["{/home used_p}"] >= 99 and args["{/home used_p}"] <= 100 then
            naughty.notify({ title = "Attenzione", text = "Partizione /home esaurita!\nFa' un po' di spazio.",
                             timeout = 10,
                             position = "top_right",
                             fg = beautiful.fg_urgent,
                             bg = beautiful.bg_urgent })
            return colwhi .. args["{/home used_p}"] .. "%" .. coldef
        else
            return azure .. args["{/home used_p}"] .. "%" .. coldef
        end
    end, 620)

-- Uptime
uptimeicon = wibox.widget.imagebox()
uptimeicon:set_image(beautiful.widget_uptime)
uptimewidget = wibox.widget.textbox()
vicious.register(uptimewidget, vicious.widgets.uptime, brown .. "$1d $2h $3m" .. coldef)

-- CPU widget
cpuicon = wibox.widget.imagebox()
cpuicon:set_image(beautiful.widget_cpu)
cpuwidget = wibox.widget.textbox()
vicious.register(cpuwidget, vicious.widgets.cpu, purple .. "$1%" .. coldef, 3)
cpuicon:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn(tasks, false) end)))

-- Temp widget
tempicon = wibox.widget.imagebox()
tempicon:set_image(beautiful.widget_temp)
tempicon:buttons(awful.util.table.join(
    awful.button({ }, 1, function () awful.util.spawn(terminal .. " -e sudo powertop ", false) end)
    ))
   tempwidget = wibox.widget.textbox()
   vicious.register(tempwidget, vicious.widgets.thermal, "<span color=\"#f1af5f\">$1°C</span>", 9, {"coretemp.0", "core"} )

-- Battery widget
baticon = wibox.widget.imagebox()
baticon:set_image(beautiful.widget_batt)
batwidget = wibox.widget.textbox()
vicious.register( batwidget, vicious.widgets.bat, "$2", 1, "BAT0")

function batstate()

     local file = io.open("/sys/class/power_supply/BAT0/status", "r")

     local batstate = file:read("*line")
     file:close()

     if (batstate == 'Full') then
        return "Cable plugged"
     end

     if (batstate == 'Discharging' or batstate == 'Charging') then
          return batstate
     else
          return "Fully charged"
     end
end

batwidget = wibox.widget.textbox()
vicious.register(batwidget, vicious.widgets.bat,
     function (widget, args)
          -- plugged
          if (batstate() == 'Cable plugged' or batstate() == 'Unknown') then return "AC "
          -- critical
          elseif (args[2] <= 5 and batstate() == 'Discharging') then
               naughty.notify({
                    text = "I am going to turn me off ...",
                    title = "Almost empty!",
                    position = "top_right",
                    timeout = 1,
                    fg="#000000",
                    bg="#ffffff",
                    screen = 1,
                    ontop = true,
               })
          -- low
          elseif (args[2] <= 10 and batstate() == 'Discharging') then
               naughty.notify({
                    text = "Connect the Cable!",
                    title = "low battery",
                    position = "top_right",
                    timeout = 1,
                    fg="#ffffff",
                    bg="#262729",
                    screen = 1,
                    ontop = true,
               })
          end
          return " " .. args[2] .. "% "
     end, 1, 'BAT0')

-- Volume widget
volicon = wibox.widget.imagebox()
volicon:set_image(beautiful.widget_vol)
volumewidget = wibox.widget.textbox()
vicious.register(volumewidget, vicious.widgets.volume, blue .. "$1%" .. coldef,  1, "Master")

-- Net widget
netip = wibox.widget.textbox()
all_infos=awful.util.pread("ip route show")
ip = string.match(string.match(all_infos,"%ssrc%s[%d]+%.[d%]+%.[%d]+%.[%d]+"), "[%d]+%.[d%]+%.[%d]+%.[%d]+")
netip:set_text(ip)


netdownicon = wibox.widget.imagebox()
netdownicon:set_image(beautiful.widget_netdown)
netdownicon.align = "middle"
netdowninfo = wibox.widget.textbox()
vicious.register(netdowninfo, vicious.widgets.net, green .. "${wlp2s0 down_kb}" .. coldef, 1)
netupicon = wibox.widget.imagebox()
netupicon:set_image(beautiful.widget_netup)
netupicon.align = "middle"
netupinfo = wibox.widget.textbox()
vicious.register(netupinfo, vicious.widgets.net, red .. "${wlp2s0 up_kb}" .. coldef, 1)

-- Memory widget
memicon = wibox.widget.imagebox()
memicon:set_image(beautiful.widget_mem)
memwidget = wibox.widget.textbox()
vicious.register(memwidget, vicious.widgets.mem, yellow .. "$1% Mem" .. coldef, 1)

-- Swap widget
swapicon = wibox.widget.imagebox()
swapicon:set_image(beautiful.widget_mem)
swapwidget = wibox.widget.textbox()
vicious.register(swapwidget, vicious.widgets.mem, yellow .. "$5% Swap" .. coldef, 1)

-- Spacer
spacer = wibox.widget.textbox(" ")


--[[
ooooo                                                        .   
`888'                                                      .o8   
 888          .oooo.   oooo    ooo  .ooooo.  oooo  oooo  .o888oo 
 888         `P  )88b   `88.  .8'  d88' `88b `888  `888    888   
 888          .oP"888    `88..8'   888   888  888   888    888   
 888       o d8(  888     `888'    888   888  888   888    888 . 
o888ooooood8 `Y888""8o     .8'     `Y8bod8P'  `V88V"V8P'   "888" 
                       .o..P'                                    
                       `Y8P'                                     
                                                                 --]]
-- Create a wibox for each screen and add it
mywibox = {}
mybottomwibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()

    
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                            awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                            awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                            awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                            awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))

    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the upper wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s, height = 20 }) 
    --border_width = 0, height =  20 })
        
    -- Widgets that are aligned to the upper left
    local left_layout = wibox.layout.fixed.horizontal()
    -- left_layout:add(spacer)
    -- left_layout:add(mylauncher)
    -- left_layout:add(spacer)
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])
    --left_layout:add(spacer)
    -- left_layout:add(mpdicon)
    -- left_layout:add(mpdwidget)
    --left_layout:add(spacer)

    -- Widgets that are aligned to the upper right
    local right_layout = wibox.layout.fixed.horizontal()
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    right_layout:add(netdownicon)
    right_layout:add(netdowninfo)
    right_layout:add(spacer)
    right_layout:add(netupicon)
    right_layout:add(netupinfo)
    right_layout:add(spacer)
    right_layout:add(spacer)
    right_layout:add(netip)
    right_layout:add(spacer)
    right_layout:add(cpuicon)
    right_layout:add(cpuwidget)
    right_layout:add(spacer)
    right_layout:add(memicon)
    right_layout:add(memwidget)
    right_layout:add(spacer)
    right_layout:add(swapicon)
    right_layout:add(spacer)
    right_layout:add(swapwidget)
    right_layout:add(spacer)
    right_layout:add(fshicon)
    right_layout:add(fshwidget)
    right_layout:add(spacer)
    right_layout:add(uptimeicon)
    right_layout:add(uptimewidget) 
    right_layout:add(spacer)
    right_layout:add(tempicon)
    right_layout:add(tempwidget)
    right_layout:add(spacer)
    right_layout:add(spacer)     
    right_layout:add(baticon)
    right_layout:add(batwidget)
    right_layout:add(spacer)
    right_layout:add(volicon)
    right_layout:add(volumewidget)
    right_layout:add(spacer)
    right_layout:add(clockicon)
    right_layout:add(mytextclock)
    -- right_layout:add(mylayoutbox[s])

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    --layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)
    
    mywibox[s]:set_widget(layout)

    -- Create the bottom wibox
    mybottomwibox[s] = awful.wibox({ position = "bottom", screen = s, border_width = 0, height = 20 })
    --mybottomwibox[s].visible = false
            
    -- Widgets that are aligned to the bottom left
    bottom_left_layout = wibox.layout.fixed.horizontal()
    bottom_left_layout:add(spacer)
                        
    -- Widgets that are aligned to the bottom right
    bottom_right_layout = wibox.layout.fixed.horizontal()
    bottom_right_layout:add(spacer)
    bottom_right_layout:add(mylayoutbox[s])
                                            
    -- Now bring it all together (with the tasklist in the middle)
    bottom_layout = wibox.layout.align.horizontal()
    bottom_layout:set_left(bottom_left_layout)
    bottom_layout:set_middle(mytasklist[s])
    bottom_layout:set_right(bottom_right_layout)
    mybottomwibox[s]:set_widget(bottom_layout)

end

--[[
ooo        ooooo                                          
`88.       .888'                                          
 888b     d'888   .ooooo.  oooo  oooo   .oooo.o  .ooooo.  
 8 Y88. .P  888  d88' `88b `888  `888  d88(  "8 d88' `88b 
 8  `888'   888  888   888  888   888  `"Y88b.  888ooo888 
 8    Y     888  888   888  888   888  o.  )88b 888    .o 
o8o        o888o `Y8bod8P'  `V88V"V8P' 8""888P' `Y8bod8P' 
--]]
-- Mouse Bindings

root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))


--[[
oooo    oooo                                
`888   .8P'                                 
 888  d8'     .ooooo.  oooo    ooo  .oooo.o 
 88888[      d88' `88b  `88.  .8'  d88(  "8 
 888`88b.    888ooo888   `88..8'   `"Y88b.  
 888  `88b.  888    .o    `888'    o.  )88b 
o888o  o888o `Y8bod8P'     .8'     8""888P' 
                       .o..P'               
                       `Y8P'                
--]]
-- {{{ Key bindings

globalkeys = awful.util.table.join(

    -- Capture a screenshot
    -- awful.key({ altkey }, "p", function() awful.util.spawn("screenshot",false) end),

    -- Move clients
    -- awful.key({ altkey }, "Next",  function () awful.client.moveresize( 1,  1, -2, -2) end),
    -- awful.key({ altkey }, "Prior", function () awful.client.moveresize(-1, -1,  2,  2) end),
    -- awful.key({ altkey }, "Down",  function () awful.client.moveresize(  0,  1,   0,   0) end),
    -- awful.key({ altkey }, "Up",    function () awful.client.moveresize(  0, -1,   0,   0) end),
    -- awful.key({ altkey }, "Left",  function () awful.client.moveresize(-1,   0,   0,   0) end),
    -- awful.key({ altkey }, "Right", function () awful.client.moveresize( 1,   0,   0,   0) end),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

    -- Show/Hide Wibox
    awful.key({ modkey }, "b", function ()
    mywibox[mouse.screen].visible = not mywibox[mouse.screen].visible
    end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact( 0.05)     end),
    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact(-0.05)     end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)       end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)       end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)          end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)          end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1)  end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1)  end),
    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Volume control
    -- Volume media keys
    awful.key({ }, "XF86AudioRaiseVolume", function ()
                                             awful.util.spawn("amixer set Master playback 3%+", false)
                                             vicious.force({ volumewidget }) 
                                            end),    
    awful.key({ }, "XF86AudioLowerVolume", function ()  
                                            awful.util.spawn("amixer set Master playback 3%-", false)
                                            vicious.force({ volumewidget }) 
                                          end),
    awful.key({ }, "XF86AudioMute", function ()
                                      awful.util.spawn("amixer set Master playback toggle", false) 
                                      vicious.force({ volumewidget })
                                    end),

    awful.key({ "Control" }, "Up", function ()
                                       awful.util.spawn("amixer set Master playback 1%+", false )
                                       vicious.force({ volumewidget })
                                   end),
    awful.key({ "Control" }, "Down", function ()
                                       awful.util.spawn("amixer set Master playback 1%-", false )
                                       vicious.force({ volumewidget })
                                     end),
    awful.key({ "Control" }, "m", function ()
                                       awful.util.spawn("amixer set Master playback toggle", false )
                                       vicious.force({ volumewidget })
                                     end),
    -- Copy to clipboard
    awful.key({ modkey,        }, "c",      function () os.execute("xsel -p -o | xsel -i -b") end),

    -- User programs
    awful.key({ modkey,        }, "g",      function () awful.util.spawn( "google-chrome", false ) end),
    -- awful.key({ modkey,        }, "a",      function () awful.util.spawn( "midori", false ) end),
    awful.key({ modkey,        }, "s",      function () awful.util.spawn( "gui_editor") end),
    awful.key({ modkey, 	     }, "t", 	    function () awful.util.spawn( "gnome-terminal", false ) end),
    -- awful.key({ modkey,        }, "d", 	    function () awful.util.spawn( "spacefm", false ) end),
    
    -- Prompt
    awful.key({ modkey }, "r", function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey,           }, "q",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)

--[[
ooooooooo.               oooo                     
`888   `Y88.             `888                     
 888   .d88' oooo  oooo   888   .ooooo.   .oooo.o 
 888ooo88P'  `888  `888   888  d88' `88b d88(  "8 
 888`88b.     888   888   888  888ooo888 `"Y88b.  
 888  `88b.   888   888   888  888    .o o.  )88b 
o888o  o888o  `V88V"V8P' o888o `Y8bod8P' 8""888P' 
--]]

-- {{{ Rules

awful.rules.rules = {
     -- All clients will match this rule.
     { rule = { },
       properties = { border_width = beautiful.border_width,
                      border_color = beautiful.border_normal,
                      focus = true,
                      keys = clientkeys,
                      buttons = clientbuttons,
	                  size_hints_honor = false
                     }
      },
    
    { rule = { class = "Gimp" },
          properties = { tag = tags[1][4],
          floating = true } },
    { rule = { class = "Rtorrent" },
          properties = { tag = tags[1][6] } },

    { rule = { class = "Torrent-search" },
          properties = { tag = tags[1][6] } },
}

-- }}}
--[[
 .oooooo..o  o8o                                   oooo           
d8P'    `Y8  `"'                                   `888           
Y88bo.      oooo   .oooooooo ooo. .oo.    .oooo.    888   .oooo.o 
 `"Y8888o.  `888  888' `88b  `888P"Y88b  `P  )88b   888  d88(  "8 
     `"Y88b  888  888   888   888   888   .oP"888   888  `"Y88b.  
oo     .d8P  888  `88bod8P'   888   888  d8(  888   888  o.  )88b 
8""88888P'  o888o `8oooooo.  o888o o888o `Y888""8o o888o 8""888P' 
                  d"     YD                                       
                  "Y88888P'            
 --]]

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local title = awful.titlebar.widget.titlewidget(c)
        title:buttons(awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                ))

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(title)

        awful.titlebar(c):set_widget(layout)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- }}}

--[[
ooo        ooooo             oooo      .    o8o             oooo            
`88.       .888'             `888    .o8    `"'             `888            
 888b     d'888  oooo  oooo   888  .o888oo oooo  oo.ooooo.   888   .ooooo.  
 8 Y88. .P  888  `888  `888   888    888   `888   888' `88b  888  d88' `88b 
 8  `888'   888   888   888   888    888    888   888   888  888  888ooo888 
 8    Y     888   888   888   888    888 .  888   888   888  888  888    .o 
o8o        o888o  `V88V"V8P' o888o   "888" o888o  888bod8P' o888o `Y8bod8P' 
                                                  888                       
                                                 o888o                      
                                                                   
 .oooo.o  .ooooo.  oooo d8b  .ooooo.   .ooooo.  ooo. .oo.    .oooo.o 
d88(  "8 d88' `"Y8 `888""8P d88' `88b d88' `88b `888P"Y88b  d88(  "8 
`"Y88b.  888        888     888ooo888 888ooo888  888   888  `"Y88b.  
o.  )88b 888   .o8  888     888    .o 888    .o  888   888  o.  )88b 
8""888P' `Y8bod8P' d888b    `Y8bod8P' `Y8bod8P' o888o o888o 8""888P' 
                                                                              
                                            
--]]
-- Multiple screens

-- Get active outputs
local function outputs()
  local outputs = {}
  local xrandr = io.popen("xrandr -q")
  if xrandr then
    for line in xrandr:lines() do
      output = line:match("^([%w-]+) connected ")
      if output then
        outputs[#outputs + 1] = output
      end
    end
    xrandr:close()
  end

  return outputs
end

local function arrange(out)
  -- We need to enumerate all the way to combinate output. We assume
  -- we want only an horizontal layout.
  local choices  = {}
  local previous = { {} }
  for i = 1, #out do
    -- Find all permutation of length `i`: we take the permutation
    -- of length `i-1` and for each of them, we create new
    -- permutations by adding each output at the end of it if it is
    -- not already present.
    local new = {}
    for _, p in pairs(previous) do
      for _, o in pairs(out) do
        if not awful.util.table.hasitem(p, o) then
          new[#new + 1] = awful.util.table.join(p, {o})
        end
      end
    end
    choices = awful.util.table.join(choices, new)
    previous = new
  end

  return choices
end

-- Build available choices
local function menu()
  local menu = {}
  local out = outputs()
  local choices = arrange(out)

  for _, choice in pairs(choices) do
    local cmd = "xrandr"
    -- Enabled outputs
    for i, o in pairs(choice) do
      cmd = cmd .. " --output " .. o .. " --auto"
      if i > 1 then
        cmd = cmd .. " --right-of " .. choice[i-1]
      end
    end
    -- Disabled outputs
    for _, o in pairs(out) do
      if not awful.util.table.hasitem(choice, o) then
        cmd = cmd .. " --output " .. o .. " --off"
      end
    end

    local label = ""
    if #choice == 1 then
      label = 'Only <span weight="bold">' .. choice[1] .. '</span>'
    else
      for i, o in pairs(choice) do
        if i > 1 then label = label .. " + " end
          label = label .. '<span weight="bold">' .. o .. '</span>'
        end
    end

    menu[#menu + 1] = { label, cmd, "/usr/share/icons/gnome/32x32/devices/display.png"}
  end

  return menu
end

-- Display xrandr notifications from choices
local state = { iterator = nil,
                timer = nil,
                cid = nil }
local function xrandr()
   -- Stop any previous timer
   if state.timer then
      state.timer:stop()
      state.timer = nil
   end

   -- Build the list of choices
   if not state.iterator then
      state.iterator = awful.util.table.iterate(menu(),
          function() return true end)
   end

   -- Select one and display the appropriate notification
   local next  = state.iterator()
   local label, action, icon
   if not next then
      label, icon = "Keep the current configuration", "/usr/share/icons/gnome/32x32/devices/display.png"
      state.iterator = nil
   else
      label, action, icon = unpack(next)
   end
   state.cid = naughty.notify({ text = label,
                                icon = icon,
                                timeout = 4,
                                screen = mouse.screen, -- Important, not all screens may be visible
                                font = "Free Sans 18",
                                replaces_id = state.cid }).id

   -- Setup the timer
   state.timer = timer { timeout = 4 }
   state.timer:connect_signal("timeout",
                              function()
                                state.timer:stop()
                                state.timer = nil
                                state.iterator = nil
                                if action then
                                  awful.util.spawn(action, false)
                                end
                              end)
   state.timer:start()
end
