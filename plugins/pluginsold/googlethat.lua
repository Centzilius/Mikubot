-- Need this for wiki.lua
function googlethat(query)
  local number = 5 -- Set number of results 
  local api        = "http://ajax.googleapis.com/ajax/services/search/web?v=1.0&safe=active&hl=de&rsz="..number.."&"
  local parameters = "q=".. (URL.escape(query) or "")

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