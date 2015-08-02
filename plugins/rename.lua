function run(msg, matches)
local receiver = get_receiver(msg)
local text = matches[1]
    rename_chat(receiver, text, ok_cb, false)
end

return {
    description = "",
    usage = {""},
    patterns = {"^/rename (.*)$"}, 
    run = run
}
--by Akamaru [https://ponywave.de]