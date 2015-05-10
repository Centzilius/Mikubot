-- This is a proprietary plugin, property of Andreas Bielawski, (c) 2015 <andi (dot) b (at) outlook (dot) de>
-- DO NOT USE WITHOUT PERMISSION
-- Modified by Akamaru (http://akamaru.de)

do

local function get_e621(tag)
  local BASE_URL = 'https://e621.net'
  local url = BASE_URL..'/post/index.json?tag='..tag
  local b,c = https.request(url)
  if c ~= 200 then return nil end
  local e621 = json:decode(b)
  -- truly randomize
  math.randomseed(os.time())
  -- random max json table size
  local i = math.random(#e621)
  local link_image = e621[i].file_url
  return link_image
end

local function run(msg, matches)
  local tag = matches[1]
  local receiver = get_receiver(msg)
  local url = get_e621(tag)
  send_photo_from_url(receiver, url, send_title, {receiver, title})
  --return "Source: "..url
  return "Bild wird gesendet!"
end

return {
  description = "Sendet zufälliges Bild von e621.", 
  usage = {"/e621 [Tags]"},
  patterns = {"^/e621 (.*)$"},
  run = run 
}

end