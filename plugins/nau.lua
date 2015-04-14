function run(msg, matches)

	if string.starts(msg.text, "/nau") then
	    send_photo(get_receiver(msg), "pictures/nau.jpg", ok_cb, false)
	end
end

return {
  description = "RTL Nau", 
  usage = "/nau",
  patterns = {"^/nau"}, 
  run = run 
}