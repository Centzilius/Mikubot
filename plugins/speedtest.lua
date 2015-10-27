--[[Requires speedtest-cli (https://github.com/sivel/speedtest-cli)
$ wget -O speedtest-cli https://raw.github.com/sivel/speedtest-cli/master/speedtest_cli.py
$ chmod +x speedtest-cli
$ sudo mv speedtest-cli /usr/local/bin/speedtest-cli
]]

function run(msg, matches)
  local receiver = get_receiver(msg)
  local text = run_bash('speedtest-cli --share')
  local photo = string.match(text,"Share results: (.*)")
  send_photo_from_url(receiver, photo)
end

return {
    description = "Führt eine Speedtest aus", 
    usage = {"/speedtest"},
    patterns = {"^/[Ss][Pp][Ee][Ee][Dd][Tt][Ee][Ss][Tt]$"}, 
    run = run
}
--by Akamaru [https://ponywave.de]