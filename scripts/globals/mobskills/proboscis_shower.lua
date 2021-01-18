-----------------------------------
-- Proboscis Shower
-- Description: Restores HP.
-- Copied from Healing Breeze: needs retail calculations
-----------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    local potency = skill:getParam()

    if potency == 0 then
        potency = 13
    end

    potency = potency - math.random(0, potency/4)

    skill:setMsg(tpz.msg.basic.SELF_HEAL)

    return MobHealMove(mob, mob:getMaxHP() * potency / 100)
end

return mobskill_object
