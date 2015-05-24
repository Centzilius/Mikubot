function run_bash(str)
    local cmd = io.popen(str)
    local result = cmd:read('*all')
    cmd:close()
    return result
end

function run(msg, matches)
  URL = matches[1]
  local receiver = get_receiver(msg)
    text = run_bash("youtube-dl -o tmp/video.mp4 " .. URL)
	send_video(get_receiver(msg), "tmp/video.mp4", ok_cb, false)
    return 'Video wird gesendet! \nDas kann je nach Video bis zu 10 Minuten dauern!'
end

return {
    description = "Downloadet und sendet ein YouTube-Video", 
    usage = {"/ydl"},
    patterns = {"^/ydl (.*)$"}, 
    run = run
}
--by Akamaru [https://ponywave.de]