function run(msg, matches)

	if string.starts(msg.text, 'nii-san') or string.starts(msg.text, 'Nii-san') or string.starts(msg.text, 'Nissan') or string.starts(msg.text, 'nissan') then
		send_photo(get_receiver(msg), "pictures/Nii-san.jpg", ok_cb, false)
    end
	
end

return {
  description = "Nii-san <3", 
  usage = "nii-san, Nii-san, nissan oder Nissan",
  patterns = {"^nii-san",
			  "^Nii-san",
			  "^nissan",
			  "^Nissan"}, 
  run = run 
}

