function PriorityBlocks_OnLoad()
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


  local firstShow = StaticPopup_Show("firstTime_PriorityBlocks")
end
