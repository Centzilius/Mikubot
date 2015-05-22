function run(msg, matches)
	randomValue = math.random(8)
if randomValue == 1 then
	send_photo(get_receiver(msg), "pictures/wat/wat1.jpg", ok_cb, false)
elseif randomValue == 2 then
	send_photo(get_receiver(msg), "pictures/wat/wat2.jpg", ok_cb, false)
elseif randomValue == 3 then
	send_photo(get_receiver(msg), "pictures/wat/wat3.jpg", ok_cb, false)
elseif randomValue == 4 then
	send_photo(get_receiver(msg), "pictures/wat/wat4.jpg", ok_cb, false)
elseif randomValue == 5 then
	send_photo(get_receiver(msg), "pictures/wat/wat5.jpg", ok_cb, false)
elseif randomValue == 6 then
	send_photo(get_receiver(msg), "pictures/wat/wat6.jpg", ok_cb, false)
elseif randomValue == 7 then
	send_photo(get_receiver(msg), "pictures/wat/wat7.jpg", ok_cb, false)
elseif randomValue == 8 then
	send_photo(get_receiver(msg), "pictures/wat/wat8.jpg", ok_cb, false)
end
end

return {
  description = "Sendet eins von 6 WAT Bilder", 
  usage = {"/wat","/Wat","/WAT"},
  patterns = {"^/wat$","^/Wat$","^/WAT$"}, 
  run = run 
}
--by Akamaru [https://ponywave.de]