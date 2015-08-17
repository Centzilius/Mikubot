function run(msg, matches)

	if string.match(msg.text, '^/[Aa][Ss][Uu][Kk][Aa]$') then
		send_photo(get_receiver(msg), "pictures/senrankagura/hanzouacademy/asuka.jpg", ok_cb, false)
	elseif string.match(msg.text, '^/[Hh][Ii][Bb][Aa][Rr][Ii]$') then
		send_photo(get_receiver(msg), "pictures/senrankagura/hanzouacademy/hibari.jpg", ok_cb, false)
	elseif string.match(msg.text, '^/[Ii][Kk][Aa][Gg][Uu][Rr][Aa]$') then
		send_photo(get_receiver(msg), "pictures/senrankagura/hanzouacademy/ikaruga.jpg", ok_cb, false)
	elseif string.match(msg.text, '^/[Kk][Aa][Tt][Ss][Uu][Rr][Aa][Gg][Ii]$') then
		send_photo(get_receiver(msg), "pictures/senrankagura/hanzouacademy/katsuragi.jpg", ok_cb, false)
	--elseif string.match(msg.text, '^/[Yy][Aa][Gg][Yy][Uu][Uu]$') then
		--send_photo(get_receiver(msg), "pictures/senrankagura/hanzouacademy/yagyuu.jpg", ok_cb, false)
	elseif string.match(msg.text, '^/[Hh][Aa][Rr][Uu][Gg][Aa]$') then
		send_photo(get_receiver(msg), "pictures/senrankagura/hebijoacademy/haruka.jpg", ok_cb, false)
	elseif string.match(msg.text, '^/[Hh][Ii][Kk][Aa][Gg][Ee]$') then
		send_photo(get_receiver(msg), "pictures/senrankagura/hebijoacademy/hikage.jpg", ok_cb, false)
	elseif string.match(msg.text, '^/[Hh][Oo][Mm][Uu][Rr][Aa]$') then
		send_photo(get_receiver(msg), "pictures/senrankagura/hebijoacademy/homura.jpg", ok_cb, false)
	elseif string.match(msg.text, '^/[Mm][Ii][Rr][Aa][Ii]$') then
		send_photo(get_receiver(msg), "pictures/senrankagura/hebijoacademy/mirai.jpg", ok_cb, false)
	elseif string.match(msg.text, '^/[Yy][Oo][Mm][Ii]$') then
		send_photo(get_receiver(msg), "pictures/senrankagura/hebijoacademy/yomi.jpg", ok_cb, false)
	end
end

return {
  description = "Sendet euch ein Senran Kagura Charakter", 
  usage = {"/asuka","/hibari","/ikaruga","/katsuragi","/haruka","/hikage","/homura","/mirai","/yomi"},
  patterns = {'^/[Aa][Ss][Uu][Kk][Aa]$',
			  '^/[Hh][Ii][Bb][Aa][Rr][Ii]$',
			  '^/[Ii][Kk][Aa][Gg][Uu][Rr][Aa]$',
			  '^/[Kk][Aa][Tt][Ss][Uu][Rr][Aa][Gg][Ii]$',
			  --'^/[Yy][Aa][Gg][Yy][Uu][Uu]$',
			  '^/[Hh][Aa][Rr][Uu][Gg][Aa]$',
			  '^/[Hh][Ii][Kk][Aa][Gg][Ee]$',
			  '^/[Hh][Oo][Mm][Uu][Rr][Aa]$',
			  '^/[Mm][Ii][Rr][Aa][Ii]$',
			  '^/[Yy][Oo][Mm][Ii]$'
			  }, 
  run = run 
}
--by Akamaru [https://ponywave.de]