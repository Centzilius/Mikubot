function getChuckNorris()
  b = http.request("http://api.icndb.com/jokes/random/")
  response = json:decode(b)
  return response.value.joke
end

function run(msg, matches)
  local j = getChuckNorris()
  if (j == nil) then
    return "Huch, da lief was falsch!"
  else
    return j
  end
end

return {
    description = "Sendet Chuck Norris Witze (Englisch)",
    usage = {"/cn"},
    patterns = {"^/cn$"},
    run = run
}