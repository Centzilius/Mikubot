-- Dirty code is dirty code, but idc 
-- later: yolo, aha.png, baka_bot, barusamikosu, frosch, moepse
function run(msg, matches)
  local user_name = get_name(msg)

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
    elseif string.match(msg.text, "^/[F|f][T|t][T|t]$") then
	return [[(╯°□°)╯︵ ┻━┻ FLIP THAT TABLE.
┻━┻ ︵ ヽ(°□°ヽ) FLIP THIS TABLE.
┻━┻ ︵ ＼(`0`)/ ︵ ┻━┻ FLIP ALL THE TABLES
ಠ_ಠ Child. . .
ಠ_ಠ Put.
ಠ__ಠ The tables.
ಠ___ಠ Back.
(╮°-°)╮┳━┳
(╯°□°)╯︵ ┻━┻ NEVER]]
    elseif string.match(msg.text, "^/[F|f][T|t][F|f]$") then
	return [[(╯┳┳)╯︵ ಠ‾ಠ FLIP THAT FATHER.
ಠ‾ಠ ︵ ヽ(┳┳ヽ) FLIP THIS FATHER.
ಠ‾ಠ ︵ ＼(┳┳)/ ︵ ಠ‾ಠ FLIP ALL THE FATHERS
┳━┳ Child. . .
┳━┳ Put.
┳━━┳ The Fathers.
┳━━━┳ Back.
(╮┳┳)╮ಠ_ಠ
(╯┳┳)╯︵ ಠ‾ಠ NEVER]]
    elseif string.match(msg.text, "^/[N|n][B|b][C|c]$") or string.match(msg.text, "^/[I|i][D|d][C|c]$") then
	return [[¯\_(ツ)_/¯]]
    elseif string.match(msg.text, "^/[L|l][F|f]$") then
	return '( ͡° ͜ʖ ͡°)'
    elseif string.match(msg.text, "^/[L|l][O|o][D|d]$") then
	return 'ಠ_ಠ'
    elseif string.match(msg.text, "^möp$") then
	return 'se'
    elseif string.match(msg.text, "^/[F|f][R|r][O|o][S|s][C|c][H|h]$") then
	return '🐸🐸🐸'
    elseif string.match(msg.text, "^/barusamiko$") or string.match(msg.text, "^/barusamikosu$") or string.match(msg.text, "^/Balsamiko Essig$") then
	send_photo(get_receiver(msg), "pictures/luckystar/barusamikosu.jpg", ok_cb, false)
    elseif string.match(msg.text, "^[B|b][A|a][K|k][A|a] [B|b][O|o][T|t]$") then
	return "Gomen'nasai "..user_name.."-sempai 😣"
    elseif string.match(msg.text, "^[A|a][H|h][A|a].[P|p][N|n][G|g]$") then
	send_photo(get_receiver(msg), "pictures/aha.png", ok_cb, false)
    elseif string.match(msg.text, "^~?[P|p][O||o][I|i]$") then
	send_photo(get_receiver(msg), "pictures/poi.jpg", ok_cb, false)
    elseif string.match(msg.text, "^/[Tt][Hh][Yy][Mm][Ee]$") then
	send_photo(get_receiver(msg), "pictures/thyme.jpg", ok_cb, false)
	end
end

return {
    description = "Ein Plugin mit nutzlosen Befehlen",
    usage = {""},
    patterns = {"^[R|r][I|i][C|c][H|h] [B|b][I|i][T|t][C|c][H|h]$",
				"^#[O|o][L|l][D|d]$",
				"^[N|n][Y|y][U|u]$",
				"^[N|n][O|o][P|p][E|e].[A|a][V|v][I|i]$",
				"^[N|n][I|i][I|i][S|s][A|a][N|n]$",
				"^[N|n][I|i][I|i](-)[S|s][A|a][N|n]$",
				"^[N|n][I|i][S|s][S|s][A|a][N|n]$",
				"^/[N|n][E|e][O|o][R|r][A|a][M|m][E|e]$",
				"^/[N|n][A|a][U|u]$",
				"^/[F|f][T|t][T|t]$",
				"^/[F|f][T|t][F|f]$",
				"^/[N|n][B|b][C|c]$",
				"^/[I|i][D|d][C|c]$",
				"^/[L|l][F|f]$",
				"^/[L|l][O|o][D|d]$",
				"^möp$",
				"^/[F|f][R|r][O|o][S|s][C|c][H|h]$",
				"^/barusamiko$",
				"^/barusamikosu$",
				"^/Balsamiko Essig$",
				"^[B|b][A|a][K|k][A|a] [B|b][O|o][T|t]$",
				"^[A|a][H|h][A|a].[P|p][N|n][G|g]$",
				"^~?[P|p][O||o][I|i]$",
				"^/[Tt][Hh][Yy][Mm][Ee]$"
				},
    run = run
}
--by Akamaru [https://ponywave.de]