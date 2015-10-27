local function save_value(msg, name, value)
  if (not name or not value) then
    return "Benutzung: /setbd [Name] [Tag. Monat]"
  end

  local hash = 'telegram:birthdays'
  if hash then
     print('Saving variable to redis hash '..hash)
    redis:hset(hash, name, value)
    return "Geburtstag von "..name.." am "..value.." gespeichert!"
  end
end

local function delete_value(msg, name)
  local hash = 'telegram:birthdays'
  if redis:hexists(hash, name) == true then
    print('Deleting birthday from redis hash '..hash)
    redis:hdel(hash, name)
    return 'Geburtstag von "'..name..'" erfolgreich gelöscht!'
  else
    return 'Du kannst keinen Geburtstag löschen, der nicht existiert ._.'
  end
end

local function run(msg, matches)
  local name = string.sub(matches[1], 1, 50)
  local value = string.sub(matches[2], 1, 1000)

  if value == "nil" then
    text = delete_value(msg, name, value)
  else
    text = save_value(msg, name, value)
  end
  return text
end

return {
  description = "Speichert Geburtstage.", 
  usage = {
    "/setbd [Name] [Tag. Monat]: Speichert ein Geburtstag.",
	"/setbd (Name) nil: Löscht Geburtstag"
  },
  patterns = {
    "^/setbd ([^%s]+) (.+)$"
  }, 
  run = run 
}