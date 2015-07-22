do

function run(msg, matches)
  local url = matches[1]
  local receiver = get_receiver(msg)
  local url = string.gsub(url, "https://img.centzilius.de", "http://img.centzilius.de")
  send_photo_from_url(receiver, url)
end

return {
  description = "Wenn ein Link zu einem Bild gesendet wird, läd und sendet der Bot das Bild.", 
  usage = {"Link zum Bild"},
  patterns = {"(https?://[%w-_%.%?%.:/%+=&]+%.png)$","(https?://[%w-_%.%?%.:/%+=&]+%.jpg)$","(https?://[%w-_%.%?%.:/%+=&]+%.jpeg)$",}, 
  run = run 
}

end
