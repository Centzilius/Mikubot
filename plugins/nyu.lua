function run(msg, matches)
	send_photo(get_receiver(msg), "pictures/nyu.jpg", ok_cb, false)
end

return {
  description = "Nyu?", 
  usage = {"nyu","Nyu"},
  patterns = {"^nyu","^Nyu"}, 
  run = run 
}
--by Akamaru [https://ponywave.de]