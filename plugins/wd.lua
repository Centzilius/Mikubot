function run(msg, matches)
  local user_name = get_name(msg)
  return user_name .. " ist wieder da"
end

return {
    description = "Sagt dass ihr wieder da seid",
    usage = {"/wd"},
    patterns = {"^/wd$"}, 
    run = run
}
--by Akamaru