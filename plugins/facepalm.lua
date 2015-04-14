function run(msg, matches)
	    send_document(get_receiver(msg), "sticker/facepalm.webp", ok_cb, false)
end

return {
  description = "Facepalm", 
  usage = "/facepalm",
  patterns = {"^/facepalm",
			  "^/Facepalm"}, 
  run = run 
}