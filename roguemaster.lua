local box1 = CreateFrame("Frame", "MyBox1", UIParent)
box1:SetSize(50, 50)
box1:SetPoint("CENTER", 25,0)
box1.texture = box1:CreateTexture(nil, "BACKGROUND")
box1.texture:SetAllPoints()
box1.texture:SetColorTexture(0, 0, 0, 1)

local f = CreateFrame("Frame")

f:SetScript("OnUpdate", function(self, elapsed)
    box1.texture:SetColorTexture(0, 0, 0, 1)
     local skilluse= IsUsableSpell("Claw")
    if UnitAffectingCombat("player") then
        print("You are in combat!")
         box1.texture:SetColorTexture(1, 1, 0, 1)

        local health, maxHealth = UnitHealth("target"), UnitHealthMax("target")
       


        if UnitExists("target") and health == maxHealth then
            print("Your target is at full health.")
            box1.texture:SetColorTexture(1, 1, 0, 1)
       
        elseif not (UnitExists("target") and UnitExists("party1target")) then
               print("you are not targeting the leader target.")
                box1.texture:SetColorTexture(0, 1, 1, 1)
        elseif not IsCurrentSpell("Attack") then
             print("You are not auto-attacking.")
                box1.texture:SetColorTexture(0, 1, 0, 1)

        elseif skilluse then
              
                local comboPoints = GetComboPoints("player", "target")





                if comboPoints >= 3 then
                    print("can cast bite!!")
                    box1.texture:SetColorTexture(1, 0, 0, 1)
                else 
                    print("You have enough energy for Claw!")
                    box1.texture:SetColorTexture(0, 0, 1, 1)
                end

   

        end    
        
   





    else
        print("You are not in combat.")
    end



    -- local comboPoints = GetComboPoints("player", "target")





    -- if comboPoints >= 3 then
    --     print("can cast eviscerate!")
    --     box1.texture:SetColorTexture(1, 0, 0, 1)
    -- else 
    --      box1.texture:SetColorTexture(0, 0, 0, 1)
    -- end


end)
