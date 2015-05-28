local function run(msg, matches)
  local user_name = get_name(msg)
  if msg.to.type == 'chat' then  
	local text = matches[1]
    local b = 1
	
    while b ~= 0 do
      text,b = text:gsub('^/+','')
      text = text:trim()
    end
	
    send_msg('chat#id' .. msg.to.id, 'Hey '..user_name..', ich hab dir gerade deine Nachricht gesendet!', ok_cb, false)
	send_msg('user#id' .. msg.from.id, text, ok_cb, false)
  else
    return "Das Plugin solltest du nur in Gruppen nutzen."
  end
  
  

end

return {
  description = "Sendet eine Nachricht an dich selbst", 
  usage = {"/note [Nachricht]"},
  patterns = {"^/note (.*)$","^/notiz (.*)$"}, 
  run = run 
}