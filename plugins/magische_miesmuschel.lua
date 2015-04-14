do

function run(msg, matches)
  local answers = {'Ja','Nein','Eines Tages vielleicht'}
  return answers[math.random(#answers)]
end


return {
    description = "Beantwortet euch eine Frage (100% Wahrheit!)",
    usage = "Magische Miesmuschel [Frage]",
    patterns = {
	"^Magische Miesmuschel(.*)$",
	"^magische Miesmuschel(.*)$",
	"^Magische miesmuschel(.*)$",
	"^magische miesmuschel(.*)$"
	}, 
    run = run
}
end