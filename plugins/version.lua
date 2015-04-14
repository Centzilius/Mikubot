do

function run(msg, matches)
  return 'Mikubot '.. VERSION ..' by Akamaru'
end

return {
  description = "Zeigt die Bot Version", 
  usage = "/version",
  patterns = {
    "^/version$"
  }, 
  run = run 
}

end
