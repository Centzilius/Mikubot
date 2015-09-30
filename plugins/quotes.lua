do

local function save_quote(msg)
  if msg.text:sub(11):isempty() then
    return "Benutzung: !addquote [Zitat]"
  end
  
  local quote = msg.text:sub(11)
  local hash = get_redis_hash(msg, 'quotes')
  print('Saving quote to redis set '..hash)
  redis:sadd(hash, quote)
  return 'Gespeichert: "'..quote..'"'
end

local function delete_quote(msg)
  if msg.text:sub(11):isempty() then
    return "Benutzung: !delquote [Zitat]"
  end
  
  local quote = msg.text:sub(11)
  local hash = get_redis_hash(msg, 'quotes')
  print('Deleting quote from redis set '..hash)
  if redis:sismember(hash, quote) == true then
    redis:srem(hash, quote)
    return 'Zitat erfolgreich gelöscht!'
  else
    return 'Dieses Zitat existiert nicht.'
  end
end

local function get_quote(msg)
  local to_id = tostring(msg.to.id)
  local hash = get_redis_hash(msg, 'quotes')
  
  if hash then
    print('Getting quote from redis set '..hash)
  	quotes_table = redis:smembers(hash)
	if not quotes_table[1] then
	  return 'Es wurden noch keine Zitate gespeichert.\nSpeichere doch welche mit !addquote [Zitat]'
	else
	  return quotes_table[math.random(1,#quotes_table)]
	end
  end
end

local function run(msg, matches)
  if string.match(msg.text, "/quote$") then
    return get_quote(msg)
  elseif matches[1] == "addquote" then
    return save_quote(msg)
  elseif matches[1] == "delquote" then
    if not is_sudo(msg) then
      return "Du bist kein Superuser. Dieser Vorfall wird gemeldet."
    else
      return delete_quote(msg)
	end
  end
end

return {
  description = "Zitate speichern, löschen und abrufen.",
  usage = {
    "/addquote [Zitat]: Fügt Zitat hinzu.",
	"/quote: Gibt zufälliges Zitat aus.",
	"/delquote [Zitat]: Löscht das Zitat (nur Superuser)"
  },
  patterns = {
    "^/(delquote) (.+)$",
    "^/(addquote) (.+)$",
    "^/quote$"
  },
  run = run
}

end