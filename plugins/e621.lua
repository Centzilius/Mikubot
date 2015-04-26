local https = require 'ssl.https'

function send_title(cb_extra, success, result)
  send_msg(cb_extra[1], string.format('https://e621.net/post/show/%s\nScore: %s, rating: %s\n%s', cb_extra[2][1].id, cb_extra[2][1].score, cb_extra[2][1].rating, cb_extra[2][1].tags), ok_cb, false)
end

function filter_rating(msg)
  local chan_rating = get_db_key('chan:' .. msg.to.id, 'e621')

  if chan_rating == "explicit" then
    return ''
  elseif chan_rating == "mature" then
    return '-rating:explicit'
  else
    return 'rating:safe'
  end
end

function run(msg, matches)
  local reciever = get_receiver(msg)
  local request = ''

  local extra = filter_rating(msg)

  extra = extra .. ' -animation'

  if matches[1] == 'latest' then
    request = 'https://e621.net:443/post/index.json?limit=1&tags=' .. extra
  elseif matches[1] == 'search' then
    request = 'https://e621.net:443/post/index.json?tags=' .. matches[2] .. ' ' .. extra
  else
    return nil
  end

  body, code, headers, status = https.request(request)

  local yiff = json:decode(body)

  if yiff.success ~= nil and not yiff.success then
    return yiff.reason
  end

  local link = yiff[1].sample_url
  local file_path = download_to_file(link:gsub('https', 'http'))

  print(file_path)

  send_photo(reciever, file_path, send_title, { reciever, yiff })

  return nil
end

return {
    description = 'e621 commands [latest, search]',
    usage = '/e621 search [term], /e621 latest',
    patterns = {'^/e621 (latest)', '^/e621 (search) (.+) ?$'},
    run = run
    }