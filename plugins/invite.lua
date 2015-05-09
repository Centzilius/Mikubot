-- Invite other user to the chat group.
-- Use !invite name User_name or !invite id id_number
-- The User_name is the print_name (there are no spaces but _)

do

local function run(msg, matches)
	-- User submitted a user name
	if matches[1] == "name" then
		user = matches[2]
		user = string.gsub(user," ","_")
	end
	-- User submitted an id
	if matches[1] == "id" then
		user = matches[2]
		user = 'user#id'..user
	end
	-- The message must come from a chat group
	if msg.to.type == 'chat' then
    	chat = 'chat#id'..msg.to.id
  	else 
  		return 'Dies ist keine Gruppe!!'
  	end
  	print ("Füge "..user.." zu "..chat.." hinzu")
	status = chat_add_user (chat, user, ok_cb, false)
	if not status then
		return "Ein Fehler ist aufgetreten"
	end
	return "User "..user.." zu "..chat.." hinzugefügt!"
end

return {
    description = "Andere User zu einer Chat-Gruppe hinzufügen", 
    usage = "/invite name [user_name], !invite id [user_id]",
    patterns = {
      "^/invite (name) (.*)$",
      "^/invite (id) (%d+)$"
    }, 
    run = run 
}

end
