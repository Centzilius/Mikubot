function run(msg, matches)

	if string.starts(msg.text, "aha.png") then
	    send_photo(get_receiver(msg), "pictures/aha.png", ok_cb, false)
	end
end

return {
  description = "Aha", 
  usage = "aha.png",
  patterns = {"^aha.png"}, 
  run = run 
}