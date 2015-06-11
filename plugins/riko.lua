do

local function get_url()
  local url = 'http://riko.moe'
  local res,code = http.request(url)
  if code ~=200 then return "Fehler beim Abrufen von yagyuu.moe" end
  local photo_url = string.match(res, "<img src%=\"(.-)\" alt")
  local photo_url = url..'/'..photo_url
  return photo_url
end

local function run(msg, matches)  
  local photo_url = get_url()
  local receiver = get_receiver(msg)
  send_photo_from_url(receiver, photo_url)
end

return {
  description = "Postet ein Bild von riko.moe", 
  usage = "/riko",
  patterns = {"^/[R|r]iko$"}, 
  run = run 
}
-- Created by github.com/Brawl345
end