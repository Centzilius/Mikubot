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
      text = text .. v.print_name .. " (user#id" .. v.id .. ")\n"
   end
   send_msg(receiver, text, ok_cb, false)
end

local function run(msg, matches)
   if matches[1] == "/id" then
      local text = user_print_name(msg.from) .. ' (user#id' .. msg.from.id .. ' ' .. tostring(is_sudo(msg)) .. ')'
      if is_chat_msg(msg) then
         text = text .. '\nDu bist in der Gruppe "' .. user_print_name(msg.to) .. '" (chat#id ' .. msg.to.id  .. ')'
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
   description = "Zeige dir IDs und IDs aller Gruppenmitglieder an.",
   usage = "/id, /id chat",
   patterns = {
      "^/id$",
      "^/ids? (chat)"
   },
   run = run
}