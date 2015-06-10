do

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
 
    local response_code, response_headers, response_status_line, response_body = 
    client:PerformRequest("POST", "https://api.twitter.com/1.1/statuses/update.json", {
    	status = matches[1]
        })
    if response_code ~= 200 then
    	 return "Fehler: "..response_code
    end
	 local data = json:decode(response_body)
	 return "Tweet gesendet! Sieh ihn dir an: https://twitter.com/Mikubot_/status/"..data.id_str
end

return {
  description = "Sende Tweets auf Twitter! twitter.com/Mikubot_", 
  usage = {"/tw [Text]"},
  patterns = {"^/tw (.+)"}, 
  run = run,
}

end