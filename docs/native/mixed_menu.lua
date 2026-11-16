-- Stored controls in an independent native window; F6 toggles it.
local window=ui.create_window("custom","Lua controls",{x=160,y=160,width=320,height=300,key=117,open=false})
local controls={
    ui.create("checkbox","enabled","Enabled",true),
    ui.create("slider","amount","Amount",50,0,100),
    ui.create("combo","mode","Mode",1,{"One","Two","Three"}),
    ui.create("text","message","Message","Hello"),
    ui.create("color","tint","Tint",{159,202,43,255})
}
for _,control in ipairs(controls) do ui.attach_window(control,window) end
