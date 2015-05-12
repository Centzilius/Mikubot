local usage = "/mine [IP]: Sucht Minecraft-Server und sendet Infos. Standard-Port: 25565, /mine [IP] [Port]: Sucht Minecraft-Server auf Port und sendet Infos."
local ltn12 = require "ltn12"

local function mineSearch(ip, port, receiver) --25565
  local responseText = ""
  local api = "https://api.syfaro.net/server/status"
  local parameters = "?ip="..(URL.escape(ip) or "").."&port="..(URL.escape(port) or "").."&players=true&favicon=true"
  local http = require("socket.http")
  local respbody = {} 
  local body, code, headers, status = http.request{
    url = api..parameters,
    method = "GET",
    redirect = true,
    sink = ltn12.sink.table(respbody)
  }
  local body = table.concat(respbody)
  if (status == nil) then return "FEHLER: status = nil" end
  if code ~=200 then return "FEHLER: "..code..". Status: "..status end
  local jsonData = json:decode(body)
  responseText = responseText..ip..":"..port.." ->\n"
  if (jsonData.motd ~= nil) then
    local tempMotd = ""
    tempMotd = jsonData.motd:gsub('%§.', '')
    if (jsonData.motd ~= nil) then responseText = responseText.." MOTD: "..tempMotd.."\n" end
  end
  if (jsonData.online ~= nil) then
    if jsonData.online == true then
	  server_online = "Ja"
	else
	  server_online = "Nein"
	end
    responseText = responseText.." Online: "..server_online.."\n"
  end
  if (jsonData.players ~= nil) then
    if (jsonData.players.max ~= nil) then
      responseText = responseText.."  Slots: "..jsonData.players.max.."\n"
    end
    if (jsonData.players.now ~= nil) then
      responseText = responseText.."  Spieler online: "..jsonData.players.now.."\n"
    end
    if (jsonData.players.sample ~= nil and jsonData.players.sample ~= false) then
      responseText = responseText.."  Spieler: "..table.concat(jsonData.players.sample, ", ").."\n"
    end
  end
  if (jsonData.favicon ~= nil and false) then
    --send_photo(receiver, jsonData.favicon) --(decode base64 and send)
  end
  return responseText
end

local function parseText(chat, text)
  if (text == nil or text == "/mine") then
    return usage
  end
  ip, port = string.match(text, "^/mine (.-) (.*)$")
  if (ip ~= nil and port ~= nil) then
    return mineSearch(ip, port, chat)
  end
  local ip = string.match(text, "^/mine (.*)$")
  if (ip ~= nil) then
    return mineSearch(ip, "25565", chat)
  end
  return "FEHLER: Keine Input IP?"
end


local function run(msg, matches)
  local chat_id = tostring(msg.to.id)
	local result = parseText(chat_id, msg.text)
	return result
end

return {
  description = "Dursucht Minecraft-Server und sendet Infos",
  usage = usage,
  patterns = {"^/mine (.*)$"},
  run = run
}