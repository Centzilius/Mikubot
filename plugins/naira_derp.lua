function run(msg, matches)
	    send_document(get_receiver(msg), "sticker/naira_derp.webp", ok_cb, false)
end

return {
  description = "Naira Derp", 
  usage = "/nairad",
  patterns = {"^/nairad",
			  "^/Nairad"}, 
  run = run 
}