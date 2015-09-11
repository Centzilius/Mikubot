-- Dirty code is dirty code, but idc

require "socket"

function sleep(sec)
    socket.select(nil, nil, sec)
end

function run(msg, matches)
  local user_name = get_name(msg)

    if string.match(msg.text, "^[Rr][Ii][Cc][Hh] [Bb][Ii][Tt][Cc][Hh]$") then
	return 'Akamaru ist nicht reich!'
    elseif string.match(msg.text, "^#[Oo][Ll][Dd]$") then
	return 'Deine Mudda is old!'
    elseif string.match(msg.text, "^[Nn][Yy][Uu]$") then
	send_photo(get_receiver(msg), "pictures/nyu.jpg", ok_cb, false)
    elseif string.match(msg.text, "^[Nn][Oo][Pp][Ee].[Aa][Vv][Ii]$") then
	send_video(get_receiver(msg), "videos/nope.avi", ok_cb, false)
	return 'Video wird gesendet...'
    elseif string.match(msg.text, "^[Nn][Ii][Ii][Ss][Aa][Nn]$") or string.match(msg.text, "^[Nn][Ii][Ii](-)[Ss][Aa][Nn]$") or string.match(msg.text, "^[Nn][Ii][Ss][Ss][Aa][Nn]$") then
	send_photo(get_receiver(msg), "pictures/Nii-san.jpg", ok_cb, false)
    elseif string.match(msg.text, "^/[Nn][Ee][Oo][Rr][Aa][Mm][Ee]$") then
	send_photo(get_receiver(msg), "pictures/neorame.jpg", ok_cb, false)
    elseif string.match(msg.text, "^/[Nn][Aa][Uu]$") then
	send_photo(get_receiver(msg), "pictures/nau.jpg", ok_cb, false)
    elseif string.match(msg.text, "^/[Ff][Tt][Tt]$") then
	return [[(╯°□°)╯︵ ┻━┻ FLIP THAT TABLE.
┻━┻ ︵ ヽ(°□°ヽ) FLIP THIS TABLE.
┻━┻ ︵ ＼(`0`)/ ︵ ┻━┻ FLIP ALL THE TABLES
ಠ_ಠ Child. . .
ಠ_ಠ Put.
ಠ__ಠ The tables.
ಠ___ಠ Back.
(╮°-°)╮┳━┳
(╯°□°)╯︵ ┻━┻ NEVER]]
    elseif string.match(msg.text, "^/[Ff][Tt][Ff]$") then
	return [[(╯┳┳)╯︵ ಠ‾ಠ FLIP THAT FATHER.
ಠ‾ಠ ︵ ヽ(┳┳ヽ) FLIP THIS FATHER.
ಠ‾ಠ ︵ ＼(┳┳)/ ︵ ಠ‾ಠ FLIP ALL THE FATHERS
┳━┳ Child. . .
┳━┳ Put.
┳━━┳ The Fathers.
┳━━━┳ Back.
(╮┳┳)╮ಠ_ಠ
(╯┳┳)╯︵ ಠ‾ಠ NEVER]]
    elseif string.match(msg.text, "^/[Nn][Bb][Cc]$") or string.match(msg.text, "^/[Ii][Dd][Cc]$") then
	return [[¯\_(ツ)_/¯]]
    elseif string.match(msg.text, "^/[Ll][Ff]$") then
	return '( ͡° ͜ʖ ͡°)'
    elseif string.match(msg.text, "^/[Ll][Oo][Dd]$") then
	return 'ಠ_ಠ'
    elseif string.match(msg.text, "^[Mm]ö[Pp]$") or string.match(msg.text, "^[Mm][Ee][Ee][Pp]$") then
	return 'se'
    elseif string.match(msg.text, "^/[Ff][Rr][Oo][Ss][Cc][Hh]$") then
	return '🐸🐸🐸'
    elseif string.match(msg.text, "^/[Bb][Aa][Rr][Uu][Ss][Aa][Mm][Ii][Kk][Oo][Ss][Uu]$") or string.match(msg.text, "^/[Bb][Aa][Ll][Ss][Aa][Mm][Ii][Kk][Oo] [Ee][Ss][Ss][Ii][Gg]$") then
	send_photo(get_receiver(msg), "pictures/luckystar/barusamikosu.jpg", ok_cb, false)
    elseif string.match(msg.text, "^[Bb][Aa][Kk][Aa] [Bb][Oo][Tt]$") then
	return "Gomen'nasai "..user_name.."-sempai 😣"
    elseif string.match(msg.text, "^[Aa][Hh][Aa].[Pp][Nn][Gg]$") then
	send_photo(get_receiver(msg), "pictures/aha.png", ok_cb, false)
    elseif string.match(msg.text, "^~?[Pp][Oo][Ii]$") then
	send_photo(get_receiver(msg), "pictures/poi.jpg", ok_cb, false)
    elseif string.match(msg.text, "^/[Tt][Hh][Yy][Mm][Ee]$") then
	send_photo(get_receiver(msg), "pictures/thyme.jpg", ok_cb, false)
    elseif string.match(msg.text, "^[Yy][Oo][Ll][Oo]$") then
	return 'Hä YOLO?'
    elseif string.match(msg.text, "^/[Kk][Aa][Pp][Pp][Aa]$") then
       return [[⠀⠀⠀⠀⣀⣀⣬⣥⣽⣿⣧⣤⢀⠀⠀⠀
⠀⠀⠀⠂⢯⣧⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀
⠀⢨⣽⣾⣿⣿⣿⣿⡿⠛⠃⠉⠛⣿⣿⠀
⠀⠘⣿⣿⣿⡟⠁⠁⠀⠀⠀⠀⠨⣟⢿⠀
⠀⠀⠩⢿⠀⠀⠶⠾⢿⡿⠉⠿⣿⡿⢟⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣩⣦⣾⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠠⡦⣺⣿⡿⣹⡏⠀
⠀⠀⠀⠀⠀⠀⠻⠅⢄⡀⢈⣻⠟⠀⠀⠀]]
    elseif string.match(msg.text, "[Ii] [Ww][Ii][Ss][Hh] [Ss][Qq][Uu][Ii][Dd][Ss] [Ww][Ee][Rr][Ee] [Rr][Ee][Aa][Ll]") then
	send_photo(get_receiver(msg), "pictures/squid.jpg", ok_cb, false)
	--sleep(2)
	return 'They are'
    elseif string.match(msg.text, "[Ff][Gg][Tt]") then
	return --'Deine Mudda is fgt!'
	end
end

return {
    description = "Ein Plugin mit nutzlosen Befehlen",
    usage = {""},
    patterns = {"^[Rr][Ii][Cc][Hh] [Bb][Ii][Tt][Cc][Hh]$",
				"^#[Oo][Ll][Dd]$",
				"^[Nn][Yy][Uu]$",
				"^[Nn][Oo][Pp][Ee].[Aa][Vv][Ii]$",
				"^[Nn][Ii][Ii][Ss][Aa][Nn]$",
				"^[Nn][Ii][Ii](-)[Ss][Aa][Nn]$",
				"^[Nn][Ii][Ss][Ss][Aa][Nn]$",
				"^/[Nn][Ee][Oo][Rr][Aa][Mm][Ee]$",
				"^/[Nn][Aa][Uu]$",
				"^/[Ff][Tt][Tt]$",
				"^/[Ff][Tt][Ff]$",
				"^/[Nn][Bb][Cc]$",
				"^/[Ii][Dd][Cc]$",
				"^/[Ll][Ff]$",
				"^/[Ll][Oo][Dd]$",
				"^[Mm]ö[Pp]$",
				"^[Mm][Ee][Ee][Pp]$",
				"^/[Ff][Rr][Oo][Ss][Cc][Hh]$",
				"^/[Bb][Aa][Rr][Uu][Ss][Aa][Mm][Ii][Kk][Oo][Ss][Uu]$",
				"^/[Bb][Aa][Ll][Ss][Aa][Mm][Ii][Kk][Oo] [Ee][Ss][Ss][Ii][Gg]$",
				"^[Bb][Aa][Kk][Aa] [Bb][Oo][Tt]$",
				"^[Aa][Hh][Aa].[Pp][Nn][Gg]$",
				"^~?[Pp][Oo][Ii]$",
				"^/[Tt][Hh][Yy][Mm][Ee]$",
				"^[Yy][Oo][Ll][Oo]$",
				"^/[Kk][Aa][Pp][Pp][Aa]$",
				"[Ii] [Ww][Ii][Ss][Hh] [Ss][Qq][Uu][Ii][Dd][Ss] [Ww][Ee][Rr][Ee] [Rr][Ee][Aa][Ll]",
				"[Ff][Gg][Tt]"
				},
    run = run
}
--by Akamaru [https://ponywave.de]