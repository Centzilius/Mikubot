function run(msg, matches)

	if string.starts(msg.text, '/kitty') then
	randomValue = math.random(4)
	if randomValue == 1 then
	send_photo(get_receiver(msg), "pictures/cats/cat1.jpg", ok_cb, false)
	elseif randomValue == 2 then
	send_photo(get_receiver(msg), "pictures/cats/cat2.jpg", ok_cb, false)
	elseif randomValue == 3 then
	send_photo(get_receiver(msg), "pictures/cats/cat3.jpg", ok_cb, false)
	elseif randomValue == 4 then
	send_photo(get_receiver(msg), "pictures/cats/cat4.jpg", ok_cb, false)
	end
    end
end

return {
  description = "Sendet eins von 4 Katzenbilder", 
  usage = "/kitty",
  patterns = {"^/kitty"}, 
  run = run 
}