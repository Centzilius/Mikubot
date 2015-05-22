
function run(msg, matches)
  local user_name = get_name(msg)
       return "Gomen'nasai "..user_name.."-sempai 😣"
end

return {
  description = "So ein dummer Bot", 
  usage = {"Baka Bot","baka bot","Baka bot","baka Bot","BAKA BOT"},
  patterns = {"baka bot","Baka bot","baka Bot","Baka Bot","BAKA BOT"}, 
  run = run 
}
--by Akamaru [https://ponywave.de]