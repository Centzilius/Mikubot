do

function run(msg, matches)
 local text = msg.text
 local url = "http://nocf.andibi.tk/dl/chatter-bot-api/cleverbot.php?text="..URL.escape(text)
 local query = http.request(url)
 if query == nil then return 'Ein Fehler ist aufgetreten :(' end
 local decode = json:decode(query)
 local answer = string.gsub(decode.clever, "&Auml;", "�")
 local answer = string.gsub(answer, "&auml;", "�")
 local answer = string.gsub(answer, "&Ouml;", "�")
 local answer = string.gsub(answer, "&ouml;", "�")
 local answer = string.gsub(answer, "&Uuml;", "�")
 local answer = string.gsub(answer, "&uuml;", "�")
 local answer = string.gsub(answer, "&szlig;", "�")
 return answer
end


return {
  description = "Chat mit CleverBot", 
  usage = "/cbot [Text]: Befragt den Cleverbot",
  patterns = {"^/cbot (.*)$"},
 run = run
}

end