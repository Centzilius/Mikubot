
function run(msg, matches)

	-- local g = require "./plugins/google"
	-- local query = "site:pornhub.com+viewkey+" .. matches[1]
	-- local new_matches = {query}

	-- return g.run(msg, new_matches)
	local results = findPornhub(matches[1])
	return results-- build_result(results)
end

function findPornhub(query)
	local api = "http://ajax.googleapis.com/ajax/services/search/web?v=1.0&q=site:pornhub.com+viewkey+" .. query:gsub(" ", "+")

	-- Do the request
	local res, code = https.request(api)

	if code ~=200 then return nil end
	local data = json:decode(res)
	local results = data.responseData.results



	math.randomseed( os.time() )
	math.random(#results)
	math.random(#results)
	local index = math.random(#results)

	local result = results[index].titleNoFormatting .. "\n".. results[index].unescapedUrl .."\n"

	return result
end

function build_result(query)
	local stringresults=""
	for key,val in ipairs(results) do
	stringresults=stringresults..val[1].."\n"..val[2].."\n\n"
	end
	return stringresults
end

return {
    description = "Sendet ein PornHub Video",
    usage = "/pornhub",
    patterns = {"^/pornhub (.*)$",
    			  "^/ph (.*)$"}, 
    run = run 
    }