function run(msg, matches)
  --local text = matches[2]
  local user_name = get_name(msg)
  
	--[[if matches[1] == '/afk' and matches[2] then
	  return user_name .. ' ist nun AFK (' .. text .. ')'
	else
      return user_name .. ' ist nun AFK'
	end]]
	
    if string.starts(msg.text, '/afk') then
      return user_name .. ' ist nun AFK'
	--elseif string.starts(msg.text, '/afk') and text == not nil then
	  --return user_name .. ' ist nun AFK (' .. text .. ')'
	end
	
    if string.starts(msg.text, '/re') or string.starts(msg.text, '/wd') then
	  return  user_name .. ' ist wieder da!'
    end
	
end

return {
  description = 'Sagt dass ihr afk oder wieder da seid',
    usage = {'/afk','/re','/wd'},
  patterns = {'^/[A|a][F|f][K|k]$','^/[A|a][F|f][K|k] (.*)$','^/[R|r][E|e]$','^/[W|w][D|d]$'}, 
  run = run 
}
--by Akamaru [https://ponywave.de]