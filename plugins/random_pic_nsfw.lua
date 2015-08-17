do
function get_random_image(dir)
  files = scandir(dir)
  file = files[math.random(#files)]
	return file
end
	 
function run(msg, matches)
  local pics = {
		-- add more below!
		["/nsfw"] = "/home/pi/USB/nsfw/"
		}

  local receiver = get_receiver(msg)
  local imgtype = matches[1]

  if pics[imgtype] then
  local img = pics[imgtype]..get_random_image(pics[imgtype])
	print("Sende... "..img)
  if string.ends(img, ".gif") then
    send_document(receiver, img, function() end, function() end)
  else
    send_photo(receiver, img, function() end, function() end)
  end
  end
end
	 
return {
    description = "Sendet ein zufälliges Bild (NSFW)", 
    usage = {"/nsfw"},
    patterns = {"^/nsfw$"}, 
    run = run 
}
end