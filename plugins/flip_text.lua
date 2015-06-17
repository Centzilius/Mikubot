-- Requires: (sudo) npm install -g flip-text
function run(msg, matches)
  text = matches[1]
  local receiver = get_receiver(msg)
  if string.match(msg.text, '"') then
  return 'Vergiss es'
  else
  local text = run_bash('flip "' .. text .. '"')
    send_msg(receiver, text, ok_cb, false)
  end
end

return {
    description = "", 
    usage = {""},
    patterns = {"^/flip (.*)$"}, 
    run = run
}
--by Akamaru [https://ponywave.de]