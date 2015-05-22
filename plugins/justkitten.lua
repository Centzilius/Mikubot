function run(msg, matches)
	randomValue = math.random(6)
if randomValue == 1 then
	send_photo(get_receiver(msg), "pictures/justkitten/justkitten1.jpg", ok_cb, false)
elseif randomValue == 2 then
	send_photo(get_receiver(msg), "pictures/justkitten/justkitten2.jpg", ok_cb, false)
elseif randomValue == 3 then
	send_photo(get_receiver(msg), "pictures/justkitten/justkitten3.jpg", ok_cb, false)
elseif randomValue == 4 then
	send_photo(get_receiver(msg), "pictures/justkitten/justkitten4.jpg", ok_cb, false)
elseif randomValue == 5 then
	send_photo(get_receiver(msg), "pictures/justkitten/justkitten5.jpg", ok_cb, false)
elseif randomValue == 6 then
	send_photo(get_receiver(msg), "pictures/justkitten/justkitten6.jpg", ok_cb, false)
end
end

return {
  description = "Sendet eins von 6 Just Kitten Bilder", 
  usage = {"/jk"},
  patterns = {"^/jk"}, 
  run = run 
}
--by Akamaru [https://ponywave.de]