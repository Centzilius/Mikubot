function run(msg, matches)
  URL = matches[1]
  local receiver = get_receiver(msg)
    text = run_bash("rm tmp/video.mp4 && youtube-dl -o tmp/video.mp4 " .. URL)
	send_video(get_receiver(msg), "tmp/video.mp4", ok_cb, false)
    return URL .. ' wurde gedownloadet und wird jetzt gesendet! \nDas kann je nach Video sehr lang dauern! \nAlso habt Gedult!'
end

return {
    description = "Downloadet und sendet ein Video von verschiedenen Seiten mit youtube-dl", 
    usage = {"/dl [Link]"},
    patterns = {"^/dl (https?://[%w-_%.%?%.:/%+=&]+)$"}, 
    run = run
}
--by Akamaru [https://ponywave.de]