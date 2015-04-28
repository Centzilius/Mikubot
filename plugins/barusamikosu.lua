function run(msg, matches)
	send_photo(get_receiver(msg), "pictures/luckystar/barusamikosu.jpg", ok_cb, false)
end

return {
  description = "Balsamiko Essig!", 
  usage = {"/barusamiko","/barusamikosu","/Balsamiko Essig"}, 
  patterns = {"^/barusamiko","^/barusamikosu","^/Balsamiko Essig"}, 
  run = run 
}
--by Akamaru