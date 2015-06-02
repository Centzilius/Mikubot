function run(msg, matches)
	if matches[1] == "nairaderp" then
		send_document(get_receiver(msg), "sticker/naira_derp.webp", ok_cb, false)
	elseif matches[1] == "facepalm" then
		send_document(get_receiver(msg), "sticker/facepalm.webp", ok_cb, false)
	elseif matches[1] == "all" then
		return [[
		/sticker nairaderp
		/sticker facepalm
		]]
	end
end

return {
    description = "Sendet Custom Sticker", 
    usage = {"/sticker [Stickername]"},
    patterns = {"^/[S|s]ticker (.*)$"}, 
    run = run 
}
--by Akamaru [https://ponywave.de]