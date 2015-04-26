local ltn12 = require("ltn12")
local rex = require("rex_pcre")

function run(msg, matches)
  local cookies = 'a=' .. get_db_key('global', 'faa') .. '; b=' .. get_db_key('global', 'fab')

  local t = {}
  body, code, status, headers = http.request {
    url = 'http://www.furaffinity.net/full/' .. matches[1],
    headers = { Cookie = cookies },
    sink = ltn12.sink.table(t)
  }

  local page = table.concat(t)

  print('Loaded ' .. matches[1])

  local img = rex.match(page, 'img.+submissionImg.+src="(.+?)"')
  local rating = rex.match(page, 'rating".+src="/img/labels/(.+).gif"')

  local chan_rating = get_db_key('chan:' .. msg.to.id, 'fa')

  if chan_rating == "general" or not chan_rating then
    if rating == "explicit" or rating == "mature" then
      return nil
    end
  elseif chan_rating == "mature" then
    if rating == "explicit" then
      return nil
    end
  end

  local file_path = download_to_file('http:' .. img)

  send_photo(get_receiver(msg), file_path, ok_cb, false)

  return nil
end

return {
  description = "Mirrors FA images",
  usage = "furaffinity.net/view/123456",
  patterns = {"furaffinity.net/view/([0-9]+)", "furaffinity.net/full/([0-9]+)"},
  run = run
  }