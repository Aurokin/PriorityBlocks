local function eventHandler(self, event, ...)
  if event == "ADDON_LOADED" then
    if PriorityBlocks_Loaded == nil then
      PriorityBlocks_Loaded = 1;
      local firstShow = StaticPopup_Show("firstTime_PriorityBlocks")
      print("Welcome To Priority Blocks");
    end
  end
end


-- Register Frames
local frame = CreateFrame("Frame", "PriorityButtonsFrame", UIParent);
-- Register Events
frame:RegisterEvent("ADDON_LOADED");
-- Addon PopupDialogs
StaticPopupDialogs["firstTime_PriorityBlocks"] = {
  text = "Welcome To Priority Blocks",
  button1 = "Okay",
  OnAccept = function()

  end,
  timeout = 0,
  whileDead = true,
  hideOnEscape = true,
  preferredIndex = 3,  -- avoid some UI taint, see http://www.wowace.com/announcements/how-to-avoid-some-ui-taint/
}
-- Manage Events
frame:SetScript("OnEvent", eventHandler);
