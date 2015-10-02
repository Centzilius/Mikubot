function run(msg, matches)
  return  'Mikubot V.'..VERSION..' by @Akamaru. \n\nSourcecode: https://ponywave.de/a/mikubot'
end

return {
  description = "Zeigt die Bot Version", 
  usage = {"/version","/v"},
  patterns = {"^/version$","^/v$"}, 
  run = run 
}