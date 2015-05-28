local function run(msg, matches)
  local text = matches[1]
  local b = 1

  while b ~= 0 do
    text,b = text:gsub('^/+','')
    text = text:trim()
  end
  return text
end

return {
  description = "Wiederholt euch",
  usage = {"/echo [Satz]","/Echo [Satz]"},
  patterns = {"^/echo (.*)$","^/Echo (.*)$"}, 
  run = run 
}
