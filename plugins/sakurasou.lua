function run(msg, matches)

	if string.starts(msg.text, '/shiina') or string.starts(msg.text, "/Shiina") then
	send_photo(get_receiver(msg), "pictures/sakurasou/shiina.jpg", ok_cb, false)
	end

    	if string.starts(msg.text, '/chihiro') or string.starts(msg.text, "/Chihiro") then
	send_photo(get_receiver(msg), "pictures/sakurasou/chihiro.jpg", ok_cb, false)
	end

    	if string.starts(msg.text, '/jin') or string.starts(msg.text, "/Jin") then
	send_photo(get_receiver(msg), "pictures/sakurasou/jin.jpg", ok_cb, false)
	end

    	if string.starts(msg.text, '/misaki') or string.starts(msg.text, "/Misaki") then
	send_photo(get_receiver(msg), "pictures/sakurasou/misaki.jpg", ok_cb, false)
	end

    	if string.starts(msg.text, '/nanami') or string.starts(msg.text, "/Nanami") then
	send_photo(get_receiver(msg), "pictures/sakurasou/nanami.jpg", ok_cb, false)
	end

    	if string.starts(msg.text, '/ryuunosuke') or string.starts(msg.text, "/Ryuunosuke") then
	send_photo(get_receiver(msg), "pictures/sakurasou/ryuunosuke.jpg", ok_cb, false)
	end

    	if string.starts(msg.text, '/sorata') or string.starts(msg.text, "/Sorata") then
	send_photo(get_receiver(msg), "pictures/sakurasou/sorata.jpg", ok_cb, false)
	end
end

return {
  description = "Sendet euch ein Charakter aus Sakurasou no Pet na Kanojo", 
  usage = {"/shiina","/Shiina","/chihiro","/Chihiro","/jin","/Jin","/misaki","/Misaki","/nanami","/Nanami","/ryuunosuke","/Ryuunosuke","/sorata","/Sorata"},
  patterns = {"^/shiina","^/Shiina","^/chihiro","^/Chihiro","^/jin","^/Jin","^/misaki","^/Misaki","^/nanami","^/Nanami","^/ryuunosuke","^/Ryuunosuke","^/sorata","^/Sorata"}, 
  run = run 
}
--by Akamaru