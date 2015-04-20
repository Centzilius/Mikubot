function run(msg, matches)
send_photo(get_receiver(msg), "pictures/aha.png", ok_cb, false)
end

return {
  description = "Aha", 
  usage = "aha.png",
  patterns = {"^aha.png"}, 
  run = run 
}
--by Akamaru