do

function getTitle(page)
  local s = page

  -- Remove optional spaces from the tags.
  s = string.gsub(s, "\n", " ")
  s = string.gsub(s, " *< *", "<")
  s = string.gsub(s, " *> *", ">")

  -- Put all the tags in lowercase.
  s = string.gsub(s, "(<[^ >]+)", string.lower)

  local i, f, t = string.find(s, "<title>(.+)</title>")
  return t or ""
end

function string.ends(str, fin)
  return fin=='' or string.sub(str,-string.len(fin)) == fin
end

function run(msg, matches)
  local url = matches[1]
  if string.ends(url, ".jpg") or string.ends(url, ".gif") or string.ends(url, ".png") then
      return
  end
  local result = http.request(url)
  local title = getTitle(result)
  
  --Ignoring 301, 302, 404 and more
  if  title == "301 Moved Permanently" or 
      title == "" or 
      title == "404 Not Found" or 
      title == "302 Found" or 
      title == "302 Moved" or 
      title == "Moved Permanently" or 
	  title == "Redirection" or
	  string.match(title, "521: Web server is down") or
      string.match(title, "deviantArt") or
      string.match(title, "twitch") or
      string.match(title, "eBay</title>") or
	  string.match(title, "Twitch") then
    print('Invalide, da "'..title..'"')
  else
    return title
  end
  end

return {
  description = "Postet URL-Titel", 
  usage = {"Irgendein Link"},
  patterns = {"^(https?://[%w-_%.%?%.:,/%+=&]+)$",}, 
  run = run 
}
end