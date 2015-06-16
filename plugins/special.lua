-- Dirty code is dirty code, but idc 
-- later: yolo, aha.png, baka_bot, barusamikosu, frosch, moepse
function run(msg, matches)
    if string.match(msg.text, "^[R|r][I|i][C|c][H|h] [B|b][I|i][T|t][C|c][H|h]$") then
	return 'Akamaru ist nicht reich!'
    elseif string.match(msg.text, "^#[O|o][L|l][D|d]$") then
	return 'Deine Mudda is old!'
    elseif string.match(msg.text, "^[N|n][Y|y][U|u]$") then
	send_photo(get_receiver(msg), "pictures/nyu.jpg", ok_cb, false)
    elseif string.match(msg.text, "^[N|n][O|o][P|p][E|e].[A|a][V|v][I|i]$") then
	send_video(get_receiver(msg), "videos/nope.avi", ok_cb, false)
	return 'Video wird gesendet...'
    elseif string.match(msg.text, "^[N|n][I|i][I|i][S|s][A|a][N|n]$") or string.match(msg.text, "^[N|n][I|i][I|i](-)[S|s][A|a][N|n]$") or string.match(msg.text, "^[N|n][I|i][S|s][S|s][A|a][N|n]$") then
	send_photo(get_receiver(msg), "pictures/Nii-san.jpg", ok_cb, false)
    elseif string.match(msg.text, "^/[N|n][E|e][O|o][R|r][A|a][M|m][E|e]$") then
	send_photo(get_receiver(msg), "pictures/neorame.jpg", ok_cb, false)
    elseif string.match(msg.text, "^/[N|n][A|a][U|u]$") then
	send_photo(get_receiver(msg), "pictures/nau.jpg", ok_cb, false)
    end
end

return {
    description = "",
    usage = {""},
    patterns = {"^[R|r][I|i][C|c][H|h] [B|b][I|i][T|t][C|c][H|h]$",
				"^#[O|o][L|l][D|d]$",
				"^[N|n][Y|y][U|u]$",
				"^[N|n][O|o][P|p][E|e].[A|a][V|v][I|i]$",
				"^[N|n][I|i][I|i][S|s][A|a][N|n]$",
				"^[N|n][I|i][I|i](-)[S|s][A|a][N|n]$",
				"^[N|n][I|i][S|s][S|s][A|a][N|n]$",
				"^/[N|n][E|e][O|o][R|r][A|a][M|m][E|e]$",
				"^/[N|n][A|a][U|u]$"
				},
    run = run
}
--by Akamaru [https://ponywave.de]