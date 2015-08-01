-- Requires: (sudo) apt-get install youtube-dl
-- See https://github.com/rg3/youtube-dl/blob/master/README.md#options
function run(msg, matches)
  URL = matches[1]
  local receiver = get_receiver(msg)
  if string.match(msg.text, '"') then
	return 'Vergiss es'
  end
  if string.match(msg.text, "/mp4") then
    text = run_bash("youtube-dl -o tmp/video.mp4 --no-continue " .. URL)
	send_video(get_receiver(msg), "tmp/video.mp4", ok_cb, false)
  end
  if string.match(msg.text, "/mp3") then
    text = run_bash("youtube-dl -o tmp/sound.mp3 --audio-format mp3 --no-continue " .. URL)
	send_audio(get_receiver(msg), "tmp/sound.mp3", ok_cb, false)
  end
    print(text)
    return URL .. ' wurde gedownloadet und wird jetzt gesendet! \nDas kann je nach Video sehr lang dauern! \nAlso habt Geduld!'
end

return {
    description = "Downloadet und sendet ein Video von verschiedenen Seiten mit youtube-dl", 
    usage = {"/mp4 [Link] (Um Video zu laden)","/mp3 [Link] (Um Audio zu laden)","Unterstützte Seiten: https://ponywave.de/a/youtubedl"},
    patterns = {"^/mp4 (https?://[%w-_%.%?%.:/%+=&]+)$","^/mp3 (https?://[%w-_%.%?%.:/%+=&]+)$"}, 
    run = run
}
--by Akamaru [https://ponywave.de]