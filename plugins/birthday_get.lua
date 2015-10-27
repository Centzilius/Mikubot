local function get_value(msg, var_name)
  local hash = 'telegram:birthdays'
  if hash then
    local value = redis:hget(hash, var_name)
    if not value then
      return'Geburtstag nicht gefunden, benutze "/getbd", um alle Geburtstage aufzulisten.'
    else
      return var_name..' hat am '..value..' Geburtstag'
    end
  end
end

local function list_variables(msg)
  local hash = 'telegram:birthdays'
  
  if hash then
    print('Getting variable from redis hash '..hash)
    local names = redis:hkeys(hash)
    local text = ''
	for i=1, #names do
	  variables = get_value(msg, names[i])
      text = text..variables.."\n"
    end
	if text == '' or text == nil then
	  return 'Keine Geburtstage vorhanden!'
	else
      return text
	end
  end
end

local function run(msg, matches)
  if matches[2] then
    return get_value(msg, matches[2])
  else
    return 'Geburtstagsliste:\n\n'..list_variables(msg)
  end
end

return {
  description = "Zeigt Geburtstage, die mit /setbd gesetzt wurden", 
  usage = {
    "/getbd: Gibt alle Geburtstage aus",
    "/getbd (Name): Gibt den Geburtstag aus."
  },
  patterns = {
    "^(/getbd) (.+)$",
    "^/getbd$"
  },
  run = run
}