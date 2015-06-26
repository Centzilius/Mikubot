do

local BASE_URL = 'https://www.googleapis.com/youtube/v3'

function get_yt_data (yt_code)
  local apikey = cred_data.google_apikey
  local url = BASE_URL..'/videos?part=snippet,statistics,contentDetails&key='..apikey..'&id='..yt_code..'&fields=items(snippet(channelTitle,localized(title,description)),statistics(viewCount,likeCount,dislikeCount,commentCount),contentDetails(duration))'
  local res,code  = https.request(url)
  if code ~= 200 then return "HTTP-FEHLER" end
  local data = json:decode(res).items[1]
  return data
end

local function convertISO8601Time(duration)
	local a = {}

	for part in string.gmatch(duration, "%d+") do
	   table.insert(a, part)
	end

	if duration:find('M') and not (duration:find('H') or duration:find('S')) then
		a = {0, a[1], 0}
	end

	if duration:find('H') and not duration:find('M') then
		a = {a[1], 0, a[2]}
	end

	if duration:find('H') and not (duration:find('M') or duration:find('S')) then
		a = {a[1], 0, 0}
	end

	duration = 0

	if #a == 3 then
		duration = duration + tonumber(a[1]) * 3600
		duration = duration + tonumber(a[2]) * 60
		duration = duration + tonumber(a[3])
	end

	if #a == 2 then
		duration = duration + tonumber(a[1]) * 60
		duration = duration + tonumber(a[2])
	end

	if #a == 1 then
		duration = duration + tonumber(a[1])
	end

	return duration
end

function send_youtube_data(data, receiver)
  local title = data.snippet.localized.title
  -- local description = data.items[1].snippet.localized.description
  local uploader = data.snippet.channelTitle
  local viewCount = data.statistics.viewCount
  local likeCount = data.statistics.likeCount
  local dislikeCount = data.statistics.dislikeCount
  local commentCount = data.statistics.commentCount
  local totalseconds = convertISO8601Time(data.contentDetails.duration)

  -- convert s to mm:ss
  local seconds = totalseconds % 60
  local minutes = math.floor(totalseconds / 60)
  local minutes = minutes % 60
  local duration = string.format("%02d:%02d",  minutes, seconds)
  
  local text = title..'\n(Hochgeladen von: '..uploader..', '..viewCount..' mal angesehen, '..duration..' Minuten, '..likeCount..' Likes und '..dislikeCount..' Dislikes, '..commentCount..' Kommentare)\n'
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
    "youtube.com/watch%?v=([A-Za-z0-9-_-]+)"
  },
  run = run 
}

end