function run(msg, matches)
  local text = matches[1]
  local user_name = get_name(msg)
  return user_name .. ' ' .. text
end

return {
    description = "", 
    usage = {""},
    patterns = {"^/me (.*)$"}, 
    run = run 
}
--by Akamaru [https://ponywave.de]