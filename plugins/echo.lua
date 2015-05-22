local function run(msg, matches)
  return matches[1]
end

return {
  description = "Wiederholt euch",
  usage = {"/echo [Satz]","/Echo [Satz]"},
  patterns = {"^/echo (.*)$","^/Echo (.*)$"}, 
  run = run 
}
