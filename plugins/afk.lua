function run(msg, matches)
  local user_name = get_name(msg)
  return "" .. user_name .. " ist nun AFK"
end

return {
    description = "Sagt dass ihr afk seid",
    usage = "/afk",
    patterns = {
	"^/afk(.*)$"
	}, 
    run = run
}
