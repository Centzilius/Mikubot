function run(msg, matches)
	send_photo(get_receiver(msg), "pictures/nyu.jpg", ok_cb, false)
end

return {
  description = "Nyu?", 
  usage = {"nyu"},
  patterns = {"^[N|n][Y|y][U|u]$"}, 
  run = run 
}
--by Akamaru [https://ponywave.de]