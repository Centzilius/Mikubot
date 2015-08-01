-- Requires: (sudo) apt-get install youtube-dl
-- See https://github.com/rg3/youtube-dl/blob/master/README.md#options
function run(msg, matches)
  URL = matches[1]
  local receiver = get_receiver(msg)
  if string.match(msg.text, '"') then
	return 'Vergiss es'
  else
    text = run_bash("youtube-dl -o tmp/sound.mp3 --audio-format mp3 --no-continue " .. URL)
	send_audio(get_receiver(msg), "tmp/sound.mp3", ok_cb, false)
    return URL .. ' wurde gedownloadet und wird jetzt gesendet! \nDas kann je nach Video sehr lang dauern! \nAlso habt Geduld!'
  end
end

return {
    description = "Downloadet und sendet die MP3 von einem YouTube-Video", 
    usage = {"/mp3 [Link]"},
    patterns = {"^/mp3 (https?://[%w-_%.%?%.:/%+=&]+)$"}, 
    run = run
}
--by Akamaru [https://ponywave.de]