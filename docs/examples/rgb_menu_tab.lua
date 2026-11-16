-- Independent stored-control window. F6 toggles it.
local window=ui.create_window("rgb","RGB Lab",{x=160,y=160,width=320,height=220,key=117,open=false})
local enabled=ui.create("checkbox","enabled","Animate menu accent",false)
local speed=ui.create("slider","speed","RGB speed",1,.1,4)
ui.attach_window(enabled,window)
ui.attach_window(speed,window)
events.on("paint",function()
    if not ui.get(enabled) then ui.reset_theme(); return end
    local t=client.time()*ui.get(speed)
    local color={math.floor(127+127*math.sin(t)),math.floor(127+127*math.sin(t+2.094)),math.floor(127+127*math.sin(t+4.189)),255}
    ui.set_style_color("menu","accent_color",color)
end)
