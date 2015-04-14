
function run(msg, matches)
	if matches[1] == "nope.avi" then
    		return 'https://www.youtube.com/watch?v=gvdf5n-zI14'
	end
	
end

return {
  description = 'Sendet ein YouTube Video namens "nope.avi"', 
  usage = "nope.avi", 
  patterns = {"^nope.avi"}, 
  run = run 
}

