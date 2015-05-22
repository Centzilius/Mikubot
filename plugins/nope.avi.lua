function run(msg, matches)
	send_video(get_receiver(msg), "videos/nope.avi", ok_cb, false)
	return 'Video wird gesendet...'
end

return {
  description = 'Sendet ein Video namens "nope.avi"', 
  usage = {"nope.avi"}, 
  patterns = {"^nope.avi"}, 
  run = run 
}
--by Akamaru [https://ponywave.de]