do

local _blacklist

local function getNSFWImage(text)
  local text = URL.escape(text)
  local api = "https://ajax.googleapis.com/ajax/services/search/images?v=1.0&rsz=8&q="
  local res, code = http.request(api..text)
  if code ~= 200 then return nil end
  local google = json:decode(res)

  if google.responseStatus ~= 200 then
    return nil
  end

  local data = google.responseData
  
  if not data or not data.results then
    return nil
  end

  if #data.results == 0 then
    return nil
  end

  return data.results
end

local function is_blacklisted(msg)
  local var = false
  for v,word in pairs(_blacklist) do
    if string.find(string.lower(msg), string.lower(word)) then
      print("Wort steht auf der Blacklist!")
      var = true
      break
    end
  end
  return var
end

local function show_blacklist()
  if not _blacklist[1] then
    return "Keine Wörter geblacklisted!\nBlackliste welche mit /imgblacklist add [Wort]"
  else
    local sort_alph = function( a,b ) return a < b end
    table.sort( _blacklist, sort_alph )
    local blacklist = "Folgende Wörter stehen auf der Blacklist:\n"
    for v,word in pairs(_blacklist) do
      blacklist = blacklist..'- '..word..'\n'
    end
	return blacklist
  end
end

local function add_blacklist()
  print('Blacklisting '..word..' - saving to redis set telegram:img_blacklist')
  if redis:sismember("telegram:img_blacklist", word) == true then
    return '"'..word..'" steht schon auf der Blacklist.'
  else
    redis:sadd("telegram:img_blacklist", word)
    return '"'..word..'" blacklisted!'
  end
end

local function remove_blacklist()
  print('De-blacklisting '..word..' - removing from redis set telegram:img_blacklist')
  if redis:sismember("telegram:img_blacklist", word) == true then
    redis:srem("telegram:img_blacklist", word)
    return '"'..word..'" erfolgreich von der Blacklist gelöscht!'
  else
    return '"'..word..'" steht nicht auf der Blacklist.'
  end
end

local function run(msg, matches)
  local receiver = get_receiver(msg)
  local text = matches[1]
  if matches[2] then word = string.lower(matches[2]) end
  
  _blacklist = redis:smembers("telegram:img_blacklist")
  
  if text == "/imgblacklist show" then
    if is_sudo(msg) then
      return show_blacklist()
	else
	  return "Du bist kein Superuser. Dieser Vorfall wird gemeldet!"
	end
  end
  
  if text == "/imgblacklist add" and word == nil then
    return "Benutzung: /imgblacklist add [Wort]"
  elseif text == "/imgblacklist add" and word then
    if is_sudo(msg) then
      return add_blacklist()
	else
	  return "Du bist kein Superuser. Dieser Vorfall wird gemeldet!"
	end
  end
  
  if text == "/imgblacklist del" and word == nil then
    return "Benutzung: /imgblacklist del [Wort]"
  elseif text == "/imgblacklist del" and word then
    if is_sudo(msg) then
      return remove_blacklist()
	else
	  return "Du bist kein Superuser. Dieser Vorfall wird gemeldet!"
	end
  end
  
  print ('Checking if search contains blacklisted words: '..text)
  if is_blacklisted(text) then
    return "Vergiss es ._."
  end
  
  local results = getNSFWImage(text)
  if not results then
    return "Kein Bild gefunden!"
  end
  
  -- Random image from table
  local i = math.random(#results)
  local url = nil;
  
  local failed = true
  local nofTries = 0
  while failed and nofTries < #results do  
	  url = results[i].url;
	  print("Bilder-URL: ", url)
	  
	  if string.ends(url, ".gif") then
		failed = not send_document_from_url(receiver, url, nil, nil, true)
	  elseif string.ends(url, ".jpg") or string.ends(url, ".jpeg") or string.ends(url, ".png") then
		failed = not send_photo_from_url(receiver, url, nil, nil, true)
	  end
	  
	  nofTries = nofTries + 1
	  i = i+1
	  if i > #results then
		i = 1
	  end 
  end
  
  if failed then
	  return "Fehler beim Herunterladen eines Bildes."
  else
	  return "Source: "..url
  end
end

return {
    description = "Sucht Bild mit Google-API und versendet es [NSFW]", 
    usage = {"/img2 [Suchbegriff]","/nsfwimg [Suchbegriff]"},
    patterns = {"^/img2 (.*)$",
				"^/nsfwimg (.*)$"--[[,
				"^(/imgblacklist show)$",
				"^(/imgblacklist add) (.*)$",
				"^(/imgblacklist del) (.*)$"]]
				}, 
    run = run 
}
end