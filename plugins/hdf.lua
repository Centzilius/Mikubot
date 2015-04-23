function run(msg, matches)
	randomValue = math.random(5)
if randomValue == 1 then
	send_photo(get_receiver(msg), "pictures/hdf/hdf1.jpg", ok_cb, false)
elseif randomValue == 2 then
	send_photo(get_receiver(msg), "pictures/hdf/hdf2.jpg", ok_cb, false)
elseif randomValue == 3 then
	send_photo(get_receiver(msg), "pictures/hdf/hdf3.jpg", ok_cb, false)
elseif randomValue == 4 then
	send_photo(get_receiver(msg), "pictures/hdf/hdf4.jpg", ok_cb, false)
elseif randomValue == 5 then
	send_photo(get_receiver(msg), "pictures/hdf/hdf5.jpg", ok_cb, false)
end
end

return {
  description = "Sendet eins von 4 Katzenbilder", 
  usage = "/hdf",
  patterns = {"^/hdf"}, 
  run = run 
}
--by Akamaru