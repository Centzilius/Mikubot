function run(msg, matches)
  local user_name = get_name(msg)
		local receiver = get_receiver(msg)
  return "Hallo " .. user_name .. "!"
end

return {
    description = "Sagt hallo zu euch",
    usage = "hallo",
    patterns = {
	"^Hallo(.*)$",
	"^hallo(.*)$"
	}, 
    run = run
}
