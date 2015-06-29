-- Requires: (sudo) apt-get install youtube-dl
-- See https://github.com/rg3/youtube-dl/blob/master/README.md#options
function run(msg, matches)
  URL = matches[1]
  local receiver = get_receiver(msg)
  if string.match(msg.text, '"') then
	return 'Vergiss es'
  else
    text = run_bash("youtube-dl -o tmp/video.mp4 --no-playlist --no-continue --max-filesize 15m " .. URL)
	send_video(get_receiver(msg), "tmp/video.mp4", ok_cb, false)
    return URL .. ' wurde gedownloadet und wird jetzt gesendet! \nDas kann je nach Video sehr lang dauern! \nAlso habt Geduld!'
  end
end

return {
    description = "Downloadet und sendet ein Video von verschiedenen Seiten mit youtube-dl", 
    usage = {"/dl [Link]"},
    patterns = {"^/dl (https?://[%w-_%.%?%.:/%+=&]+)$"}, 
    run = run
}
--by Akamaru [https://ponywave.de]