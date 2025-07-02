local box1 = CreateFrame("Frame", "MyBox1", UIParent)
box1:SetSize(50, 50)
box1:SetPoint("CENTER", 25,0)
box1.texture = box1:CreateTexture(nil, "BACKGROUND")
box1.texture:SetAllPoints()
box1.texture:SetColorTexture(0, 0, 0, 1)

local f = CreateFrame("Frame")
local currentFollowTarget = nil
f:SetScript("OnUpdate", function(self, elapsed)
    box1.texture:SetColorTexture(0, 0, 0, 1)
     local skilluse= IsUsableSpell("Sinister Strike")
    
    if IsInGroup() then

         if UnitAffectingCombat("party1") then
            box1.texture:SetColorTexture(1, 1, 0, 1) 
                if not currentFollowTarget then
                    box1.texture:SetColorTexture(1, 1, 1, 1)
                elseif not IsCurrentSpell("Attack") then
                    print("You are not auto-attacking.")
                    box1.texture:SetColorTexture(0, 1, 0, 1)
                elseif not UnitIsUnit("target", "party1target") then
                    print("You are NOT targeting the same target as party1.")
                    box1.texture:SetColorTexture(0, 0, 1, 1)
                elseif UnitHealth("target") == UnitHealthMax("target") then
                    print("your target is full hp.")
                     box1.texture:SetColorTexture(0, 0, 0, 1)
                elseif skilluse then
                    local comboPoints = GetComboPoints("player", "target")
                    if comboPoints >= 3 then
                        print("can cast finisher!!")
                        box1.texture:SetColorTexture(1, 0, 0, 1)
                    else 
                        print("You have enough energy for Claw!")
                        box1.texture:SetColorTexture(0, 1, 1, 1)
                    end
                end


         else
            print("You party leader are not in combat.")
         end
    
    
    end
    


   





end)


f:RegisterEvent("AUTOFOLLOW_BEGIN")
f:RegisterEvent("AUTOFOLLOW_END")

f:SetScript("OnEvent", function(self, event, arg1)
    if event == "AUTOFOLLOW_BEGIN" then
        currentFollowTarget = arg1
        print("Started following: " .. (arg1 or "unknown"))
    elseif event == "AUTOFOLLOW_END" then
        print("Stopped following.")
         currentFollowTarget = nil
    end
end)

    --  local skilluse= IsUsableSpell("Claw")

  

    --      if UnitAffectingCombat("party1") then
    --             print("You are in combat!")
    --             box1.texture:SetColorTexture(1, 1, 0, 1)

    --             if not IsCurrentSpell("Attack") then
    --                 print("You are not auto-attacking.")
    --                 box1.texture:SetColorTexture(0, 1, 0, 1)
    --             elseif not UnitIsUnit("target", "party1target") then
    --                 print("You are NOT targeting the same target as party1.")
    --                 box1.texture:SetColorTexture(0, 1, 1, 1)
    --             elseif UnitHealth("target") == UnitHealthMax("target") then
    --                 print("your target is full hp.")
    --                  box1.texture:SetColorTexture(0, 0, 0, 1)
    --             elseif skilluse then
              
    --                 local comboPoints = GetComboPoints("player", "target")





    --                 if comboPoints >= 3 then
    --                     print("can cast bite!!")
    --                     box1.texture:SetColorTexture(1, 0, 0, 1)
    --                 else 
    --                     print("You have enough energy for Claw!")
    --                     box1.texture:SetColorTexture(0, 0, 1, 1)
    --                 end

   

    --             end    
    --     else
    --         print("You are not in combat.")
    --     end
   
    








    -- end