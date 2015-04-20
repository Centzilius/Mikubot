function run(msg, matches)
	send_photo(get_receiver(msg), "pictures/Nii-san.jpg", ok_cb, false)
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
--by Akamaru