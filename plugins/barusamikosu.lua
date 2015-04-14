function run(msg, matches)

	if string.starts(msg.text, '/barusamiko') or string.starts(msg.text, "/barusamikosu") or string.starts(msg.text, "/Balsamiko Essig") then
		send_photo(get_receiver(msg), "pictures/luckystar/barusamikosu.jpg", ok_cb, false)
	end
end

return {
  description = "Balsamiko Essig!", 
  usage = "/barusamiko",
  patterns = {"^/barusamiko",
			  "^/barusamikosu",
			  "^/Balsamiko Essig"}, 
  run = run 
}