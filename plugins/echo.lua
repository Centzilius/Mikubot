
function run(msg, matches)
  return matches[1]
end

return {
  description = "Wiederholt euch",
  usage = "/echo [Satz]",
  patterns = {
    "^/echo (.*)$"
  }, 
  run = run 
}
