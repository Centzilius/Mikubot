local _file_values = './data/values.lua'

local function save_value(chat, text )
	var_name, var_value = string.match(text, "!set (%a+) (.+)")
	if (var_name == nil or var_value == nil) then
		return "Benutzung: /set var_name value"
	end
	if _values[chat] == nil then
		_values[chat] = {}
	end
	_values[chat][var_name] = var_value

	-- Save values to file
	serialize_to_file(_values, _file_values)
	
	return "Gespeichert: "..var_name.." = "..var_value
end

local function run(msg, matches)
	local chat_id = tostring(msg.to.id)
	local text = save_value(chat_id, msg.text)
	return text
end

return {
    description = "Setze Variable", 
    usage = "/set [Variablenname] [Daten]",
    patterns = {"^/set (%a+) (.+)$"}, 
    run = run 
}
