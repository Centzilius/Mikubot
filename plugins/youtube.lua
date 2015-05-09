do

local BASE_URL = 'https://www.googleapis.com/youtube/v3'

function get_yt_data (yt_code)
  local apikey = cred_data.google_apikey
  local url = BASE_URL..'/videos?part=snippet,statistics&key='..apikey..'&id='..yt_code..'&fields=items(snippet(channelTitle,localized(title,description)),statistics(viewCount,likeCount,dislikeCount,commentCount))'
  local res,code  = https.request(url)
  if code ~= 200 then return "HTTP-FEHLER" end
  local data = json:decode(res).items[1]
  return data
end

function send_youtube_data(data, receiver)
  local title = data.snippet.localized.title
  -- local description = data.items[1].snippet.localized.description
  local uploader = data.snippet.channelTitle
  local viewCount = data.statistics.viewCount
  local likeCount = data.statistics.likeCount
  local dislikeCount = data.statistics.dislikeCount
  local commentCount = data.statistics.commentCount
	
  local text = title..'\n(Hochgeladen von: '..uploader..', '..viewCount..' mal angesehen, '..likeCount..' Likes und '..dislikeCount..' Dislikes, '..commentCount..' Kommentare)\n'
  send_msg(receiver, text, ok_cb, false)
end

function run(msg, matches)
  local yt_code = matches[1]
  local data = get_yt_data(yt_code)
  local receiver = get_receiver(msg)
  send_youtube_data(data, receiver)
end

return {
  description = "Sendet YouTube-Info.", 
  usage = "",
  patterns = {
    "youtu.be/([A-Za-z0-9-_-]+)",
    "youtube.com/watch%?v=([A-Za-z0-9-_-]+)",
  },
  run = run 
}

end
