local function run(msg, matches)
	local receiver = get_receiver(msg)
	local url = matches[1]
	if string.match(msg.text, "[Gg][Ee][Tt][Dd][Aa][Tt][Aa]") or string.match(msg.text, "[Ww][Gg][Ee][Tt]") then
		send_document_from_url(receiver, url)
	elseif string.match(msg.text, "[Gg][Ee][Tt][Ii][Mm][Gg]") then
		send_photo_from_url(receiver, url)
	end
end

return {
  description = "Ein plugin, um Bilder oder Dateien zu downloaden", 
  usage = {"/getdata [URL]",
		   "/getimg [URL]"},
  patterns = {"^/getdata (.*)$",
			  "/[Ww][Gg][Ee][Tt]",
			  "^/getimg (.*)$"
			  }, 
  run = run 
}
--by Akamaru [https://ponywave.de]