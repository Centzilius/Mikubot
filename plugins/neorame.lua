function run(msg, matches)
	send_photo(get_receiver(msg), "pictures/neorame.jpg", ok_cb, false)
end

return {
  description = "NeoRame is best pony!", 
  usage = {"/neorame"},
  patterns = {"^/neorame"}, 
  run = run 
}
--by Akamaru