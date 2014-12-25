local function getContainerWidth(size, blocks, margin)
  print(size, blocks, margin);
  local width = size * blocks + (margin * (blocks - 1));
  return width;
end

local function createPriorityBlock(size, blocks, margin, number)
  local minibox = CreateFrame("Frame", "PriorityButton" .. number, PriorityButtonsFrame);
  local x = (size * (number - 1)) + (margin * (number - 1));
  minibox.texture = minibox:CreateTexture(nil, "BACKGROUND");
  print("Hello World3");
  minibox:SetHeight(size);
  minibox:SetWidth(size);
  print("Hello World4");
  minibox.texture:SetAllPoints(minibox);
  minibox.texture:SetTexture(1.0, 0.6, 0.2, 1.0);
  minibox:SetPoint("BOTTOMLEFT", x, 0);
  print("Hello World5");
  minibox:Show();
  print("Hello World6");
end

local function createContainer(self, size, blocks, margin, x, y)
  self:SetHeight(PriorityBlocks_Size);
  print("Set Height");
  print(PriorityBlocks_Size);
  local pbWidth = getContainerWidth(size, blocks, margin);
  print("Calculated Width");
  self:SetWidth(pbWidth);
  print("Set Width");
  self.texture:SetAllPoints(self)
  self.texture:SetTexture(0.5, 0.5, 0.5, 0.5);
  self:SetPoint("CENTER", x, y);
  self:Show();

  for i = 1, blocks, 1 do
    createPriorityBlock(size, blocks, margin, i);
  end
end

local function eventHandler(self, event, ...)
  if ... == "PriorityBlocks" then
    if event == "ADDON_LOADED" then
      if PriorityBlocks_Loaded == nil then
        PriorityBlocks_Loaded = 1;
        local firstShow = StaticPopup_Show("firstTime_PriorityBlocks")
        print("Welcome To Priority Blocks");
      end
      if PriorityBlocks_Blocks == nil then
        PriorityBlocks_Blocks = 5;
      end
      if PriorityBlocks_Size == nil then
        PriorityBlocks_Size = 64;
      end
      if PriorityBlocks_Margin == nil then
        PriorityBlocks_Margin = 16;
      end
      if PriorityBlocks_X == nil then
        PriorityBlocks_X = 0;
      end
      if PriorityBlocks_Y == nil then
        PriorityBlocks_Y = 0;
      end
      createContainer(self, PriorityBlocks_Size, PriorityBlocks_Blocks, PriorityBlocks_Margin, PriorityBlocks_X, PriorityBlocks_Y);
    end
  end
end

-- Global Variables (Most likely saved later)
pbMainHeight = 256;
pbMainWidth = 256;
pbSize = 64;
pbMargin = 12;

-- Register Frames
local frame = CreateFrame("Frame", "PriorityButtonsFrame", UIParent);
frame.texture = frame:CreateTexture(nil,"BACKGROUND");
-- Register Events
frame:RegisterEvent("ADDON_LOADED");

-- Set Frame Height/Width
-- frame:SetHeight(pbMainHeight);
-- frame:SetWidth(pbMainWidth);

-- Give Frame Background
--frame.texture:SetAllPoints(frame)
--frame.texture:SetTexture(0.5, 0.5, 0.5, 0.5);

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
--frame:SetPoint("CENTER", 0, 0);
--frame:Show();

print("Hello World2");
--createPriorityBlock(1);
--createPriorityBlock(2);
--createPriorityBlock(3);
--createPriorityBlock(4);
