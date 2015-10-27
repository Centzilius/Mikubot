do

-- Returns the key (index) in the config.enabled_plugins table
local function plugin_enabled( name, chat )
  for k,v in pairs(enabled_plugins) do
    if name == v then
      return k
    end
  end
  -- If not found
  return false
end

-- Returns true if file exists in plugins folder
local function plugin_exists( name )
  for k,v in pairs(plugins_names()) do
    if name..'.lua' == v then
      return true
    end
  end
  return false
end

local function list_plugins(only_enabled)
  local text = ''
  for k, v in pairs( plugins_names( )) do
    --  ✔ enabled, ❌ disabled
    local status = '❌'
    -- Check if is enabled
    for k2, v2 in pairs(enabled_plugins) do
      if v == v2..'.lua' then 
        status = '✔' 
      end
    end
    if not only_enabled or status == '✔' then
      -- get the name
      v = string.match (v, "(.*)%.lua")
      text = text..v..'  '..status..'\n'
    end
  end
  return text
end

local function reload_plugins(plugin_name, status)
  plugins = {}
  load_plugins()
  if plugin_name then
    return 'Das Plugin "'..plugin_name..'" wurde '..status
  else
    return 'Plugins wurden neu geladen'
  end
end


local function enable_plugin( plugin_name )
  print('überprüfe ob "'..plugin_name..'" existiert')
  -- Check if plugin is enabled
  if plugin_enabled(plugin_name) then
    return 'Das Plugin "'..plugin_name..'" ist bereits aktiviert'
  end
  -- Checks if plugin exists
  if plugin_exists(plugin_name) then
    -- Add to redis set
    redis:sadd('telegram:enabled_plugins', plugin_name)
	print(plugin_name..' saved to redis set telegram:enabled_plugins')
    -- Reload the plugins
    return reload_plugins(plugin_name, 'aktiviert')
  else
    return 'Plugin '..plugin_name..' existiert nicht'
  end
end

local function disable_plugin( name, chat )
  -- Check if plugins exists
  if not plugin_exists(name) then
    return 'Das Plugin "'..name..'" existiert nicht'
  end
  local k = plugin_enabled(name)
  -- Check if plugin is enabled
  if not k then
    return 'Plugin '..name..' ist nicht aktiviert'
  end
  -- Disable and reload
    redis:srem('telegram:enabled_plugins', name)
	print(name..' saved to redis set telegram:enabled_plugins')
  return reload_plugins(name, 'deaktiviert')    
end

local function disable_plugin_on_chat(msg, plugin)
  if not plugin_exists(plugin) then
    return "Dieses Plugin existiert nicht!"
  end
  
  local hash = get_redis_hash(msg, 'disabled_plugins')
  local disabled = redis:hget(hash, plugin)

  if disabled ~= 'true' then
    print('Setting '..plugin..' in redis hash '..hash..' to true')
    redis:hset(hash, plugin, true)
	return 'Das Plugin "'..plugin..'" wurde für diesen Chat deaktiviert.'
  else
    return 'Das Plugin "'..plugin..'" wurde für diesen Chat bereits deaktiviert.'
  end
end

local function reenable_plugin_on_chat(msg, plugin)
  if not plugin_exists(plugin) then
    return "Dieses Plugin existiert nicht!"
  end
  
  local hash = get_redis_hash(msg, 'disabled_plugins')
  local disabled = redis:hget(hash, plugin)
  
  if disabled == nil then return 'Es gibt keine deaktivierten Plugins für disen Chat.' end

  if disabled == 'true' then
    print('Setting '..plugin..' in redis hash '..hash..' to false')
    redis:hset(hash, plugin, false)
	return 'Das Plugin "'..plugin..'" wurde für diesen Chat reaktiviert.'
  else
    return 'Das Plugin "'..plugin..'" ist nicht deaktiviert.'
  end
end

local function run(msg, matches)
  -- Show the available plugins 
  if matches[1] == '/plugins' then
    return list_plugins()
  end

  -- Reenable a plugin for this chat
  if matches[1] == 'enable' and matches[3] == 'chat' then
    local plugin = matches[2]
    print('Aktiviere "'..plugin..'" in diesem Chat')
    return reenable_plugin_on_chat(msg, plugin)
  end

  -- Enable a plugin
  if matches[1] == 'enable' then
    local plugin_name = matches[2]
    print('Aktiviere: "'..matches[2]..'"')
    return enable_plugin(plugin_name)
  end

  -- Disable a plugin on a chat
  if matches[1] == 'disable' and matches[3] == 'chat' then
    local plugin = matches[2]
    print('Deaktiviere "'..plugin..'" in diesem Chat')
    return disable_plugin_on_chat(msg, plugin)
  end

  -- Disable a plugin
  if matches[1] == 'disable' then
    print('Deaktiviere: "'..matches[2]..'"')
    return disable_plugin(matches[2])
  end

  -- Reload all the plugins!
  if matches[1] == 'reload' or '/reload' then
    return reload_plugins()
  end
end

return {
  description = "Aktiviert, deaktiviert und lädt Plugins (nur Superuser)", 
  usage = {
    "/plugins: Liste alle Plugins auf.", 
    "/plugins enable [plugin]: Aktiviert Plugin.",
    "/plugins disable [plugin]: Deaktiviert Plugin.",
    "/plugins enable [plugin] chat: Aktiviert Plugin in diesem Chat.",
    "/plugins disable [plugin] chat: Deaktiviert Plugin in diesem Chat.",
    "/plugins reload: Lädt alle Plugins neu (Alias: /reload)."
  },
  patterns = {
    "^/plugins$",
    "^/plugins? (enable) ([%w_%.%-]+)$",
    "^/plugins? (disable) ([%w_%.%-]+)$",
    "^/plugins? (enable) ([%w_%.%-]+) (chat)",
	"^/plugins? (disable) ([%w_%.%-]+) (chat)",
    "^/plugins? (reload)$",
	"^/reload$"
	}, 
  run = run,
  privileged = true
}

end