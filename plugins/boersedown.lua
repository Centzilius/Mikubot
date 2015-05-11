socket = require("socket")

function cron()
	-- Use yours desired web and id
	local addr = "www.boerse.to"
	local dest = "chat#id12345678"
    -- Checks a TCP connexion
    local connexion = socket.connect(addr, 80)
    if not connexion then 
    	local text = "boerse.to ist schon wieder Offline..."
    	print (text)
    	send_msg(dest, text, ok_cb, false)
    else
        connexion:close()
    end
end

return {
    description = "Checkt ob Boerse.to online ist",
    usage = {"Hierfür gibt es kein Befehl"},
    patterns = {},
    run = nil,
    cron = cron
}