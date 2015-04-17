do

function getGoogleImage(text)
  local text = URL.escape(text)
  local api = "https://ajax.googleapis.com/ajax/services/search/images?v=1.0&rsz=8&q="
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
  local url = getGoogleImage(text)
  
  if not url then
    return "Kein Bild gefunden."
  end

  print("Bilder-URL: ", url)
    send_photo_from_url(receiver, url)
	return "Source: "..url
end

return {
    description = "Sucht Bild mit Google-API und versendet es (SafeSearch aktiv)", 
    usage = "/img2 [Suchbegriff]",
    patterns = {"^/img2 (.*)$",
				"^/nsfwimg (.*)$"}, 
    run = run 
}

end
