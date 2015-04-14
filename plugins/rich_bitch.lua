
function run(msg, matches)
	if matches[1] == "rich bitch" then
    		return 'Akamaru ist nicht reich!'
	end
	
end

return {
  description = "Sagt euch dass Akamaru nicht reich ist", 
  usage = "rich bitch",
  patterns = {"^Rich Bitch",
			  "^rich bitch",
			  "^rich Bitch",
			  "^Rich bitch",
			  "^RICH BITCH"}, 
  run = run 
}

