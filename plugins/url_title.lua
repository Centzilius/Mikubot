do

function getTitle(page)
  local s = page

  -- Remove optional spaces from the tags.
  s = string.gsub(s, "\n", " ")
  s = string.gsub(s, " *< *", "<")
  s = string.gsub(s, " *> *", ">")
  s = string.gsub(s, "&#124;", "|")
  s = string.gsub(s, "&#8249;", "‹")
  s = string.gsub(s, "&lt;", "<")
  s = string.gsub(s, "&gt;", ">")
  s = string.gsub(s, "&amp;", "&")
  s = string.gsub(s, "&#39;", "'")
  s = string.gsub(s, "&ndash;", "–")
  s = string.gsub(s, "&raquo;", "»")
  s = string.gsub(s, "&#8220;", "“")
  s = string.gsub(s, "&#8221;", "”")

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
	  title == "Object moved" or
	  string.match(title, "on Steam") or
	  string.match(title, "521: Web server is down") or
      string.match(title, "eBay</title>") or
	  string.match(msg.text, "twitch.tv") or
	  string.match(msg.text, "steamcommunity.com/app/") or
	  string.match(msg.text, "deviantart.com") or
	  string.match(msg.text, "urbanup.com/") or
	  string.match(msg.text, "urbandictionary.com/define.php") then
    print('Ungültig, da "'..title..'"')
  else
    return title
  end
  end

return {
  description = "Postet den URL-Titel", 
  usage = {""},
  patterns = {"^(https?://[%w-_%.%?%.:,/%+=&#!]+)$"}, 
  run = run 
}
end