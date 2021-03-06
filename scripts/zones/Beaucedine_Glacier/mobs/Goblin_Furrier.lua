-----------------------------------
-- Area: Beaucedine Glacier
--  Mob: Goblin Furrier
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 46, 2, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 49, 1, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 50, 2, tpz.regime.type.FIELDS)
end

return entity
