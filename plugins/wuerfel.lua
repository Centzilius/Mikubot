do

function run(msg, matches)
  local answers = {'1','2','3','4','5','6'}
  return answers[math.random(#answers)]
end

return {
    description = "Würfel eine Zahl zwischen 1 bis 6",
    usage = {"/würfel"},
    patterns = {"^/würfel"},
    run = run
}
end
--by Akamaru [https://ponywave.de]