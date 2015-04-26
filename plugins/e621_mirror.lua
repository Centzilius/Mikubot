local https = require 'ssl.https'

function run(msg, matches)
  local reciever = get_receiver(msg)

  body, code, headers, status = https.request('https://e621.net:443/post/show.json?id=' .. matches[1])

  local yiff = json:decode(body)

  local link = yiff.sample_url
  local file_path = download_to_file(link:gsub('https', 'http'))

  send_photo(reciever, file_path, ok_cb, false)

  return nil
end

return {
    description = 'Mirrors e621 posts',
    usage = 'e621.net/post/show/12345',
    patterns = {'e621.net/post/show/([0-9]+)'},
    run = run
    }