local _file_values = './data/values.lua'

_values = load_from_file(_file_values)

local function fetch_value(chat, value_name)
  -- Chat non exists
  if _values[chat] == nil then
    return nil
  end

  if value_name == nil then
    return nil
  end 

  local value = _values[chat][value_name]
  return value
end

local function get_value(chat, value_name)

  -- If chat values is empty
  if (_values[chat] == nil) then
    return "Hier sind keine Daten"
  end

  -- If there is not value name, return all the values.
  if (value_name == nil ) then
    local text = ""
    for key,value in pairs(_values[chat]) do
      text = text..key.." = "..value.."\n"
    end
    return text
  end 
  local value = _values[chat][value_name]
  if ( value == nil) then
    return 'Konnte "'..value_name..' nicht finden'
  end
  return value_name.." = "..value
end

local function run(msg, matches)
  local chat_id = tostring(msg.to.id)
  if matches[1] == "/get" then
    return get_value(chat_id, nil)
  end
  return get_value(chat_id, matches[1])
end

local function lex(msg)

  if msg.text then
    local text = msg.text
    local chat_id = tostring(msg.to.id)
    local s, e = text:find("%$%a+")

    if s then
      local var = text:sub(s + 1, e)
      local value = fetch_value(chat_id, var)
      
      if (value == nil) then
        value = "(Unbekannter Wert " .. var .. ")"
      end

      msg.text = text:sub(0, s - 1) .. value .. text:sub(e + 1)
    end
  end

  return msg
end

return {
    description = "Bekommt Variable, die mit /set gesetzt wurde", 
    usage = {"/get (Variable)"},
    patterns = {"^/get (%a+)$","^/get$"}, 
    patterns = {"^/get (%a+)$","^/get$"}, 
    run = run,
    pre_process = lex
}
