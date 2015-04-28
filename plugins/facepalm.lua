function run(msg, matches)
	    send_document(get_receiver(msg), "sticker/facepalm.webp", ok_cb, false)
end

return {
  description = "Sendet ein Facepalm-Sticker", 
  usage = {"/facepalm","/Facepalm"},
  patterns = {"^/facepalm","^/Facepalm"}, 
  run = run 
}
--by Akamaru