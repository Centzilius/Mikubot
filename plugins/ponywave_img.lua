do

local function get_ponywave(part)
  local url = 'http://img.ponywave.de/'..part..'.html'
  local res,code = http.request(url)
  if code ~= 200 then return "Fehler beim Abrufen von img.ponywave.de" end
  local url = string.match(res, "id=\"codedirect\" value%=\"(.-)\" onclick")
  return url
end

local function run(msg, matches)
  local receiver = get_receiver(msg)
  local part = matches[1]
  local url = get_ponywave(part)
  if string.ends(url, ".gif") then
    send_document_from_url(receiver, url)
  else
    send_photo_from_url(receiver, url)
  end
end

return {
    description = "Mirrored Bild bei Link auf Preview-Seite von img.ponywave.de", 
    usage = "Preview-Link von img.ponywave.de",
    patterns = {
      "https?://img.ponywave.de/(.*).html"
    }, 
    run = run 
}

end