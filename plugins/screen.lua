function run_sh(msg)
     name = get_name(msg)
     text = ''
	 bash = msg.text:sub(4,-1)
     text = run_bash(bash)
     return text
end

function run_bash(str)
    local cmd = io.popen(str)
    local result = cmd:read('*all')
    cmd:close()
    return result
end

function run(msg, matches)
  local receiver = get_receiver(msg)
  if string.starts(msg.text, '/screen') then
    text = run_bash("scrot 'scrot.png' -e 'mv $f ~/Mikubot/tmp/'")
	send_photo(get_receiver(msg), "tmp/scrot.png", ok_cb, false)
    return 'Screenshot wird gesendet!'
  end
end

return {
    description = "Macht ein Screenshot vom PC auf dem der Bot läuft", 
    usage = {"/screen"},
    patterns = {"^/screen$"}, 
    run = run,
    privileged = true
}
--by Akamaru [https://ponywave.de]