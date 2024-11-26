local QBCore = exports['qb-core']:GetCoreObject()
local Config =  {
    {
        name = "WEAPON_CARBINERIFLE",
        job = {"police"},
        gang = {},
    }
}

AddEventHandler('ox_inventory:usedItem', function(playerId, name, slotId, metadata)
    local src = playerId
    local player = QBCore.Functions.GetPlayer(src)
    local job = player.PlayerData.job.name
    local gang = player.PlayerData.gang.name

    for _, weaponConfig in ipairs(Config) do
        if weaponConfig.name == name then
            if #weaponConfig.job ~=0 then
                if not has_value(weaponConfig.job, job) then
                    TriggerClientEvent('QBCore:Notify', src, 'You are not allowed to use this item', 'error')
                    TriggerClientEvent('ox_inventory:disarm', playerId, true)
                end
            end
            if #weaponConfig.gang ~=0 then
                if not has_value(weaponConfig.gang, gang) then
                    TriggerClientEvent('QBCore:Notify', src, 'You are not allowed to use this item', 'error')
                    TriggerClientEvent('ox_inventory:disarm', playerId, true)
                end
            end
        end
    end
    
end)

function has_value (tab, val)
  for index, value in ipairs(tab) do
      if value == val then
          return true
      end
  end

  return false
end