do

local BASE_URL = "http://api.openweathermap.org/data/2.5/weather"


local function get_weather(location)
  print("Finde Wetter in ", location)
  local location = string.gsub(location," ","+")
  local url = BASE_URL
  local apikey = cred_data.owm_apikey
  local url = url..'?q='..location
  local url = url..'&lang=de&units=metric&APPID='..apikey

  local b, c, h = http.request(url)
  if c ~= 200 then return nil end

  local weather = json:decode(b)
  local city = weather.name
  if weather.sys.country == 'none' then
    country = ''
  else
    country = ' ('..weather.sys.country..')'
  end
  local temperature = string.gsub(round(weather.main.temp, 1), "%.", "%,")
  local temp = 'Wetter in '..city..country..':\n'..temperature..'°C'
  local conditions = ' | '..weather.weather[1].description	
  if weather.weather[1].main == 'Clear' then
	conditions = conditions..' ☀'
  elseif weather.weather[1].main == 'Clouds' then
	conditions = conditions..' ☁☁'
  elseif weather.weather[1].main == 'Rain' then
    conditions = conditions..' ☔'
  elseif weather.weather[1].main == 'Thunderstorm' then
	 conditions = conditions..' ☔☔☔☔'
  else
     conditions = conditions..''
  end
  return temp..conditions
end

local function run(msg, matches)
  local city = 'Berlin'

  if matches[1] ~= '/wetter' then 
    city = matches[1]
  end
  local text = get_weather(city)
  if not text then
    text = 'Konnte das Wetter dieser Stadt nicht bekommen.'
  end
  return text
end

return {
    description = "Wetter in dieser Stadt (Berlin ist Standard)", 
    usage = "/wetter (Stadt)",
    patterns = {
	    "^/wetter$",
		"^/wetter(.*)$"}, 
    run = run 
}

end