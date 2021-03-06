local function user_print_name(user)
   if user.print_name then
      return user.print_name
   end
   local text = ''
   if user.first_name then
      text = user.last_name..' '
   end
   if user.lastname then
      text = text..user.last_name
   end
   return text
end

local function returnids(cb_extra, success, result)
   local receiver = "chat#id" .. result.id
   local chatname = result.print_name
   local text = 'IDs fuer den Chat "' .. chatname .. '" (' .. receiver .. ')\n'
   text = text .. "Hier sind " .. result.members_num .. ' Mitglieder:\n---------\n'
   for k,v in pairs(result.members) do
      text = text .. v.print_name .. " (user#id" .. v.id ..")\n"
	  text = string.gsub(text, "%_", " ")
   end
   send_large_msg(receiver, text)
end

local function run(msg, matches)
   if matches[1] == "/id" or matches[1] == "/myid"then
      local text = 'Dein Name lautet "' .. user_print_name(msg.from) .. '" und deine ID ist ' .. msg.from.id .. ' ' .. tostring(is_sudo(msg))
      if is_chat_msg(msg) then
         text = text .. '\nDu bist in der Gruppe "' .. user_print_name(msg.to) .. '" und die Chat ID ist ' .. msg.to.id
		 text = string.gsub(text, "%_", " ")
      end
      return text
   elseif matches[1] == "chat" then
      if not is_chat_msg(msg) then
         return "Du bist nicht in einer Gruppe."
      end
      local chat_name = msg.to.print_name
      chat_info(chat_name, returnids, {})
   end
end

return {
   description = "Zeige dir deine ID und die IDs aller Gruppenmitglieder an.",
   usage = {"/id", "/myid"," /id chat"},
   patterns = {"^/id$","^/myid$","^/ids? (chat)"},
   run = run
}