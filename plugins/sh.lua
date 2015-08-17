function run(msg, matches)
  local receiver = get_receiver(msg)
  
  if string.match(msg.text, '^/[Ss][Hh]') then
    text = run_sh(msg)
    send_msg(receiver, text, ok_cb, false)
    return
  end

  if string.match(msg.text, '^/[Uu][Pp][Tt][Ii][Mm][Ee]$') then
    text = run_bash('uptime')
    send_msg(receiver, text, ok_cb, false)
    return
  end
  
  -- Requires scrot (sudo apt-get install scrot)
  if string.match(msg.text, '^/[Ss][Cc][Rr][Ee][Ee][Nn]$') then
    text = run_bash("scrot 'scrot.png' -e 'mv $f ~/Mikubot/tmp/'")
	send_photo(get_receiver(msg), "tmp/scrot.png", ok_cb, false)
    return 'Screenshot wird gesendet!'
  end
  
  -- You need to disable sudo password
  if string.match(msg.text, '^/[Uu][Pp][Dd][Aa][Tt][Ee]$') then
    text = run_bash("sudo apt-get update")
    print(text)
    return 'Update durchgeführt!'
  end
  
  if string.match(msg.text, '^/[Uu][Pp][Gg][Rr][Aa][Dd][Ee]$') then
    text = run_bash("sudo apt-get upgrade -y")
    print(text)
    return 'Upgrade durchgeführt!'
  end

  -- vcgencmd works only on Raspberry Pi
  if string.match(msg.text, '^/[Tt][Ee][Mm][Pp]$') then
    text = run_bash('vcgencmd measure_temp')
    text = string.gsub(text, "temp=", " ")
    return "Die CPU Temperatur beträgt" ..text
  end

  if string.match(msg.text, '^/[Vv][Oo][Ll][Tt]$') then
    text = run_bash('vcgencmd measure_volts')
    send_msg(receiver, text, ok_cb, false)
    return
  end

  if string.match(msg.text, '^/[Tt][Aa][Kk][Tt]$') then
    text = run_bash('vcgencmd measure_clock arm')
    send_msg(receiver, text, ok_cb, false)
    return
  end

end

return {
    description = "Führt Befehle in der Konsole aus", 
    usage = {"/sh [Befehl]","/uptime","/temp","/volt","/takt","/screen","/update","/upgrade"},
    patterns = {"^/[Ss][Hh] (.*)$",
				"^/[Uu][Pp][Tt][Ii][Mm][Ee]$",
    			"^/[Ss][Cc][Rr][Ee][Ee][Nn]$",
    			"^/[Uu][Pp][Dd][Aa][Tt][Ee]$",
    			"^/[Uu][Pp][Gg][Rr][Aa][Dd][Ee]$",
    			"^/[Tt][Ee][Mm][Pp]$",
    			"^/[Vv][Oo][Ll][Tt]$",
    			"^/[Tt][Aa][Kk][Tt]$"
    			},
    run = run,
    privileged = true
}
