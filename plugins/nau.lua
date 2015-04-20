function run(msg, matches)
	send_photo(get_receiver(msg), "pictures/nau.jpg", ok_cb, false)
end

return {
  description = "RTL Nau", 
  usage = "/nau",
  patterns = {"^/nau"}, 
  run = run 
}
--by Akamaru