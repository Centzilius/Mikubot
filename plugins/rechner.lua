function run(msg, matches)
  -- Convert expression to a function and execute it
  local expression = string.gsub(matches[1], "(%a+)", "math.%1")
  return load('return '..expression)()
end

return {
  description = "Ein simpler Taschenrechner",
  usage = "/calc [Rechnung]",
  patterns = {
    "^/calc (.*)$"
  },
  run = run
}