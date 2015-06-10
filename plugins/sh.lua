function run_sh(msg)
     name = get_name(msg)
     text = ''
	 bash = msg.text:sub(4,-1)
     text = run_bash(bash)
     return text
end

function run(msg, matches)
  local receiver = get_receiver(msg)
  if string.starts(msg.text, '/sh') then
    text = run_sh(msg)
    send_msg(receiver, text, ok_cb, false)
    return
  end

  if string.starts(msg.text, '/uptime') then
    text = run_bash('uptime')
    send_msg(receiver, text, ok_cb, false)
    return
  end

  if string.starts(msg.text, '/temp') then
    text = run_bash('vcgencmd measure_temp')
    send_msg(receiver, text, ok_cb, false)
    return
  end

  if string.starts(msg.text, '/volt') then
    text = run_bash('vcgencmd measure_volts')
    send_msg(receiver, text, ok_cb, false)
    return
  end

  if string.starts(msg.text, '/takt') then
    text = run_bash('vcgencmd measure_clock arm')
    send_msg(receiver, text, ok_cb, false)
    return
  end

end

return {
    description = "Führt Befehle in der Konsole aus", 
    usage = {"/sh kann nur Akamaru"},
    patterns = {"^/uptime", "^/sh (.*)$","^/temp$","^/volt$","^/takt$"}, 
    run = run,
    privileged = true
}
