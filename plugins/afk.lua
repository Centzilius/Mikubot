do

local function is_offline(hash)
  local afk = redis:hget(hash, 'afk')
  if afk == "true" then
    return true
  else
    return false
  end
end

local function get_afk_text(hash)
  local afk_text = redis:hget(hash, 'afk_text')
  if afk_text ~= nil and afk_text ~= "" and afk_text ~= "false" then
    return afk_text
  else
    return false
  end
end

local function switch_afk(user_name, user_id, chat_id, text)
  local hash =  'afk:'..chat_id..':'..user_id
  
  if is_offline(hash) then
    local afk_text = get_afk_text(hash)
    if afk_text then
      return 'Du bist bereits AFK ('..afk_text..')!'
	else
	  return 'Du bist bereits AFK!'
	end
  end
  
  print('Setting redis hash afk in '..hash..' to true')
  redis:hset(hash, 'afk', true)
  
  if text then
    print('Setting redis hash afk_text in '..hash..' to '..text)
    redis:hset(hash, 'afk_text', text)
    return user_name..' ist AFK ('..text..')'
  else
    return user_name..' ist AFK'
  end
end

local function pre_process(msg)
  if msg.to.type ~= "chat" then
    -- Ignore
    return msg
  end
  
  local receiver = get_receiver(msg)
  local user_name = get_name(msg)
  local user_id = msg.from.id
  local chat_id = msg.to.id
  local hash =  'afk:'..chat_id..':'..user_id
  
  
  if is_offline(hash) then
    local afk_text = get_afk_text(hash)
	redis:hset(hash, 'afk', false)
    if afk_text then
	  redis:hset(hash, 'afk_text', false)
      send_msg(receiver, user_name..' ist wieder da (war: '..afk_text..')!', ok_cb, false)
	else
	  send_msg(receiver, user_name..' ist wieder da!', ok_cb, false)
	end
  end
  
  return msg
end

local function run(msg, matches)
  if msg.to.type ~= "chat" then
    return "Mir ist's egal, ob du AFK bist ._."
  end
  
  local user_id = msg.from.id
  local chat_id = msg.to.id
  local user_name = get_name(msg)
  
  if matches[2] then
    return switch_afk(user_name, user_id, chat_id, matches[2])
  else
    return switch_afk(user_name, user_id, chat_id)
  end
end

return {
  description = 'AFK und online schalten',
  usage = "/afk (Text): Setzt Status auf AFK mit optionalem Text",
  patterns = {
    "^/([A|a][F|f][K|k])$",
    "^/([A|a][F|f][K|k]) (.*)$"
  }, 
  run = run,
  pre_process = pre_process
}

-- by Akamaru [https://ponywave.de]
-- modified by Brawl345 [http://wiidatabase.de]

end