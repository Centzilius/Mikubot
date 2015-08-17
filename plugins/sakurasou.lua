function run(msg, matches)

  if string.match(msg.text, '^/[Ss][Hh][Ii][Ii][Nn][Aa]$') then
	send_photo(get_receiver(msg), "pictures/sakurasou/shiina.jpg", ok_cb, false)
  elseif string.match(msg.text, '^/[Cc][Hh][Ii][Hh][Ii][Rr][Oo]$') then
	send_photo(get_receiver(msg), "pictures/sakurasou/chihiro.jpg", ok_cb, false)
  elseif string.match(msg.text, '^/[Jj][Ii][Nn]$') then
	send_photo(get_receiver(msg), "pictures/sakurasou/jin.jpg", ok_cb, false)
  elseif string.match(msg.text, '^/[Mm][Ii][Ss][Aa][Kk][Ii]$') then
	send_photo(get_receiver(msg), "pictures/sakurasou/misaki.jpg", ok_cb, false)
  elseif string.match(msg.text, '^/[Nn][Aa][Nn][Aa][Mm][Ii]$') then
	send_photo(get_receiver(msg), "pictures/sakurasou/nanami.jpg", ok_cb, false)
  elseif string.match(msg.text, '^/[Rr][Yy][Uu][Uu][Nn][Oo][Ss][Uu][Kk][Ee]$') then
	send_photo(get_receiver(msg), "pictures/sakurasou/ryuunosuke.jpg", ok_cb, false)
  elseif string.match(msg.text, '^/[Ss][Oo][Rr][Aa][Tt][Aa]$') then
	send_photo(get_receiver(msg), "pictures/sakurasou/sorata.jpg", ok_cb, false)
  end

end

return {
  description = "Sendet euch ein Charakter aus Sakurasou no Pet na Kanojo", 
  usage = {"/Shiina","/Chihiro","/Jin","/Misaki","/Nanami","/Ryuunosuke","/Sorata"},
  patterns = {'^/[Ss][Hh][Ii][Ii][Nn][Aa]$',
			  '^/[Cc][Hh][Ii][Hh][Ii][Rr][Oo]$',
			  '^/[Jj][Ii][Nn]$',
			  '^/[Mm][Ii][Ss][Aa][Kk][Ii]$',
			  '^/[Nn][Aa][Nn][Aa][Mm][Ii]$',
			  '^/[Rr][Yy][Uu][Uu][Nn][Oo][Ss][Uu][Kk][Ee]$',
			  '^/[Ss][Oo][Rr][Aa][Tt][Aa]$'
			  },
  run = run 
}
--by Akamaru [https://ponywave.de]