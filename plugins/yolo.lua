function run(msg, matches)
  local yolos = {'You Only Live Online','You Only Live Once',
  			   'You Only Love Oppai','You Only Lag Online'
  			   }
  return yolos[math.random(#yolos)]
end


return {
    description = "",
    usage = {"/yolo"},
    patterns = {"^/[Yy][Oo][Ll][Oo]$"}, 
    run = run
}
--by Akamaru [https://ponywave.de]