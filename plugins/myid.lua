function run(msg, matches)
  return tostring(msg.from.id) .. ' ' .. tostring(is_sudo(msg))
end

return {
  description = 'Zeigt deine Telegram ID',
  usage = {"/myid"},
  patterns = {'^/myid$'},
  run = run
}
