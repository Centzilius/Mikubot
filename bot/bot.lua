require("./bot/utils")

VERSION = '2.5-reloaded'

-- This function is called when tg receive a msg
function on_msg_receive (msg)

  if not started then
    return
  end

  local receiver = get_receiver(msg)
  
  -- vardump(msg)
  if msg_valid(msg) then
    msg = pre_process_msg(msg)
    match_plugins(msg)
    --mark_read(receiver, ok_cb, false)
  end
end

function ok_cb(extra, success, result)
end

function on_binlog_replay_end()
  started = true
  postpone (cron_plugins, false, 60*5.0)
  -- See plugins/ping.lua as an example for cron

  _config = load_config()
  cred_data = load_cred()

  -- load plugins
  plugins = {}
  load_plugins()
end

function msg_valid(msg)
  -- Dont process outgoing messages
  if msg.out then
    print('\27[36mNot valid: msg from us\27[39m')
    return false
  end
  
  -- Before bot was started
  if msg.date < now then
    print('\27[36mNot valid: old msg\27[39m')
    return false
  end
  
  if msg.unread == 0 then
    print('\27[36mNot valid: readed\27[39m')
    return false
  end

  if msg.service then
    print('\27[36mNot valid: service\27[39m')
    return false
  end

  if not msg.to.id then
    print('\27[36mNot valid: To id not provided\27[39m')
    return false
  end

  if not msg.from.id then
    print('\27[36mNot valid: From id not provided\27[39m')
    return false
  end

  return true
end

-- Apply plugin.pre_process function
function pre_process_msg(msg)
  for name,plugin in pairs(plugins) do
    if plugin.pre_process then
      msg = plugin.pre_process(msg)
    end
  end

  return msg
end

-- Go over enabled plugins patterns.
function match_plugins(msg)
  for name, plugin in pairs(plugins) do
    match_plugin(plugin, name, msg)
  end
end

-- Check if plugin is on _config.disabled_plugin_on_chat table
local function is_plugin_disabled_on_chat(plugin_name, receiver)
  local disabled_chats = _config.disabled_plugin_on_chat
  -- Table exists and chat has disabled plugins
  if disabled_chats and disabled_chats[receiver] then
    -- Checks if plugin is disabled on this chat
    for disabled_plugin,disabled in pairs(disabled_chats[receiver]) do
      if disabled_plugin == plugin_name and disabled then
        local warning = ''
        print(warning)
        send_msg(receiver, warning, ok_cb, false)
        return true
      end
    end
  end
  return false
end

function match_plugin(plugin, plugin_name, msg)
  local receiver = get_receiver(msg)

  -- Go over patterns. If one matches is enough.
  for k, pattern in pairs(plugin.patterns) do
    local matches = match_pattern(pattern, msg.text)
    if matches then
      print("msg matches: ", pattern)
	  
	  if is_plugin_disabled_on_chat(plugin_name, receiver) then
        return nil
	  end
      -- Function exists
      if plugin.run then
        -- check if user has privileges
          if can_use_bot(msg) then
	    print("Gesperrt")
            -- local text = 'Du darfst den Bot nicht nutzen!'
           -- send_msg(receiver, text, ok_cb, false)
          else
	-- If plugin is for privileged users only
        if not warns_user_not_allowed(plugin, msg) then
          local result = plugin.run(msg, matches)
          if result then
			send_large_msg(receiver, result)
          end
        end
      end
     end
      -- One pattern matches
      return
    end
  end
end

-- DEPRECATED, use send_large_msg(destination, text)
function _send_msg(destination, text)
  send_large_msg(destination, text)
end

-- Save the content of _config to config.lua
function save_config( )
  serialize_to_file(_config, './data/config.lua')
  print ('saved config into ./data/config.lua')
end

-- Returns the config from config.lua file.
-- If file doesnt exists, create it.
function load_config( )
  local f = io.open('./data/config.lua', "r")
  -- If config.lua doesnt exists
  if not f then
    print ("Created new config file: data/config.lua")
    create_config()
  else
    f:close()
  end
  local config = loadfile ("./data/config.lua")()
  for v,user in pairs(config.sudo_users) do
    print("Allowed user: " .. user)
  end
  return config
end

function load_cred( )
  local cf = io.open('./data/credentials.lua', "r")
  -- If credentials.lua doesnt exists
  if not cf then
    print ("Created new credentials file: data/credentials.lua")
    create_cred()
  else
    cf:close()
  end
  local _file_cred = loadfile ("./data/credentials.lua")()
  return _file_cred
end

-- Create a basic config.json file and saves it.
function create_config( )
  -- A simple config with basic plugins and ourserves as priviled user
  config = {
    enabled_plugins = {
      "9gag",
      "eur",
      "echo",
      "btc",
      "get",
      "giphy",
      "google",
      "gps",
      "help",
      "images",
      "img_google",
      "location",
      "media",
      "plugins",
      "channels",
      "set",
      "stats",
      "time",
      "version",
      "weather",
      "xkcd",
      "youtube" },
    sudo_users = {our_id},
    disabled_channels = {}
  }
  serialize_to_file(config, './data/config.lua')
  print ('saved config into ./data/config.lua')
end

function create_cred( )
  cred = {
  bitly_access_token = "",
  cloudconvert_apikey = "",
  derpibooru_apikey = "",
  fb_access_token = "",
  gender_apikey = "",
  google_apikey = "",
  google_cse_id = "",
  instagram_access_token = "",
  lyricsnmusic_apikey = "",
  neutrino_userid = "",
  neutrino_apikey = "",
  page2images_restkey = "",
  soundcloud_client_id = "",
  superfeedr_authorization = "",
  tw_consumer_key = "",
  tw_consumer_secret = "",
  tw_access_token = "",
  tw_access_token_secret = "",
  x_mashape_key = "",
  yandex_translate_apikey = "",
  yandex_rich_content_apikey = ""
  }
  serialize_to_file(cred, './data/credentials.lua')
  print ('saved credentials into ./data/credentials.lua')
end

function on_our_id (id)
  our_id = id
end

function on_user_update (user, what)
  --vardump (user)
end

function on_chat_update (chat, what)
  --vardump (chat)
end

function on_secret_chat_update (schat, what)
  --vardump (schat)
end

function on_get_difference_end ()
end

-- Enable plugins in config.json
function load_plugins()
  for k, v in pairs(_config.enabled_plugins) do
    print("Loading plugin", v)
    local t = loadfile("plugins/"..v..'.lua')()
    plugins[v] = t
  end
end

-- Call and postpone execution for cron plugins
function cron_plugins()

  for name, plugin in pairs(plugins) do
    -- Only plugins with cron function
    if plugin.cron ~= nil then
      plugin.cron()
    end
  end

  -- Called again in 5 mins
  postpone (cron_plugins, false, 5*60.0)
end

-- Start and load values
our_id = 0
now = os.time()
math.randomseed(now)
started = false
