function run(msg, matches)
  local receiver = get_receiver(msg)
  local URL = matches[1]
  if string.match(msg.text, '"') then
	return 'Vergiss es'
  end
  
  if string.match(msg.text, '[Hh][Ee][Aa][Dd]') then
    text = run_bash('curl --head --insecure ' .. URL)
    send_msg(receiver, text, ok_cb, false)
  elseif string.match(msg.text, '[Dd][Ii][Gg]') then
    text = run_bash('dig ' .. URL .. ' ANY')
    send_msg(receiver, text, ok_cb, false)
  end

end

return {
    description = "Führt Befehle in der Konsole aus", 
    usage = {""},
    patterns = {"^/[Hh][Ee][Aa][Dd] (.*)$","^/[Dd][Ii][Gg] (.*)"},
    run = run
}
--by Akamaru [https://ponywave.de]