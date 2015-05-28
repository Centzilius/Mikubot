do

-- Recursive function
local function getRandomButts(attempt)
  attempt = attempt or 0
  attempt = attempt + 1

  local res,status = http.request("http://api.obutts.ru/noise/1")

  if status ~= 200 then return nil end
  local data = json:decode(res)[1]

  -- The OpenBoobs API sometimes returns an empty array
  if not data and attempt <= 3 then 
    print('Keine Butts gefunden!')
    return getRandomButts(attempt)
  end

  return 'http://media.obutts.ru/' .. data.preview
end

local function getRandomBoobs(attempt)
  attempt = attempt or 0
  attempt = attempt + 1

  local res,status = http.request("http://api.oboobs.ru/noise/1")

  if status ~= 200 then return nil end
  local data = json:decode(res)[1]

  -- The OpenBoobs API sometimes returns an empty array
  if not data and attempt < 10 then 
    print('Keine Boobs gefunden!')
    return getRandomBoobs(attempt)
  end

  return 'http://media.oboobs.ru/' .. data.preview
end

local function run(msg, matches)
  local url = nil
  
  if matches[1] == "/boobs" then
    url = getRandomBoobs()
  end

  if matches[1] == "/butts" then
    url = getRandomButts()
  end

  if url ~= nil then
    local receiver = get_receiver(msg)
    send_photo_from_url(receiver, url)
  --return "Source: "..url
  return "Bild wird gesendet!"
  else
    return 'Keine Boobs/Butts gefunden.' 
  end
end

return {
  description = "Sendet ein zufälliges Boobs/Butts Bild", 
  usage = {"/boobs","/butts"},
  patterns = {"^/boobs$","^/butts$"}, 
  run = run 
}

end
