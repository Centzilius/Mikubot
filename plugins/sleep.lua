require "socket"

local function sleep(sec)
    socket.select(nil, nil, sec)
end

local function run(msg, matches)

  print('Schlafe... ')
  
-- Set delay in seconds (10 = 10 seconds)
local delay = 60
  sleep(delay)
  
  return 'Bin wieder da!'
  
end

return {
  description = "Setzt den Bot in schlaf", 
  usage = {"/sleep"},
  patterns = {"^/[Ss][Ll][Ee][Ee][Pp]$"}, 
  run = run 
}
--by Akamaru [https://ponywave.de]