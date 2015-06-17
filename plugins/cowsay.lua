function run(msg, matches)
  cow = matches[1]
  local receiver = get_receiver(msg)
  if string.match(msg.text, '"') then
  return 'Vergiss es'
  else
  local text = run_bash('cowsay "' .. cow .. '"')
    send_msg(receiver, text, ok_cb, false)
  end
end

return {
    description = "", 
    usage = {""},
    patterns = {"^/cowsay (.*)$"}, 
    run = run
}
--by Akamaru [https://ponywave.de]