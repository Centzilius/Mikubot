function run(msg, matches)
  local user_name = get_name(msg)
  local other_user = matches[1]
  local random = {
      user_name..' schlägt '..other_user..' mit einem stinkenden Fisch.',
      user_name..' versucht, '..other_user..' mit einem Messer zu töten, bringt sich dabei aber selbst um.',
	  user_name..' versucht, '..other_user..' mit einem Messer zu töten, stolpert aber und schlitzt sich dabei das Knie auf.',
      user_name..' ersticht '..other_user..'.',
	  user_name..' tritt '..other_user..'.',
	  user_name..' hat '..other_user..' umgebracht! Möge er in der Hölle schmoren!',
	  user_name..' hat die Schnauze voll von '..other_user..' und sperrt ihn in einen Schrank.',
	  user_name..' erwürgt '..other_user..'. BILD sprach als erstes mit der Hand.',
	  user_name..' schickt '..other_user..' nach /dev/null.',
	  user_name..' umarmt '..other_user..'.',
	  user_name..' verschenkt eine Kartoffel an '..other_user..'.',
	  user_name..' ist in '..other_user..' verliebt.',
	  user_name..' gibt '..other_user..' einen Cookie.'}
  
  return random[math.random(#random)]
end


return {
    description = "",
    usage = "/random [Name]",
    patterns = {"^/random (.*)$"}, 
    run = run
}
--by Akamaru [https://ponywave.de]