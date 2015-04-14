function run(msg, matches)

	if string.starts(msg.text, "/neorame") then
	    send_photo(get_receiver(msg), "pictures/neorame.jpg", ok_cb, false)
	end
end

return {
  description = "NeoRame is best pony!", 
  usage = "/neorame",
  patterns = {"^/neorame"}, 
  run = run 
}