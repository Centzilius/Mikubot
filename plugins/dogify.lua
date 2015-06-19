local function run(msg, matches)
   local base = "http://dogr.io/"
   local path = string.gsub(matches[1], " ", "%%20")
   local url = base .. path .. '.png?split=false&.png'
   local urlm = "https?://[%%%w-_%.%?%.:/%+=&]+"

   if string.match(url, urlm) == url then
      local receiver = get_receiver(msg)
      send_photo_from_url(receiver, url)
   else
      return 'Konnte kein Bild mit "' .. matches[1] .. '" erstellen.'
   end
end

return {
   description = "Erstelle ein Doge Bild mit Wörtern",
   usage = {"/dogify das/was/du/willst"},
   patterns = {"^/dogify (.+)$"},
   run = run
}