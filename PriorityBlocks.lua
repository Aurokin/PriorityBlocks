local function eventHandler(self, event, ...)
  if ... == "PriorityBlocks" then
    if event == "ADDON_LOADED" then
      if PriorityBlocks_Loaded == nil then
        PriorityBlocks_Loaded = 1;
        local firstShow = StaticPopup_Show("firstTime_PriorityBlocks")
        print("Welcome To Priority Blocks");
      end
    end
  end
end

--
pbMainHeight = 256;
pbMainWidth = 256;

-- Register Frames
local frame = CreateFrame("Frame", "PriorityButtonsFrame", UIParent);
frame.texture = frame:CreateTexture(nil,"BACKGROUND");
-- Register Events
frame:RegisterEvent("ADDON_LOADED");

-- Set Frame Height/Width
frame:SetHeight(pbMainHeight);
frame:SetWidth(pbMainWidth);

-- Give Frame Background
frame.texture:SetAllPoints(frame)
frame.texture:SetTexture(0.5, 0.5, 0.5, 0.5);

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

-- Show Main Container Frame
print("Hello World");
frame:SetPoint("CENTER", 0, 0);
frame:Show();
