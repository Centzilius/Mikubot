do

local BASE_URL = 'https://www.googleapis.com/youtube/v3'

function table.contains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end

function get_yt_data (yt_code)
  local apikey = cred_data.google_apikey
  local url = BASE_URL..'/videos?part=snippet,statistics,contentDetails&key='..apikey..'&id='..yt_code..'&fields=items(snippet(channelTitle,localized(title,description),thumbnails),statistics(viewCount,likeCount,dislikeCount,commentCount),contentDetails(duration,regionRestriction(blocked)))'
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

function send_youtube_data(data, receiver, link, sendpic)
  local title = data.snippet.localized.title
  -- local description = data.snippet.localized.description
  local uploader = data.snippet.channelTitle
  local viewCount = comma_value(data.statistics.viewCount)
  if data.statistics.likeCount then
    likeCount = ', '..comma_value(data.statistics.likeCount)..' Likes und '
	dislikeCount = comma_value(data.statistics.dislikeCount)..' Dislikes'
  else
    likeCount = ''
	dislikeCount = ''
  end
  local commentCount = comma_value(data.statistics.commentCount)
  local totalseconds = convertISO8601Time(data.contentDetails.duration)
  if data.contentDetails.regionRestriction then
    blocked = data.contentDetails.regionRestriction.blocked
    blocked = table.contains(blocked, "DE")
  else
    blocked = false
  end

  -- convert s to mm:ss
  local seconds = totalseconds % 60
  local minutes = math.floor(totalseconds / 60)
  local minutes = minutes % 60
  local hours = math.floor(totalseconds / 3600)
  local duration = string.format("%02d:%02d:%02d", hours,  minutes, seconds)
  
  text = 'Titel: '..title..'\nUploader: '..uploader..'\nAufrufe: '..viewCount..'\nLänge: '..duration..' Minuten\nLikes: '..likeCount..'\nDislikes: '..dislikeCount..'\nKommentare: '..commentCount..'\n'
  if link then
    text = link..'\n'..text
  end
  
  if blocked then
    text = text..'\nACHTUNG, Video ist in Deutschland geblockt!'
  end
  
  if sendpic then
    if data.snippet.thumbnails.maxres then
      image_url = data.snippet.thumbnails.maxres.url
	elseif data.snippet.thumbnails.high then
	  image_url = data.snippet.thumbnails.high.url
	elseif data.snippet.thumbnails.medium then
	  image_url = data.snippet.thumbnails.medium.url
	elseif data.snippet.thumbnails.standard then
	  image_url = data.snippet.thumbnails.standard.url
	else
	  image_url = data.snippet.thumbnails.default.url
	end
    local cb_extra = {
      receiver = receiver,
      url = image_url
    }
	send_msg(receiver, text, send_photo_from_url_callback, cb_extra)
  else
    send_msg(receiver, text, ok_cb, false)
  end
end

function run(msg, matches)
  local yt_code = matches[1]
  local data = get_yt_data(yt_code)
  local receiver = get_receiver(msg)
  send_youtube_data(data, receiver)
end

return {
  description = "Sendet YouTube-Info.", 
  usage = "URL zu YouTube-Video",
  patterns = {
    "youtu.be/([A-Za-z0-9-_-]+)",
    "youtube.com/watch%?v=([A-Za-z0-9-_-]+)"
  },
  run = run 
}

end