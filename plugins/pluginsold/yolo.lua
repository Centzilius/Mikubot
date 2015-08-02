function run(msg, matches)
	return 'Hä YOLO?'
end

return {
  description = "Sendet euch ein Hä YOLO?", 
  usage = {'yolo','Yolo','YOLO'},
  patterns = {'^yolo$','^Yolo$','^YOLO$'}, 
  run = run 
}
--by Akamaru [https://ponywave.de]