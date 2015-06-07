function getAnime(query)
  local number = 1 -- Set number of results 
  local api        = "http://ajax.googleapis.com/ajax/services/search/web?v=1.0&safe=active&hl=de&rsz="..number.."&q=site%3Amyanimelist.net"
  local parameters = "+".. (URL.escape(query) or "")

  -- Do the request
  local res, code = https.request(api..parameters)
  if code ~=200 then return nil  end
  local data = json:decode(res)
  
  local results={}
  for key,result in ipairs(data.responseData.results) do
    table.insert(results, {
	  result.titleNoFormatting,
      result.unescapedUrl or result.url
    })
  end
  return results
end

function stringlinks(results)
  local stringresults=""
  for key,val in ipairs(results) do
    stringresults=stringresults..val[1].." - "..val[2].."\n"
  end
  return stringresults
end

function run(msg, matches)
   local results = getAnime(matches[1])
   return stringlinks(results)
end

return {
    description = "",
    usage = {"/myanimelist [Anime]","/mal [Anime]"},
    patterns = {"^/myanimelist (.*)$","^/mal (.*)$"}, 
    run = run 
    }
--Modified by Akamaru [https://ponywave.de]