local function run(msg, matches)
	local receiver = get_receiver(msg)
	local url = 'http://img.pornhub.com/gif/'..matches[1]..'.gif'
	  	print("GIF URL: "..url)
		send_document_from_url(receiver, url)
	  if string.starts(msg.text, '/phg') or string.starts(msg.text, '/porngif') then
		return 'Source: http://www.pornhub.com/gif/'..matches[1]
	  else
	  	return
	  end
end

return {
  description = "Sendet GIFs von Pornhub.com", 
  usage = {"pornhub.com URL","/porngif [ID]","/phg [ID]"},
  patterns = {"pornhub.com/gif/(.*)$","^/phg (.*)$","^/porngif (.*)$"}, 
  run = run 
}
--by Akamaru [https://ponywave.de]