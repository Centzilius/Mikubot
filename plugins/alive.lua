function run(msg, matches)
  local user_name = get_name(msg)
  local answers = {'Ja?','Was gibts, ' .. user_name .. '?','Ja ' .. user_name .. ', was ist?',
  				 'Ich bin noch da.', user_name ,'Nein!','So heiße ich'}
  return answers[math.random(#answers)]
end

return {
    description = "Ist der Bot noch da?",
    usage = {"Miku"},
    patterns = {"^[Mm][Ii][Kk][Uu](?)$",
				"^[Mm][Ii][Kk][Uu]$"
				}, 
    run = run
}
--by Akamaru [https://ponywave.de]