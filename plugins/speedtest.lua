--[[Requires speedtest-cli (https://github.com/sivel/speedtest-cli)
$ wget -O speedtest-cli https://raw.github.com/sivel/speedtest-cli/master/speedtest_cli.py
$ chmod +x speedtest-cli
$ sudo mv speedtest-cli /usr/local/bin/speedtest-cli
]]

function run(msg, matches)
  local receiver = get_receiver(msg)
  if string.match(msg.text, '"') then
  return 'Vergiss es'
  else
  local text = run_bash('speedtest-cli --share')
    send_msg(receiver, text, ok_cb, false)
  end
end

return {
    description = "Führt eine Speedtest aus", 
    usage = {"/speedtest"},
    patterns = {"^/[Ss][Pp][Ee][Ee][Dd][Tt][Ee][Ss][Tt]$"}, 
    run = run
}
--by Akamaru [https://ponywave.de]