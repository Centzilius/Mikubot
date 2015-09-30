do

  function pairsByKeys(t, f)
    local a = {}
    for n in pairs(t) do table.insert(a, n) end
    table.sort(a, f)
    local i = 0      -- iterator variable
    local iter = function ()   -- iterator function
      i = i + 1
      if a[i] == nil then return nil
      else return a[i], t[a[i]]
      end
    end
    return iter
  end

  -- Returns true if is not empty
  local function has_usage_data(dict)
    if (dict.usage == nil or dict.usage == '') then
      return false
    end
    return true
  end

  -- Get commands for that plugin
  local function plugin_help(name,number)
    local plugin = ""
    if number then
      local i = 0
      for name in pairsByKeys(plugins) do
        if plugins[name].hide then
          name = nil
        else
          i = i + 1
          if i == tonumber(number) then
            plugin = plugins[name]
          end
        end
      end
    else
      plugin = plugins[name]
      if not plugin then return 'Dieses Plugin existiert nicht.' end
    end

    local text = ""
    if (type(plugin.usage) == "table") then
      for ku,usage in pairs(plugin.usage) do
        text = text..usage..'\n'
      end
      text = text..'\n'
    elseif has_usage_data(plugin) then -- Is not empty
      text = text..plugin.usage..'\n\n'
    end
    return text
  end


  -- !help command
  local function telegram_help()
    local i = 0
    local text = "Liste aller Plugins\n\n"
    -- Plugins names
    for name in pairsByKeys(plugins) do
      if plugins[name].hide then
        name = nil
      else
        i = i + 1
        text = text..i..'. '..name..'\n'
      end
    end
    text = text..'\n'..i.." Plugins sind zurzeit aktiviert"
    text = text..'\n'..'Benutze "/hilfe [Plugin Nummer]" fuer mehr Informationen'
    text = text..'\n'..'Fragen und/oder Anregungen: @Akamaru'
    return text
    end

    -- !help all command
    local function help_all()
      local ret = ""
      for name in pairsByKeys(plugins) do
        if plugins[name].hide then
          name = nil
        else
          ret = ret .. plugin_help(name)
        end
      end
      return ret
    end

    local function run(msg, matches)
      if matches[1] == "/hilfe" then
        return telegram_help()
      elseif matches[1] == "/hilfe all" then
        return help_all()
      else

        local text = ""
        if tonumber(matches[1])  then
          text = plugin_help(nil,matches[1])
        else
          text = plugin_help(matches[1])
        end
        if not text then
          text = telegram_help()
        end
        return text
      end
    end

    return {
	  description = "Zeigt die Plugins und Befehle", 
	  usage = {"/hilfe","/hilfe all","/hilfe [Plugin]"},
	  patterns = {"^/hilfe$","^/hilfe all","^/hilfe (.+)"}, 
	  run = run 
	}

  end