-----------------------------------
-- Area: Caedarva Mire
--  NPC: ???
-- Involved in quest "Not Meant to Be"
-- !pos 456.993 -7.000 -270.815 79
-----------------------------------
local ID = require("scripts/zones/Caedarva_Mire/IDs")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local notMeantToBeProg = player:getCharVar("notmeanttobeCS")

    if notMeantToBeProg == 1 then
        player:startEvent(16)
    elseif
        player:getQuestStatus(tpz.quest.log_id.AHT_URHGAN, tpz.quest.id.ahtUrhgan.NOT_MEANT_TO_BE) == QUEST_ACCEPTED and
        notMeantToBeProg == 3 and
        not GetMobByID(ID.mob.LAMIA_NO27):isSpawned() and
        not GetMobByID(ID.mob.MOSHDAHN):isSpawned()
    then
        player:startEvent(17)
    elseif player:getCharVar("notmeanttobeMoshdahnKilled") == 1 and player:getCharVar("notmeanttobeLamia27Killed") == 1 then
        player:startEvent(18)
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 16 then
        player:setCharVar("notmeanttobeCS", 2)
    elseif csid == 17 and not GetMobByID(ID.mob.LAMIA_NO27):isSpawned() and not GetMobByID(ID.mob.MOSHDAHN):isSpawned() then
        SpawnMob(ID.mob.LAMIA_NO27):updateClaim(player)
        SpawnMob(ID.mob.MOSHDAHN):updateClaim(player)
    elseif csid == 18 then
        player:setCharVar("notmeanttobeMoshdahnKilled", 0)
        player:setCharVar("notmeanttobeLamia27Killed", 0)
        player:setCharVar("notmeanttobeCS", 5)
    end
end

return entity
