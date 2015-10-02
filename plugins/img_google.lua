do

function getGoogleImage(text)
  local text = URL.escape(text)
  local api = "https://ajax.googleapis.com/ajax/services/search/images?v=1.0&rsz=8&safe=active&q="
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
  -- local i = math.random(#data.results)
  -- return data.results[i].url
  return data.results
end

function run(msg, matches)
  local receiver = get_receiver(msg)
  local text = matches[1]
  
  local results = getGoogleImage(text)
  if not results then
    return "Kein Bild gefunden."
  end
  local i = math.random(#results)
  local url = nil;
  
  local failed = true
  local nofTries = 0
  while failed and nofTries < #results do  
	  url = results[i].url;
	  print("Bilder-URL: ", url)
	  
	  if string.ends(url, ".gif") then
		failed = not send_document_from_url(receiver, url)
	  elseif string.ends(url, ".jpg") or string.ends(url, ".jpeg") or string.ends(url, ".png") then
		failed = not send_photo_from_url(receiver, url, nil, nil, false)
	  end
	  
	  nofTries = nofTries + 1
	  i = i+1
	  if i > #results then
		i = 1
	  end 
  end
  
  if failed then
	  return "Fehler beim Laden des Bildes."
  else
	  return "Source: "..url
  end
end

return {
    description = "Sucht Bild mit Google-API und versendet es (SafeSearch aktiv)", 
    usage = {"/img [Suchbegriff]"},
    patterns = {"^/img (.*)$"}, 
    run = run 
}
end