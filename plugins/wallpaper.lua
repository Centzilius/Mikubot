
do

function getWallpaper(text)
  local text = URL.escape(text)
  local api = "https://ajax.googleapis.com/ajax/services/search/images?v=1.0&rsz=8&safe=active&tbs=isz:l&tbm=isch&q=wallpaper+"
  local res, code = http.request(api..text)
  if code ~= 200 then return nil end
  local google = json:decode(res)

  if google.responseStatus ~= 200 then
    return nil
  end

  local data = google.responseData
  
  if not data or not data.results then
    return nil
  end

  if #data.results == 0 then
    return nil
  end

  -- Random image from table
  local i = math.random(#data.results)
  return data.results[i].url
end

function run(msg, matches)
  local receiver = get_receiver(msg)
  local text = matches[1]
  local url = getWallpaper(text)
  
  if not url then
    return "Kein Wallpaper gefunden."
  end

  print("Bilder-URL: ", url)
    send_photo_from_url(receiver, url)
    return "Source: "..url
end

return {
    description = "Sucht Wallpaper mit Google und versendet es (SafeSearch aktiv)", 
    usage = {"/wallpaper [Suchbegriff]","/wp [Suchbegriff]"},
    patterns = {"^/wallpaper (.*)$","^/wp (.*)$"}, 
    run = run 
}
end
-- Original by yagop ; Modified by Akamaru