function run(msg, matches)
	randomValue = math.random(5)
if randomValue == 1 then
	send_photo(get_receiver(msg), "pictures/hdf/hdf1.jpg", ok_cb, false)
	-- Source https://www.facebook.com/391509267542910/photos/a.391509814209522.110655.391509267542910/391509824209521/?type=1&theater
elseif randomValue == 2 then
	send_photo(get_receiver(msg), "pictures/hdf/hdf2.jpg", ok_cb, false)
	-- Source http://echtlustig.com/312/einfach-mal-die-kresse-halten
elseif randomValue == 3 then
	send_photo(get_receiver(msg), "pictures/hdf/hdf3.jpg", ok_cb, false)
	-- Source http://blog.todamax.net/2012/lieber-unbekannter-spon-kommentator/
elseif randomValue == 4 then
	send_photo(get_receiver(msg), "pictures/hdf/hdf4.jpg", ok_cb, false)
	-- Source http://www.ariva.de/forum/Inside-Gigaset-AG-ehem-ARQUES-AG-424727?page=94#jumppos2373
elseif randomValue == 5 then
	send_photo(get_receiver(msg), "pictures/hdf/hdf5.jpg", ok_cb, false)
	-- Source http://www.lachschon.de/item/114904-Einfachmal/
end
end

return {
  description = "Sendet eins von 4 Katzenbilder", 
  usage = "/hdf",
  patterns = {"^/hdf"}, 
  run = run 
}
--by Akamaru