-- A Lua-owned active keybind list with animated text color.
local enabled = ui.create("checkbox", "rgb_keybinds_enabled", "RGB keybinds", false)
local speed = ui.create("slider", "rgb_keybinds_speed", "RGB speed", 1, 0.1, 5)
local position_x = ui.create("slider", "rgb_keybinds_x", "Position X", 100, 0, 7680)
local position_y = ui.create("slider", "rgb_keybinds_y", "Position Y", 400, 0, 4320)

events.on("paint", function()
    if not ui.get(enabled) then return end
    local phase = client.time() * ui.get(speed)
    local function channel(offset)
        return math.floor(127.5 + 127.5 * math.sin(phase + offset))
    end
    local color = {channel(0), channel(2.0944), channel(4.1888), 255}
    local x, y = ui.get(position_x), ui.get(position_y)
    render.text(x, y, "KEYBINDS", color)
    local count = 0
    for _, bind in ipairs(settings.binds()) do
        if bind.active and bind.value then
            count = count + 1
            render.text(x, y + count * 18, bind.name, color)
            if count >= 24 then break end
        end
    end
end)
