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
    text = string.gsub(text, "temp=", " ")
    return "Die CPU Temperatur beträgt" ..text
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
  
  if string.starts(msg.text, '/screen') then
    text = run_bash("scrot 'scrot.png' -e 'mv $f ~/Mikubot/tmp/'")
	send_photo(get_receiver(msg), "tmp/scrot.png", ok_cb, false)
    return 'Screenshot wird gesendet!'
  end
  
  if string.starts(msg.text, '/update') then
    text = run_bash("sudo apt-get update")
    print(text)
    return 'Update durchgeführt!'
  end
  
  if string.starts(msg.text, '/upgrade') then
    text = run_bash("sudo apt-get upgrade -y")
    print(text)
    return 'Upgrade durchgeführt!'
  end

end

return {
    description = "Führt Befehle in der Konsole aus", 
    usage = {"/sh kann nur Akamaru"},
    patterns = {"^/uptime$","^/sh (.*)$","^/temp$","^/volt$","^/takt$","^/screen$","^/update$","^/upgrade$"}, 
    run = run,
    privileged = true
}
