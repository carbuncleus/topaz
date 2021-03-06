-----------------------------------
-- ID: 4560
-- Item: bowl_of_vegetable_soup
-- Food Effect: 3Hrs, All Races
-----------------------------------
-- Vitality -1
-- Agility 4
-- Ranged Accuracy 5
-- HP Recovered While Healing 3
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    local result = 0
    if target:hasStatusEffect(tpz.effect.FOOD) or target:hasStatusEffect(tpz.effect.FIELD_SUPPORT_FOOD) then
        result = tpz.msg.basic.IS_FULL
    end
    return result
end

item_object.onItemUse = function(target)
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 10800, 4560)
end

item_object.onEffectGain = function(target, effect)
    target:addMod(tpz.mod.VIT, -1)
    target:addMod(tpz.mod.AGI, 4)
    target:addMod(tpz.mod.RACC, 5)
    target:addMod(tpz.mod.HPHEAL, 3)
end

item_object.onEffectLose = function(target, effect)
    target:delMod(tpz.mod.VIT, -1)
    target:delMod(tpz.mod.AGI, 4)
    target:delMod(tpz.mod.RACC, 5)
    target:delMod(tpz.mod.HPHEAL, 3)
end

return item_object
