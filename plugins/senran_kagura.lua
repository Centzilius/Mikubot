function run(msg, matches)

	if string.starts(msg.text, '/asuka') or string.starts(msg.text, "/Asuka") then
		send_photo(get_receiver(msg), "pictures/senrankagura/hanzouacademy/asuka.jpg", ok_cb, false)
	end

    	if string.starts(msg.text, '/hibari') or string.starts(msg.text, "/Hibari") then
		send_photo(get_receiver(msg), "pictures/senrankagura/hanzouacademy/hibari.jpg", ok_cb, false)
	end

    	if string.starts(msg.text, '/ikaruga') or string.starts(msg.text, "/Ikaruga") then
	send_photo(get_receiver(msg), "pictures/senrankagura/hanzouacademy/ikaruga.jpg", ok_cb, false)
	end

    	if string.starts(msg.text, '/katsuragi') or string.starts(msg.text, "/Katsuragi") then
	send_photo(get_receiver(msg), "pictures/senrankagura/hanzouacademy/katsuragi.jpg", ok_cb, false)
	end

    	if string.starts(msg.text, '/yagyuu') or string.starts(msg.text, "/Yagyuu") then
	send_photo(get_receiver(msg), "pictures/senrankagura/hanzouacademy/yagyuu.jpg", ok_cb, false)
	end

    	if string.starts(msg.text, '/haruka') or string.starts(msg.text, "/Haruka") then
	send_photo(get_receiver(msg), "pictures/senrankagura/hebijoacademy/haruka.jpg", ok_cb, false)
	end

    	if string.starts(msg.text, '/hikage') or string.starts(msg.text, "/Hikage") then
	send_photo(get_receiver(msg), "pictures/senrankagura/hebijoacademy/hikage.jpg", ok_cb, false)
	end

    	if string.starts(msg.text, '/homura') or string.starts(msg.text, "/Homura") then
	send_photo(get_receiver(msg), "pictures/senrankagura/hebijoacademy/homura.jpg", ok_cb, false)
	end

    	if string.starts(msg.text, '/mirai') or string.starts(msg.text, "/Mirai") then
	send_photo(get_receiver(msg), "pictures/senrankagura/hebijoacademy/mirai.jpg", ok_cb, false)
	end

    	if string.starts(msg.text, '/yomi') or string.starts(msg.text, "/Yomi") then
		send_photo(get_receiver(msg), "pictures/senrankagura/hebijoacademy/yomi.jpg", ok_cb, false)
	end
end

return {
  description = "", 
  usage = "",
  patterns = {"^/asuka",
			  "^/Asuka",
			  "^/hibari",
			  "^/Hibari",
			  "^/ikaruga",
			  "^/Ikaruga",
			  "^/katsuragi",
			  "^/Katsuragi",
			  "^/yagyuu",
			  "^/Yagyuu",
			  "^/haruka",
			  "^/Haruka",
			  "^/hikage",
			  "^/Hikage",
			  "^/homura",
			  "^/Homura",
			  "^/mirai",
			  "^/Mirai",
			  "^/yomi",
			  "^/Yomi"}, 
  run = run 
}
--by Akamaru