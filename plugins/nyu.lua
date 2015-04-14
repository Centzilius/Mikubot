function run(msg, matches)

	if string.starts(msg.text, 'nyu') or string.starts(msg.text, 'Nyu') then
		send_photo(get_receiver(msg), "pictures/nyu.jpg", ok_cb, false)
    end
	
end

return {
  description = "Nyu?", 
  usage = "nyu",
  patterns = {"^nyu",
			  "^Nyu"}, 
  run = run 
}

