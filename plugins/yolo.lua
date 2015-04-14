
function run(msg, matches)
	if matches[1] == "yolo" then
    		return 'Hä YOLO?'
	end
	
end

return {
  description = "Sendet euch ein Hä YOLO?", 
  usage = "/yolo",
  patterns = {"^/(yolo)"}, 
  run = run 
}

