local function get_db(id)
  local BASE_URL = 'http://danbooru.donmai.us'
  local url = BASE_URL..'/posts/'..id..'.json'
  local b,c = http.request(url)
  if c ~= 200 then return nil end
  local db = json:decode(b)
  local link_image = BASE_URL..db.file_url
  return link_image
end

local function run(msg, matches)
  local id = matches[1]
  local receiver = get_receiver(msg)
  local url = get_db(id)
  if string.ends(url, ".gif") or string.ends(url, ".zip") or string.ends(url, ".webm") then
    send_document_from_url(receiver, url)
  else
	send_photo_from_url(receiver, url)
  end
end

return {
    description = "Sendet ein Bild, wenn ein Danbooru Link gesendet wird", 
    usage = {"Link zum Danbooru Post (danbooru.donmai.us/posts/)"},
    patterns = {"danbooru.donmai.us/posts/([0-9]+)"}, 
    run = run 
}
--original by Brawl345 [https://github.com/Brawl345], edited by Akamaru [https://ponywave.de]