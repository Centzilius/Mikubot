
function run(msg, matches)
  text = matches[2]
  local user_name = get_name(msg)
  
	if matches[1] == '/afk' and not text then
	  return user_name .. ' ist nun AFK'
	end
	
	if matches[1] == '/afk' then
      return user_name .. ' ist nun AFK (' .. text .. ')'
	end
	
    if matches[1] == '/re' or '/wd' then
	  return  user_name .. ' ist wieder da!'
	end
	
end

return {
  description = 'Sagt dass ihr afk oder wieder da seid',
    usage = {'/afk','/re','/wd'},
  patterns = {'^/([A|a][F|f][K|k])$','^/([A|a][F|f][K|k]) (.*)$','^/([R|r][E|e])$','^/([W|w][D|d])$'}, 
  run = run 
}
--by Akamaru [https://ponywave.de]