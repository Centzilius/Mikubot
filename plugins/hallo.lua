function run(msg, matches)
  local user_name = get_name(msg)
  local receiver = get_receiver(msg)
	return "Hallo " .. user_name .. "!"
end

return {
    description = "Miku sagt Hallo zu euch",
    usage = {"Hallo","hallo"},
    patterns = {"^Hallo$","^hallo$"},
run = run
}
--by Akamaru [https://ponywave.de]