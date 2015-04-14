function run(msg, matches)

	if string.starts(msg.text, '/kagami') or string.starts(msg.text, "/Kagami") then
		send_photo(get_receiver(msg), "pictures/luckystar/kagami.jpg", ok_cb, false)
	end
	
	if string.starts(msg.text, '/konata') or string.starts(msg.text, "/Konata") then
		send_photo(get_receiver(msg), "pictures/luckystar/konata.jpg", ok_cb, false)
	end
	
	if string.starts(msg.text, '/miyuki') or string.starts(msg.text, "/Miyuki") then
		send_photo(get_receiver(msg), "pictures/luckystar/miyuki.jpg", ok_cb, false)
	end
	
	if string.starts(msg.text, '/tsukasa') or string.starts(msg.text, "/Tsukasa") then
		send_photo(get_receiver(msg), "pictures/luckystar/tsukasa.jpg", ok_cb, false)
	end
end

return {
  description = "Sendet ein Bild von den Lucky Star Chars", 
  usage = "/kagami, /konata, /tsukasa oder /miyuki",
  patterns = {"^/kagami",
			  "^/Kagami",
			  "^/konata",
			  "^/Konata",
			  "^/miyuki",
			  "^/Miyuki",
			  "^/tsukasa",
			  "^/Tsukasa"}, 
  run = run 
}