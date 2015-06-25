local OAuth = require "OAuth"

local consumer_key = cred_data.tw_consumer_key
local consumer_secret = cred_data.tw_consumer_secret
local access_token = cred_data.tw_access_token
local access_token_secret = cred_data.tw_access_token_secret

local client = OAuth.new(consumer_key, consumer_secret, {
    RequestToken = "https://api.twitter.com/oauth/request_token", 
    AuthorizeUser = {"https://api.twitter.com/oauth/authorize", method = "GET"},
    AccessToken = "https://api.twitter.com/oauth/access_token"
}, {
    OAuthToken = access_token,
    OAuthTokenSecret = access_token_secret
})

function run(msg, matches)
  if consumer_key:isempty() then
   return "Twitter Consumer Key ist nicht vorhanden, schreibe ihn in data/credentials.lua"
  end
  if consumer_secret:isempty() then
   return "Twitter Consumer Secret ist nicht vorhanden, schreibe ihn in data/credentials.lua"
  end
  if access_token:isempty() then
   return "Twitter Access Token ist nicht vorhanden, schreibe ihn in data/credentials.lua"
  end
  if access_token_secret:isempty() then
   return "Twitter Access Token Secret ist nicht vorhanden, schreibe ihn in data/credentials.lua"
  end

  local twitter_url = "https://api.twitter.com/1.1/statuses/show/" .. matches[1] .. ".json"
  local response_code, response_headers, response_status_line, response_body = client:PerformRequest("GET", twitter_url)
  local response = json:decode(response_body)

  local header = "Tweet von " .. response.user.name .. " (@" .. response.user.screen_name .. ")\n"
  local text = response.text
  
  -- replace short URLs
  if response.entities.url then
    for k, v in pairs(response.entities.urls) do 
        local short = v.url
        local long = v.expanded_url
        text = text:gsub(short, long)
    end
  end
  
  -- remove images
  local images = {}
  if response.entities.media and response.extended_entities.media then
    for k, v in pairs(response.extended_entities.media) do
        local url = v.url
        local pic = v.media_url
        text = text:gsub(url, "")
        table.insert(images, pic)
    end
  end

  -- send the parts 
  local receiver = get_receiver(msg)
  local text = unescape(text)
  send_msg(receiver, header .. "\n" .. text, ok_cb, false)
  for k, v in pairs(images) do
    local file = download_to_file(v)
    send_photo(receiver, file, ok_cb, false)
    delay_s(1)
  end
  
  return nil
end

return {
    description = "Wenn ein Twitter Link gesendet wird, wird der Tweet gepostet", 
    usage = {"twitter.com Link"},
    patterns = {"https://twitter.com/[^/]+/status/([0-9]+)"}, 
    run = run 
}
