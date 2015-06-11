local function run(msg, matches)
	local receiver = get_receiver(msg)
	local url = 'http://thecatapi.com/api/images/get'
		send_photo_from_url(receiver, url)
end

return {
  description = "Sendet ein zufälliges Katzenbild", 
  usage = {"/kitty","/katze","/cat","/neko","/kadse"},
  patterns = {"^/kitty$","^/katze$","^/cat$","^/neko$","^/kadse$"}, 
  run = run 
}
--by Akamaru [https://ponywave.de]