local function run(msg, matches)
	local receiver = get_receiver(msg)
	local url = 'http://i.gifeye.com/'..matches[1]..'.gif'
		print("GIF URL: "..url)
		send_document_from_url(receiver, url)
		return 'Source: http://gifeye.com/'..matches[1]
end

return {
  description = "Sendet GIFs von Gifeye.com", 
  usage = {"gifeye.com URL","/gifeye [ID]","/ge [ID]"},
  patterns = {"https?://gifeye.com/([%w-_%.%?%.:,/%+=&#!]+)$","^/gifeye (.*)$","^/ge (.*)$"}, 
  run = run 
}
--by Akamaru [https://ponywave.de]