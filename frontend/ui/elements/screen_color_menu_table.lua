local Event = require("ui/event")
local Screen = require("device").screen
local UIManager = require("ui/uimanager")
local CanvasContext = require("document/canvascontext")
local _ = require("gettext")

return {
    text = _("Color rendering"),
    enabled_func = Screen.isColorScreen,
    checked_func = Screen.isColorEnabled,
    callback = function()
        local new_val = Screen.isColorEnabled()
        CanvasContext:setColorRenderingEnabled(new_val)
        G_reader_settings:saveSetting("color_rendering", new_val)
        UIManager:broadcastEvent(Event:new("ColorRenderingUpdate"))
    end
}
